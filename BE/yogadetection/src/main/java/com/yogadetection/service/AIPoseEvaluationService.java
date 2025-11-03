package com.yogadetection.service;

import com.yogadetection.dto.request.PoseLandmarkRequest;

public interface AIPoseEvaluationService {
    
    /**
     * Đánh giá tư thế yoga bằng AI
     * @param imageUrl URL ảnh tư thế
     * @param landmarkData Dữ liệu 33 landmarks
     * @param poseCode Mã tư thế cần đánh giá
     * @param poseName Tên tư thế (từ routine_pose)
     * @param poseDescription Mô tả tư thế (từ routine_pose)
     * @return Object chứa score và feedback
     */
    EvaluationResult evaluatePose(String imageUrl, PoseLandmarkRequest landmarkData, String poseCode, String poseName, String poseDescription);
    
    /**
     * Result class cho kết quả đánh giá
     */
    class EvaluationResult {
        private Double score;
        private String feedback;
        
        public EvaluationResult(Double score, String feedback) {
            this.score = score;
            this.feedback = feedback;
        }
        
        public Double getScore() {
            return score;
        }
        
        public String getFeedback() {
            return feedback;
        }
    }
}
