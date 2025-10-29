package com.yogadetection.service;

import com.yogadetection.dto.request.CreateBodyProgressRequest;
import com.yogadetection.dto.request.UpdateBodyProgressRequest;
import com.yogadetection.dto.response.BodyProgressResponse;
import com.yogadetection.dto.response.PagedResponse;

import java.time.OffsetDateTime;
import java.util.List;

public interface BodyProgressService {
    
    /**
     * Tạo mới một body progress record
     */
    BodyProgressResponse createBodyProgress(String userId, CreateBodyProgressRequest request);
    
    /**
     * Cập nhật body progress record
     */
    BodyProgressResponse updateBodyProgress(String userId, String progressId, UpdateBodyProgressRequest request);
    
    /**
     * Xóa body progress record
     */
    void deleteBodyProgress(String userId, String progressId);
    
    /**
     * Lấy chi tiết một body progress record
     */
    BodyProgressResponse getBodyProgressById(String userId, String progressId);
    
    /**
     * Lấy danh sách body progress records của user với phân trang
     */
    PagedResponse<BodyProgressResponse> getUserBodyProgress(String userId, int page, int size);
    
    /**
     * Lấy tất cả body progress records của user
     */
    List<BodyProgressResponse> getAllUserBodyProgress(String userId);
    
    /**
     * Lấy body progress record mới nhất của user
     */
    BodyProgressResponse getLatestBodyProgress(String userId);
    
    /**
     * Lấy body progress records trong khoảng thời gian
     */
    List<BodyProgressResponse> getBodyProgressByDateRange(String userId, OffsetDateTime startDate, OffsetDateTime endDate);
}

