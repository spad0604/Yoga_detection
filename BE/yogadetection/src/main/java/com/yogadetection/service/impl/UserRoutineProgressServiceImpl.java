package com.yogadetection.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yogadetection.dto.request.UpdateRoutineProgressRequest;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.UserRoutineProgressResponse;
import com.yogadetection.entity.UserRoutineProgress;
import com.yogadetection.entity.YogaRoutine;
import com.yogadetection.exception.EntityNotFoundException;
import com.yogadetection.repository.RoutinePoseRepository;
import com.yogadetection.repository.UserRoutineProgressRepository;
import com.yogadetection.repository.YogaRoutineRepository;
import com.yogadetection.service.UserRoutineProgressService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserRoutineProgressServiceImpl implements UserRoutineProgressService {
    
    private final UserRoutineProgressRepository progressRepository;
    private final YogaRoutineRepository routineRepository;
    private final RoutinePoseRepository routinePoseRepository;
    private final ObjectMapper objectMapper;

    @Override
    @Transactional
    public UserRoutineProgressResponse startOrContinueRoutine(String userId, String routineId) {
        // Kiểm tra routine có tồn tại không
        YogaRoutine routine = routineRepository.findById(routineId)
            .orElseThrow(() -> new EntityNotFoundException("Routine not found with id: " + routineId));
        
        // Kiểm tra user đã có progress chưa
        Optional<UserRoutineProgress> existingProgress = progressRepository.findByUserIdAndRoutineId(userId, routineId);
        
        if (existingProgress.isPresent()) {
            // Nếu đã hoàn thành, reset lại
            UserRoutineProgress progress = existingProgress.get();
            if (progress.getIsCompleted()) {
                resetProgressInternal(progress);
            }
            progress.setLastPracticedAt(OffsetDateTime.now());
            UserRoutineProgress saved = progressRepository.save(progress);
            return mapToResponse(saved, routine);
        } else {
            // Tạo mới progress
            Integer totalPoses = routinePoseRepository.countByRoutineId(routineId);
            
            UserRoutineProgress newProgress = UserRoutineProgress.builder()
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
            
            UserRoutineProgress saved = progressRepository.save(newProgress);
            return mapToResponse(saved, routine);
        }
    }

    @Override
    @Transactional
    public UserRoutineProgressResponse updateProgress(String userId, UpdateRoutineProgressRequest request) {
        UserRoutineProgress progress = progressRepository.findByUserIdAndRoutineId(userId, request.getRoutineId())
            .orElseThrow(() -> new EntityNotFoundException("Progress not found for routine: " + request.getRoutineId()));
        
        YogaRoutine routine = routineRepository.findById(request.getRoutineId())
            .orElseThrow(() -> new EntityNotFoundException("Routine not found with id: " + request.getRoutineId()));
        
        // Parse completed poses
        List<String> completedPoses = parseCompletedPoses(progress.getCompletedPoses());
        
        // Thêm pose mới hoàn thành
        if (!completedPoses.contains(request.getCompletedPoseCode())) {
            completedPoses.add(request.getCompletedPoseCode());
        }
        
        // Update time spent
        int newTimeSpent = progress.getTotalTimeSpentSeconds() + (request.getTimeSpentSeconds() != null ? request.getTimeSpentSeconds() : 0);
        
        // Calculate average score
        double currentTotalScore = progress.getAverageScore() * (completedPoses.size() - 1);
        double newAverageScore = (currentTotalScore + (request.getPoseScore() != null ? request.getPoseScore() : 0.0)) / completedPoses.size();
        
        // Calculate completion percentage
        double completionPercentage = ((double) completedPoses.size() / progress.getTotalPoses()) * 100;
        boolean isCompleted = completedPoses.size() >= progress.getTotalPoses();
        
        // Update progress
        try {
            progress.setCompletedPoses(objectMapper.writeValueAsString(completedPoses));
        } catch (Exception e) {
            throw new RuntimeException("Error serializing completed poses", e);
        }
        
        progress.setCurrentPoseIndex(completedPoses.size());
        progress.setTotalTimeSpentSeconds(newTimeSpent);
        progress.setAverageScore(newAverageScore);
        progress.setCompletionPercentage(completionPercentage);
        progress.setIsCompleted(isCompleted);
        progress.setLastPracticedAt(OffsetDateTime.now());
        
        if (isCompleted && progress.getCompletedAt() == null) {
            progress.setCompletedAt(OffsetDateTime.now());
        }
        
        UserRoutineProgress saved = progressRepository.save(progress);
        return mapToResponse(saved, routine);
    }

    @Override
    public UserRoutineProgressResponse getProgress(String userId, String routineId) {
        UserRoutineProgress progress = progressRepository.findByUserIdAndRoutineId(userId, routineId)
            .orElseThrow(() -> new EntityNotFoundException("Progress not found for routine: " + routineId));
        
        YogaRoutine routine = routineRepository.findById(routineId)
            .orElseThrow(() -> new EntityNotFoundException("Routine not found with id: " + routineId));
        
        return mapToResponse(progress, routine);
    }

    @Override
    public PagedResponse<UserRoutineProgressResponse> getInProgressRoutines(String userId, int page, int size) {
        int pageIndex = Math.max(0, page);
        int pageSize = Math.max(1, size);
        Pageable pageable = PageRequest.of(pageIndex, pageSize);
        
        Page<UserRoutineProgress> progressPage = progressRepository.findInProgressRoutinesByUser(userId, pageable);
        
        List<UserRoutineProgressResponse> responses = progressPage.getContent().stream()
            .map(progress -> {
                YogaRoutine routine = routineRepository.findById(progress.getRoutineId()).orElse(null);
                return mapToResponse(progress, routine);
            })
            .collect(Collectors.toList());
        
        return PagedResponse.<UserRoutineProgressResponse>builder()
            .items(responses)
            .page(progressPage.getNumber())
            .pageSize(progressPage.getSize())
            .totalElements(progressPage.getTotalElements())
            .totalPages(progressPage.getTotalPages())
            .hasNext(progressPage.hasNext())
            .hasPrevious(progressPage.hasPrevious())
            .build();
    }

    @Override
    public PagedResponse<UserRoutineProgressResponse> getCompletedRoutines(String userId, int page, int size) {
        int pageIndex = Math.max(0, page);
        int pageSize = Math.max(1, size);
        Pageable pageable = PageRequest.of(pageIndex, pageSize);
        
        Page<UserRoutineProgress> progressPage = progressRepository.findCompletedRoutinesByUser(userId, pageable);
        
        List<UserRoutineProgressResponse> responses = progressPage.getContent().stream()
            .map(progress -> {
                YogaRoutine routine = routineRepository.findById(progress.getRoutineId()).orElse(null);
                return mapToResponse(progress, routine);
            })
            .collect(Collectors.toList());
        
        return PagedResponse.<UserRoutineProgressResponse>builder()
            .items(responses)
            .page(progressPage.getNumber())
            .pageSize(progressPage.getSize())
            .totalElements(progressPage.getTotalElements())
            .totalPages(progressPage.getTotalPages())
            .hasNext(progressPage.hasNext())
            .hasPrevious(progressPage.hasPrevious())
            .build();   
    }

    @Override
    @Transactional
    public void resetProgress(String userId, String routineId) {
        UserRoutineProgress progress = progressRepository.findByUserIdAndRoutineId(userId, routineId)
            .orElseThrow(() -> new EntityNotFoundException("Progress not found for routine: " + routineId));
        
        resetProgressInternal(progress);
        progressRepository.save(progress);
    }

    @Override
    public UserRoutineStatistics getUserStatistics(String userId) {
        Long totalCompleted = progressRepository.countCompletedRoutinesByUser(userId);
        Double averageScore = progressRepository.getAverageScoreByUser(userId);
        
        // Calculate total time spent
        List<UserRoutineProgress> allProgress = progressRepository.findByUserIdAndIsCompleted(userId, true);
        int totalTimeSeconds = allProgress.stream()
            .mapToInt(p -> p.getTotalTimeSpentSeconds() != null ? p.getTotalTimeSpentSeconds() : 0)
            .sum();
        
        Long inProgress = (long) progressRepository.findByUserIdAndIsCompleted(userId, false).size();
        
        return new UserRoutineStatistics(
            totalCompleted,
            averageScore != null ? averageScore : 0.0,
            totalTimeSeconds / 60,
            inProgress
        );
    }

    private void resetProgressInternal(UserRoutineProgress progress) {
        progress.setCompletedPoses("[]");
        progress.setCurrentPoseIndex(0);
        progress.setIsCompleted(false);
        progress.setCompletionPercentage(0.0);
        progress.setTotalTimeSpentSeconds(0);
        progress.setAverageScore(0.0);
        progress.setCompletedAt(null);
        progress.setLastPracticedAt(OffsetDateTime.now());
    }

    private UserRoutineProgressResponse mapToResponse(UserRoutineProgress progress, YogaRoutine routine) {
        return UserRoutineProgressResponse.builder()
            .id(progress.getId())
            .userId(progress.getUserId())
            .routineId(progress.getRoutineId())
            .routineName(routine != null ? routine.getName() : null)
            .routineImageUrl(routine != null ? routine.getImageUrl() : null)
            .completedPoses(parseCompletedPoses(progress.getCompletedPoses()))
            .totalPoses(progress.getTotalPoses())
            .currentPoseIndex(progress.getCurrentPoseIndex())
            .isCompleted(progress.getIsCompleted())
            .completionPercentage(progress.getCompletionPercentage())
            .totalTimeSpentSeconds(progress.getTotalTimeSpentSeconds())
            .averageScore(progress.getAverageScore())
            .lastPracticedAt(progress.getLastPracticedAt())
            .completedAt(progress.getCompletedAt())
            .createdAt(progress.getCreatedAt())
            .build();
    }

    private List<String> parseCompletedPoses(String json) {
        if (json == null || json.isEmpty()) {
            return new ArrayList<>();
        }
        
        try {
            return objectMapper.readValue(json, new TypeReference<List<String>>() {});
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }
}

