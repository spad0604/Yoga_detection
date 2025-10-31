package com.yogadetection.service;

import com.yogadetection.dto.request.SubmitPoseInSessionRequest;
import com.yogadetection.dto.response.PracticeSessionResponse;
import org.springframework.web.multipart.MultipartFile;

public interface PracticeSessionService {
    
    /**
     * Bắt đầu session tập routine mới
     */
    PracticeSessionResponse startSession(String userId, String routineId);
    
    /**
     * Lấy thông tin session hiện tại
     */
    PracticeSessionResponse getSession(String userId, String sessionId);
    
    /**
     * Submit ảnh pose trong session và nhận đánh giá từ AI
     */
    PracticeSessionResponse submitPose(String userId, String sessionId, MultipartFile image, SubmitPoseInSessionRequest request);
    
    /**
     * Bỏ qua pose hiện tại (không submit ảnh)
     */
    PracticeSessionResponse skipCurrentPose(String userId, String sessionId);
    
    /**
     * Hoàn thành session
     */
    PracticeSessionResponse completeSession(String userId, String sessionId);
    
    /**
     * Hủy bỏ session
     */
    void abandonSession(String userId, String sessionId);
    
    /**
     * Lấy lịch sử sessions của user theo khoảng thời gian
     */
    java.util.List<PracticeSessionResponse> getSessionHistory(String userId, String startDate, String endDate);
}
