package com.yogadetection.service;

import com.yogadetection.dto.request.PoseLandmarkRequest;
import com.yogadetection.entity.YogaPoseAttempt;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import java.time.OffsetDateTime;
import java.util.Map;

public interface YogaPoseAttemptService {
    
    /**
     * Tạo attempt mới với ảnh upload
     */
    YogaPoseAttempt createAttempt(
            String userId,
            String poseCode,
            MultipartFile imageFile,
            PoseLandmarkRequest landmarkData,
            Double score
    );
    
    /**
     * Lấy danh sách attempts của user với phân trang
     */
    Page<YogaPoseAttempt> getUserAttempts(String userId, int page, int pageSize);
    
    /**
     * Lấy attempts theo pose cụ thể
     */
    Page<YogaPoseAttempt> getUserAttemptsByPose(
            String userId, 
            String poseCode, 
            int page, 
            int pageSize
    );
    
    /**
     * Lấy attempts trong khoảng thời gian
     */
    Page<YogaPoseAttempt> getUserAttemptsByDateRange(
            String userId,
            OffsetDateTime startDate,
            OffsetDateTime endDate,
            int page,
            int pageSize
    );
    
    /**
     * Lấy chi tiết một attempt
     */
    YogaPoseAttempt getAttemptById(String attemptId);
    
    /**
     * Lấy thống kê của user
     */
    Map<String, Object> getUserStatistics(String userId);
    
    /**
     * Lấy thống kê cho một pose cụ thể
     */
    Map<String, Object> getUserPoseStatistics(String userId, String poseCode);
    
    /**
     * Xóa attempt
     */
    void deleteAttempt(String attemptId, String userId);
}
