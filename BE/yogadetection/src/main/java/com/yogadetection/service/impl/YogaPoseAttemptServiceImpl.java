package com.yogadetection.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yogadetection.dto.request.PoseLandmarkRequest;
import com.yogadetection.entity.YogaPoseAttempt;
import com.yogadetection.entity.YogaPoseDetails;
import com.yogadetection.exception.EntityNotFoundException;
import com.yogadetection.exception.UnauthorizedException;
import com.yogadetection.repository.YogaPoseAttemptRepository;
import com.yogadetection.repository.YogaPoseDetailsRepository;
import com.yogadetection.service.AIPoseEvaluationService;
import com.yogadetection.service.ImageService;
import com.yogadetection.service.YogaPoseAttemptService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.time.OffsetDateTime;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class YogaPoseAttemptServiceImpl implements YogaPoseAttemptService {
    
    private final YogaPoseAttemptRepository attemptRepository;
    private final YogaPoseDetailsRepository poseDetailsRepository;
    private final ImageService imageService;
    private final ObjectMapper objectMapper;
    private final AIPoseEvaluationService aiEvaluationService;

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
        if (imageFile != null && !imageFile.isEmpty()) {
            imageUrl = imageService.uploadImage(imageFile, userId);
        }
        
        // Gọi AI để đánh giá tư thế
        AIPoseEvaluationService.EvaluationResult evaluation = null;
        if (imageUrl != null && landmarkData != null) {
            evaluation = aiEvaluationService.evaluatePose(imageUrl, landmarkData, poseCode);
            log.info("AI evaluation for pose {}: score={}, feedback length={}", 
                    poseCode, evaluation.getScore(), evaluation.getFeedback().length());
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
        
        return attempt;
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
