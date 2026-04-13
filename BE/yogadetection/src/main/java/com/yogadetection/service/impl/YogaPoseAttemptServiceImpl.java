package com.yogadetection.service.impl;

import java.time.OffsetDateTime;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yogadetection.dto.request.PoseLandmarkRequest;
import com.yogadetection.entity.Notification;
import com.yogadetection.entity.User;
import com.yogadetection.entity.YogaPoseAttempt;
import com.yogadetection.entity.YogaPoseDetails;
import com.yogadetection.exception.EntityNotFoundException;
import com.yogadetection.exception.UnauthorizedException;
import com.yogadetection.repository.UserRepository;
import com.yogadetection.repository.YogaPoseAttemptRepository;
import com.yogadetection.repository.YogaPoseDetailsRepository;
import com.yogadetection.service.AIPoseEvaluationService;
import com.yogadetection.service.FcmService;
import com.yogadetection.service.ImageService;
import com.yogadetection.service.NotificationService;
import com.yogadetection.service.PoseModelService;
import com.yogadetection.service.SocketIOService;
import com.yogadetection.service.YogaPoseAttemptService;
import com.yogadetection.service.PoseModelService.PoseModelAnalysis;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class YogaPoseAttemptServiceImpl implements YogaPoseAttemptService {

    @Value("${pose.model.wrong-pose-min-confidence:0.30}")
    private double wrongPoseMinConfidence;
    
    private final YogaPoseAttemptRepository attemptRepository;
    private final YogaPoseDetailsRepository poseDetailsRepository;
    private final UserRepository userRepository;
    private final ImageService imageService;
    private final ObjectMapper objectMapper;
    private final AIPoseEvaluationService aiEvaluationService;
    private final PoseModelService poseModelService;
    private final FcmService fcmService;
    private final SocketIOService socketIOService;
    private final NotificationService notificationService;

    @Override
    @Transactional
    public YogaPoseAttempt createAttempt(
            String userId,
            String poseCode,
            MultipartFile imageFile,
            PoseLandmarkRequest landmarkData,
            Double score
    ) {
        // Lấy thông tin pose
        YogaPoseDetails poseDetails = poseDetailsRepository.getYogaPoseDetails(poseCode);
        if (poseDetails == null) {
            throw new EntityNotFoundException("Pose not found with code: " + poseCode);
        }
        
        // Upload ảnh lên Cloudinary
        String imageUrl = null;
        Integer imageWidth = null;
        Integer imageHeight = null;
        if (imageFile != null && !imageFile.isEmpty()) {
            try {
                BufferedImage img = ImageIO.read(new ByteArrayInputStream(imageFile.getBytes()));
                if (img != null) {
                    imageWidth = img.getWidth();
                    imageHeight = img.getHeight();
                }
            } catch (Exception e) {
                log.debug("Could not read image dimensions: {}", e.getMessage());
            }
            imageUrl = imageService.uploadImage(imageFile, userId);
        }

        // 1) Run pose classification model (Yoga-82) first
        PoseModelAnalysis analysis = null;
        try {
            if (landmarkData != null && landmarkData.getLandmarks() != null && !landmarkData.getLandmarks().isEmpty()) {
                var normalized = PoseLandmarkNormalizer.normalize(landmarkData.getLandmarks(), imageWidth, imageHeight);
                analysis = poseModelService.analyze(normalized).orElse(null);
            }
        } catch (Exception e) {
            log.warn("Pose model analysis failed (ignored). Will continue to call LLM if image is available. Reason: {}", e.getMessage());
        }
        
        AIPoseEvaluationService.EvaluationResult evaluation = null;

        // 2) Check if user is doing the expected pose; if not, return deterministic "wrong pose" feedback
        boolean wrongPose = false;
        if (analysis != null && analysis.getConfidence() >= wrongPoseMinConfidence) {
            boolean likelySame = PoseNameMatcher.isLikelySamePose(poseDetails.getName(), analysis.getPredictedPose());
            wrongPose = !likelySame;
            if (wrongPose) {
                log.info(
                        "Wrong pose detected: expected='{}', predicted='{}', confidence={} (threshold={})",
                        poseDetails.getName(),
                        analysis.getPredictedPose(),
                        analysis.getConfidence(),
                        wrongPoseMinConfidence
                );
            }
        }

        // NOTE: Do NOT gate LLM call by pose-model result.
        // The pose-model signals (pose + confidence + angles) are supplemental context for the LLM.
        if (imageFile != null && !imageFile.isEmpty()) {
            log.info("Calling AI evaluation for pose {} with direct uploaded image", poseCode);
            evaluation = aiEvaluationService.evaluatePose(
                imageFile,
                    landmarkData,
                    poseCode,
                    poseDetails.getName(),
                    poseDetails.getDescription(),
                    analysis
            );
            log.info("AI evaluation completed for pose {}: score={}, feedback length={}",
                    poseCode,
                    evaluation.getScore(),
                    evaluation.getFeedback() != null ? evaluation.getFeedback().length() : 0);
        } else if (analysis != null) {
            evaluation = new AIPoseEvaluationService.EvaluationResult(
                    0.0,
                    PoseFeedbackTemplate.buildFallbackFeedback(poseDetails.getName(), analysis)
            );
        } else {
            log.warn("No image provided and no model analysis available; AI evaluation skipped");
        }
        
        // Convert landmarks to JSON string
        String landmarksJson = null;
        try {
            if (landmarkData != null && landmarkData.getLandmarks() != null) {
                landmarksJson = objectMapper.writeValueAsString(landmarkData.getLandmarks());
            }
        } catch (Exception e) {
            log.error("Failed to serialize landmarks: {}", e.getMessage());
        }
        
        // Tạo attempt với kết quả từ AI
        YogaPoseAttempt attempt = YogaPoseAttempt.builder()
                .userId(userId)
                .poseCode(poseCode)
                .poseName(poseDetails.getName())
                .imageUrl(imageUrl)
                .score(evaluation != null ? evaluation.getScore() : score) // Ưu tiên AI score
                .feedback(evaluation != null ? evaluation.getFeedback() : null)
                .landmarksData(landmarksJson)
                .build();
        
        attempt = attemptRepository.save(attempt);
        log.info("Created pose attempt {} for user {} with AI score {}", 
                attempt.getId(), userId, attempt.getScore());
        
        // Gửi kết quả về client qua WebSocket và FCM
        sendResultToClient(userId, attempt);
        
        return attempt;
    }
    
    /**
     * Gửi kết quả chấm điểm về client qua Socket.IO và Firebase
     */
    private void sendResultToClient(String userId, YogaPoseAttempt attempt) {
        try {
            // Lấy thông tin user để gửi notification
            User user = userRepository.findById(userId)
                    .orElse(null);
            
            if (user != null) {
                // 1. Gửi qua Socket.IO (real-time)
                boolean socketSent = socketIOService.sendPoseResult(
                        userId,
                        attempt.getId(),
                        attempt.getPoseName(),
                        attempt.getScore(),
                        attempt.getFeedback()
                );
                log.info("Socket.IO result sent: {} for attempt {}", socketSent, attempt.getId());
                
                // 2. Gửi qua Firebase Cloud Messaging (push notification)
                if (user.getFcmToken() != null && !user.getFcmToken().isEmpty()) {
                    String title = String.format("🎯 Kết quả: %s", attempt.getPoseName());
                    String body = String.format("Điểm: %.1f/100 - %s", 
                            attempt.getScore() != null ? attempt.getScore() : 0.0,
                            attempt.getFeedback() != null && attempt.getFeedback().length() > 50 
                                ? attempt.getFeedback().substring(0, 50) + "..." 
                                : attempt.getFeedback());
                    
                    boolean fcmSent = fcmService.sendNotification(user.getFcmToken(), title, body);
                    log.info("FCM notification sent: {} for attempt {}", fcmSent, attempt.getId());

                    // 3. Lưu notification vào database để user có thể xem lại
                    try {
                        Notification notification = Notification.builder()
                                .isAll(false)
                                .userId(user.getId())
                                .type("POSE_RESULT")
                                .referenceId(attempt.getId())
                                .normalTitle(title)
                                .htmlTitle(String.format("<strong>🎯 Kết quả: %s</strong>", attempt.getPoseName()))
                                .normalBody(String.format("Điểm: %.1f/100\n\nNhận xét từ AI:\n%s", 
                                        attempt.getScore() != null ? attempt.getScore() : 0.0,
                                        attempt.getFeedback() != null ? attempt.getFeedback() : "Không có nhận xét"))
                                .htmlBody(String.format(
                                        "<p><strong>Điểm số:</strong> %.1f/100</p>" +
                                        "<p><strong>Nhận xét từ AI:</strong></p>" +
                                        "<p>%s</p>",
                                        attempt.getScore() != null ? attempt.getScore() : 0.0,
                                        attempt.getFeedback() != null ? attempt.getFeedback().replace("\n", "<br>") : "Không có nhận xét"))
                                .imageUrl(attempt.getImageUrl())
                                .isRead(false)
                                .build();
                        
                        notificationService.saveNotification(notification);
                        log.info("Notification saved to database for attempt {}", attempt.getId());
                    } catch (Exception ex) {
                        log.error("Failed to save notification for attempt {}: {}", attempt.getId(), ex.getMessage(), ex);
                    }
                }
            }
        } catch (Exception e) {
            log.error("Failed to send result to client for attempt {}: {}", 
                    attempt.getId(), e.getMessage(), e);
            // Không throw exception để không ảnh hưởng đến việc lưu attempt
        }
    }

    @Override
    public Page<YogaPoseAttempt> getUserAttempts(String userId, int page, int pageSize) {
        Pageable pageable = PageRequest.of(page, pageSize);
        return attemptRepository.findByUserIdOrderByCreatedAtDesc(userId, pageable);
    }

    @Override
    public Page<YogaPoseAttempt> getUserAttemptsByPose(
            String userId, 
            String poseCode, 
            int page, 
            int pageSize
    ) {
        Pageable pageable = PageRequest.of(page, pageSize);
        return attemptRepository.findByUserIdAndPoseCodeOrderByCreatedAtDesc(
                userId, poseCode, pageable);
    }

    @Override
    public Page<YogaPoseAttempt> getUserAttemptsByDateRange(
            String userId,
            OffsetDateTime startDate,
            OffsetDateTime endDate,
            int page,
            int pageSize
    ) {
        Pageable pageable = PageRequest.of(page, pageSize);
        return attemptRepository.findByUserIdAndDateRange(
                userId, startDate, endDate, pageable);
    }

    @Override
    public YogaPoseAttempt getAttemptById(String attemptId) {
        return attemptRepository.findById(attemptId)
                .orElseThrow(() -> new EntityNotFoundException(
                        "Attempt not found with id: " + attemptId));
    }

    @Override
    public Map<String, Object> getUserStatistics(String userId) {
        Map<String, Object> stats = new HashMap<>();
        
        stats.put("totalAttempts", attemptRepository.countByUserId(userId));
        
        return stats;
    }

    @Override
    public Map<String, Object> getUserPoseStatistics(String userId, String poseCode) {
        Map<String, Object> stats = new HashMap<>();
        
        stats.put("totalAttempts", attemptRepository.countByUserIdAndPoseCode(userId, poseCode));
        stats.put("averageScore", attemptRepository.getAverageScoreByUserAndPose(userId, poseCode));
        stats.put("highestScore", attemptRepository.getHighestScoreByUserAndPose(userId, poseCode));
        
        return stats;
    }

    @Override
    @Transactional
    public void deleteAttempt(String attemptId, String userId) {
        YogaPoseAttempt attempt = getAttemptById(attemptId);
        
        if (!attempt.getUserId().equals(userId)) {
            throw new UnauthorizedException();
        }
        
        attemptRepository.delete(attempt);
        log.info("Deleted attempt {} by user {}", attemptId, userId);
    }
}
