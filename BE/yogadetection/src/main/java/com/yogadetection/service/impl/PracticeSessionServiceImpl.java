package com.yogadetection.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yogadetection.dto.request.SubmitPoseInSessionRequest;
import com.yogadetection.dto.response.PracticeSessionResponse;
import com.yogadetection.entity.PracticeSession;
import com.yogadetection.entity.RoutinePose;
import com.yogadetection.entity.UserRoutineProgress;
import com.yogadetection.entity.YogaPoseDetails;
import com.yogadetection.entity.YogaRoutine;
import com.yogadetection.exception.EntityNotFoundException;
import com.yogadetection.repository.PracticeSessionRepository;
import com.yogadetection.repository.RoutinePoseRepository;
import com.yogadetection.repository.UserRoutineProgressRepository;
import com.yogadetection.repository.YogaPoseDetailsRepository;
import com.yogadetection.repository.YogaRoutineRepository;
import com.yogadetection.service.AIPoseEvaluationService;
import com.yogadetection.service.ImageService;
import com.yogadetection.service.PracticeSessionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class PracticeSessionServiceImpl implements PracticeSessionService {
    
    private final PracticeSessionRepository sessionRepository;
    private final YogaRoutineRepository routineRepository;
    private final RoutinePoseRepository routinePoseRepository;
    private final YogaPoseDetailsRepository poseDetailsRepository;
    private final UserRoutineProgressRepository progressRepository;
    private final ImageService imageService;
    private final AIPoseEvaluationService aiEvaluationService;
    private final ObjectMapper objectMapper;

    @Override
    @Transactional
    public PracticeSessionResponse startSession(String userId, String routineId) {
        log.info("Starting practice session for user: {} and routine: {}", userId, routineId);
        
        // Validate routine exists
        YogaRoutine routine = routineRepository.findById(routineId)
            .orElseThrow(() -> new EntityNotFoundException("Routine not found with id: " + routineId));
        
        // Check if there's an existing in-progress session
        sessionRepository.findLatestInProgressSession(userId, routineId)
            .ifPresent(existingSession -> {
                // Abandon old session
                existingSession.setStatus(PracticeSession.SessionStatus.ABANDONED);
                sessionRepository.save(existingSession);
                log.info("Abandoned previous in-progress session: {}", existingSession.getId());
            });
        
        // Get routine poses
        List<RoutinePose> poses = routinePoseRepository.findByRoutineIdOrderByOrderIndexAsc(routineId);
        if (poses.isEmpty()) {
            throw new EntityNotFoundException("No poses found for routine: " + routineId);
        }
        
        // Create new session
        PracticeSession session = PracticeSession.builder()
            .userId(userId)
            .routineId(routineId)
            .status(PracticeSession.SessionStatus.IN_PROGRESS)
            .currentPoseIndex(0)
            .totalPoses(poses.size())
            .completedPoses("[]")
            .submissions("[]")
            .averageScore(0.0)
            .totalTimeSpentSeconds(0)
            .startedAt(OffsetDateTime.now())
            .build();
        
        session = sessionRepository.save(session);
        log.info("Created new practice session: {}", session.getId());
        
        return buildSessionResponse(session, routine, poses);
    }

    @Override
    public PracticeSessionResponse getSession(String userId, String sessionId) {
        PracticeSession session = sessionRepository.findByIdAndUserId(sessionId, userId)
            .orElseThrow(() -> new EntityNotFoundException("Session not found: " + sessionId));
        
        YogaRoutine routine = routineRepository.findById(session.getRoutineId())
            .orElseThrow(() -> new EntityNotFoundException("Routine not found: " + session.getRoutineId()));
        
        List<RoutinePose> poses = routinePoseRepository.findByRoutineIdOrderByOrderIndexAsc(session.getRoutineId());
        
        return buildSessionResponse(session, routine, poses);
    }

    @Override
    @Transactional
    public PracticeSessionResponse submitPose(String userId, String sessionId, MultipartFile image, SubmitPoseInSessionRequest request) {
        log.info("Submitting pose for session: {}, pose: {}", sessionId, request.getPoseCode());
        
        PracticeSession session = sessionRepository.findByIdAndUserId(sessionId, userId)
            .orElseThrow(() -> new EntityNotFoundException("Session not found: " + sessionId));
        
        if (session.getStatus() != PracticeSession.SessionStatus.IN_PROGRESS) {
            throw new IllegalStateException("Session is not in progress");
        }
        
        YogaRoutine routine = routineRepository.findById(session.getRoutineId())
            .orElseThrow(() -> new EntityNotFoundException("Routine not found"));
        
        List<RoutinePose> poses = routinePoseRepository.findByRoutineIdOrderByOrderIndexAsc(session.getRoutineId());
        
        // Get current pose
        if (session.getCurrentPoseIndex() >= poses.size()) {
            throw new IllegalStateException("All poses have been completed");
        }
        
        RoutinePose currentPose = poses.get(session.getCurrentPoseIndex());
        if (!currentPose.getPoseCode().equals(request.getPoseCode())) {
            throw new IllegalArgumentException("Pose code mismatch. Expected: " + currentPose.getPoseCode() + ", Got: " + request.getPoseCode());
        }
        
        // Upload image
        String imageUrl = null;
        if (image != null && !image.isEmpty()) {
            imageUrl = imageService.uploadImage(image, userId);
            log.info("Uploaded pose image: {}", imageUrl);
        }
        
        // Get pose details for AI evaluation
        String poseDescription = null;
        try {
            YogaPoseDetails poseDetails = poseDetailsRepository.getYogaPoseDetails(currentPose.getPoseCode());
            if (poseDetails != null) {
                poseDescription = poseDetails.getDescription();
            }
        } catch (Exception e) {
            log.warn("Failed to get pose details for AI evaluation: {}", e.getMessage());
        }
        
        // Evaluate pose with AI - sử dụng thông tin từ routine_pose và pose_details
        AIPoseEvaluationService.EvaluationResult evaluation = null;
        if (imageUrl != null && request.getLandmarkData() != null) {
            try {
                // Truyền poseName từ routine_pose và description từ pose_details
                evaluation = aiEvaluationService.evaluatePose(
                    imageUrl, 
                    request.getLandmarkData(), 
                    request.getPoseCode(),
                    currentPose.getPoseName(),
                    poseDescription != null ? poseDescription : "Không có mô tả"
                );
                log.info("AI evaluation completed: score={}, feedback length={}", 
                    evaluation.getScore(), evaluation.getFeedback().length());
            } catch (Exception e) {
                log.error("AI evaluation failed: {}", e.getMessage(), e);
                // Continue without AI evaluation
            }
        }
        
        // Create submission result
        PracticeSessionResponse.PoseSubmissionResult submission = PracticeSessionResponse.PoseSubmissionResult.builder()
            .poseCode(request.getPoseCode())
            .poseName(currentPose.getPoseName())
            .imageUrl(imageUrl)
            .score(evaluation != null ? evaluation.getScore() : 0.0)
            .feedback(evaluation != null ? evaluation.getFeedback() : "Không có đánh giá AI")
            .timeSpentSeconds(request.getTimeSpentSeconds() != null ? request.getTimeSpentSeconds() : 0)
            .submittedAt(OffsetDateTime.now())
            .build();
        
        // Update session
        List<PracticeSessionResponse.PoseSubmissionResult> submissions = parseSubmissions(session.getSubmissions());
        submissions.add(submission);
        
        List<String> completedPoses = parseCompletedPoses(session.getCompletedPoses());
        completedPoses.add(request.getPoseCode());
        
        // Calculate new average score
        double totalScore = submissions.stream()
            .mapToDouble(PracticeSessionResponse.PoseSubmissionResult::getScore)
            .sum();
        double averageScore = submissions.isEmpty() ? 0.0 : totalScore / submissions.size();
        
        // Calculate total time spent
        int totalTime = submissions.stream()
            .mapToInt(PracticeSessionResponse.PoseSubmissionResult::getTimeSpentSeconds)
            .sum();
        
        try {
            session.setSubmissions(objectMapper.writeValueAsString(submissions));
            session.setCompletedPoses(objectMapper.writeValueAsString(completedPoses));
        } catch (Exception e) {
            log.error("Failed to serialize session data", e);
            throw new RuntimeException("Failed to update session data");
        }
        
        session.setAverageScore(averageScore);
        session.setTotalTimeSpentSeconds(totalTime);
        session.setCurrentPoseIndex(session.getCurrentPoseIndex() + 1);
        
        // Check if all poses are completed
        if (session.getCurrentPoseIndex() >= poses.size()) {
            session.setStatus(PracticeSession.SessionStatus.COMPLETED);
            session.setCompletedAt(OffsetDateTime.now());
            log.info("Session completed: {}", sessionId);
            
            // Update user routine progress
            updateUserProgress(userId, routine.getId(), submissions, totalTime, averageScore);
        }
        
        session = sessionRepository.save(session);
        
        return buildSessionResponse(session, routine, poses);
    }

    @Override
    @Transactional
    public PracticeSessionResponse skipCurrentPose(String userId, String sessionId) {
        PracticeSession session = sessionRepository.findByIdAndUserId(sessionId, userId)
            .orElseThrow(() -> new EntityNotFoundException("Session not found: " + sessionId));
        
        if (session.getStatus() != PracticeSession.SessionStatus.IN_PROGRESS) {
            throw new IllegalStateException("Session is not in progress");
        }
        
        YogaRoutine routine = routineRepository.findById(session.getRoutineId())
            .orElseThrow(() -> new EntityNotFoundException("Routine not found"));
        
        List<RoutinePose> poses = routinePoseRepository.findByRoutineIdOrderByOrderIndexAsc(session.getRoutineId());
        
        // Move to next pose
        session.setCurrentPoseIndex(session.getCurrentPoseIndex() + 1);
        
        // Check if all poses are completed
        if (session.getCurrentPoseIndex() >= poses.size()) {
            session.setStatus(PracticeSession.SessionStatus.COMPLETED);
            session.setCompletedAt(OffsetDateTime.now());
            log.info("Session completed after skipping: {}", sessionId);
            
            // Update progress even with skipped poses
            List<PracticeSessionResponse.PoseSubmissionResult> submissions = parseSubmissions(session.getSubmissions());
            updateUserProgress(userId, routine.getId(), submissions, session.getTotalTimeSpentSeconds(), session.getAverageScore());
        }
        
        session = sessionRepository.save(session);
        
        return buildSessionResponse(session, routine, poses);
    }

    @Override
    @Transactional
    public PracticeSessionResponse completeSession(String userId, String sessionId) {
        PracticeSession session = sessionRepository.findByIdAndUserId(sessionId, userId)
            .orElseThrow(() -> new EntityNotFoundException("Session not found: " + sessionId));
        
        if (session.getStatus() == PracticeSession.SessionStatus.COMPLETED) {
            // Already completed, just return response
            YogaRoutine routine = routineRepository.findById(session.getRoutineId())
                .orElseThrow(() -> new EntityNotFoundException("Routine not found"));
            List<RoutinePose> poses = routinePoseRepository.findByRoutineIdOrderByOrderIndexAsc(session.getRoutineId());
            return buildSessionResponse(session, routine, poses);
        }
        
        // Mark as completed
        session.setStatus(PracticeSession.SessionStatus.COMPLETED);
        session.setCompletedAt(OffsetDateTime.now());
        
        YogaRoutine routine = routineRepository.findById(session.getRoutineId())
            .orElseThrow(() -> new EntityNotFoundException("Routine not found"));
        
        // Update user progress
        List<PracticeSessionResponse.PoseSubmissionResult> submissions = parseSubmissions(session.getSubmissions());
        updateUserProgress(userId, routine.getId(), submissions, session.getTotalTimeSpentSeconds(), session.getAverageScore());
        
        session = sessionRepository.save(session);
        
        List<RoutinePose> poses = routinePoseRepository.findByRoutineIdOrderByOrderIndexAsc(session.getRoutineId());
        return buildSessionResponse(session, routine, poses);
    }

    @Override
    @Transactional
    public void abandonSession(String userId, String sessionId) {
        PracticeSession session = sessionRepository.findByIdAndUserId(sessionId, userId)
            .orElseThrow(() -> new EntityNotFoundException("Session not found: " + sessionId));
        
        session.setStatus(PracticeSession.SessionStatus.ABANDONED);
        sessionRepository.save(session);
        
        log.info("Session abandoned: {}", sessionId);
    }

    // Helper methods
    
    private void updateUserProgress(String userId, String routineId, List<PracticeSessionResponse.PoseSubmissionResult> submissions, int totalTime, double avgScore) {
        try {
            UserRoutineProgress progress = progressRepository.findByUserIdAndRoutineId(userId, routineId)
                .orElseGet(() -> {
                    Integer totalPoses = routinePoseRepository.countByRoutineId(routineId);
                    return UserRoutineProgress.builder()
                        .userId(userId)
                        .routineId(routineId)
                        .completedPoses("[]")
                        .totalPoses(totalPoses)
                        .currentPoseIndex(0)
                        .isCompleted(false)
                        .completionPercentage(0.0)
                        .totalTimeSpentSeconds(0)
                        .averageScore(0.0)
                        .lastPracticedAt(OffsetDateTime.now())
                        .build();
                });
            
            // Update progress
            List<String> completedPoses = submissions.stream()
                .map(PracticeSessionResponse.PoseSubmissionResult::getPoseCode)
                .distinct()
                .collect(Collectors.toList());
            
            progress.setCompletedPoses(objectMapper.writeValueAsString(completedPoses));
            progress.setCurrentPoseIndex(completedPoses.size());
            progress.setTotalTimeSpentSeconds((progress.getTotalTimeSpentSeconds() != null ? progress.getTotalTimeSpentSeconds() : 0) + totalTime);
            progress.setAverageScore(avgScore);
            
            // Calculate completion percentage
            double completionPercentage = progress.getTotalPoses() > 0 
                ? (double) completedPoses.size() / progress.getTotalPoses() * 100.0 
                : 0.0;
            progress.setCompletionPercentage(completionPercentage);
            
            // Mark as completed if all poses done
            if (completedPoses.size() >= progress.getTotalPoses()) {
                progress.setIsCompleted(true);
                if (progress.getCompletedAt() == null) {
                    progress.setCompletedAt(OffsetDateTime.now());
                }
            }
            
            progress.setLastPracticedAt(OffsetDateTime.now());
            
            progressRepository.save(progress);
            log.info("Updated user routine progress for user: {} routine: {}", userId, routineId);
            
        } catch (Exception e) {
            log.error("Failed to update user routine progress", e);
        }
    }
    
    private PracticeSessionResponse buildSessionResponse(PracticeSession session, YogaRoutine routine, List<RoutinePose> poses) {
        List<PracticeSessionResponse.PoseSubmissionResult> submissions = parseSubmissions(session.getSubmissions());
        List<String> completedPoses = parseCompletedPoses(session.getCompletedPoses());
        
        // Build all poses info
        List<PracticeSessionResponse.RoutinePoseInfo> allPoses = poses.stream()
            .map(pose -> {
                YogaPoseDetails details = null;
                try {
                    details = poseDetailsRepository.getYogaPoseDetails(pose.getPoseCode());
                } catch (Exception ignored) {}
                
                return PracticeSessionResponse.RoutinePoseInfo.builder()
                    .poseCode(pose.getPoseCode())
                    .poseName(pose.getPoseName())
                    .orderIndex(pose.getOrderIndex())
                    .durationSeconds(pose.getDurationSeconds())
                    .imageUrl(details != null ? details.getImageUrl() : null)
                    .isCompleted(completedPoses.contains(pose.getPoseCode()))
                    .build();
            })
            .collect(Collectors.toList());
        
        // Get current pose info
        String currentPoseCode = null;
        String currentPoseName = null;
        String currentPoseDescription = null;
        String currentPoseImageUrl = null;
        Integer currentPoseDuration = null;
        
        if (session.getCurrentPoseIndex() < poses.size()) {
            RoutinePose currentPose = poses.get(session.getCurrentPoseIndex());
            currentPoseCode = currentPose.getPoseCode();
            currentPoseName = currentPose.getPoseName();
            currentPoseDuration = currentPose.getDurationSeconds();
            
            try {
                YogaPoseDetails details = poseDetailsRepository.getYogaPoseDetails(currentPoseCode);
                if (details != null) {
                    currentPoseDescription = details.getDescription();
                    currentPoseImageUrl = details.getImageUrl();
                }
            } catch (Exception ignored) {}
        }
        
        return PracticeSessionResponse.builder()
            .sessionId(session.getId())
            .routineId(session.getRoutineId())
            .routineName(routine.getName())
            .userId(session.getUserId())
            .status(PracticeSessionResponse.SessionStatus.valueOf(session.getStatus().name()))
            .currentPoseIndex(session.getCurrentPoseIndex())
            .totalPoses(session.getTotalPoses())
            .currentPoseCode(currentPoseCode)
            .currentPoseName(currentPoseName)
            .currentPoseDescription(currentPoseDescription)
            .currentPoseImageUrl(currentPoseImageUrl)
            .currentPoseDurationSeconds(currentPoseDuration)
            .allPoses(allPoses)
            .completedPoses(submissions)
            .averageScore(session.getAverageScore())
            .totalTimeSpentSeconds(session.getTotalTimeSpentSeconds())
            .startedAt(session.getStartedAt())
            .completedAt(session.getCompletedAt())
            .build();
    }
    
    private List<PracticeSessionResponse.PoseSubmissionResult> parseSubmissions(String json) {
        try {
            if (json == null || json.isEmpty() || "[]".equals(json)) {
                return new ArrayList<>();
            }
            return objectMapper.readValue(json, new TypeReference<List<PracticeSessionResponse.PoseSubmissionResult>>() {});
        } catch (Exception e) {
            log.error("Failed to parse submissions JSON", e);
            return new ArrayList<>();
        }
    }
    
    private List<String> parseCompletedPoses(String json) {
        try {
            if (json == null || json.isEmpty() || "[]".equals(json)) {
                return new ArrayList<>();
            }
            return objectMapper.readValue(json, new TypeReference<List<String>>() {});
        } catch (Exception e) {
            log.error("Failed to parse completed poses JSON", e);
            return new ArrayList<>();
        }
    }
    
    @Override
    public List<PracticeSessionResponse> getSessionHistory(String userId, String startDate, String endDate) {
        log.info("Getting session history for user: {}, startDate: {}, endDate: {}", userId, startDate, endDate);
        
        List<PracticeSession> sessions;
        
        if (startDate != null && endDate != null) {
            try {
                OffsetDateTime start = OffsetDateTime.parse(startDate);
                OffsetDateTime end = OffsetDateTime.parse(endDate);
                sessions = sessionRepository.findByUserIdAndStartedAtBetweenOrderByStartedAtDesc(userId, start, end);
            } catch (Exception e) {
                log.error("Failed to parse dates, returning all completed sessions", e);
                sessions = sessionRepository.findByUserIdAndStatusOrderByStartedAtDesc(userId, PracticeSession.SessionStatus.COMPLETED);
            }
        } else {
            // Nếu không có date filter, lấy tất cả sessions đã hoàn thành
            sessions = sessionRepository.findByUserIdAndStatusOrderByStartedAtDesc(userId, PracticeSession.SessionStatus.COMPLETED);
        }

        return sessions.stream()
                .map(session -> {
                    YogaRoutine routine = routineRepository.findById(session.getRoutineId())
                            .orElseThrow(() -> new EntityNotFoundException("Routine not found: " + session.getRoutineId()));
                    List<RoutinePose> poses = routinePoseRepository.findByRoutineIdOrderByOrderIndexAsc(session.getRoutineId());
                    return buildSessionResponse(session, routine, poses);
                })
                .collect(Collectors.toList());

    }
}
