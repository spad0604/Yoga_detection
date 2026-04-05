package com.yogadetection.service;

import com.yogadetection.dto.request.PoseLandmarkRequest;
import com.yogadetection.service.PoseModelService.PoseModelAnalysis;

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
     * Đánh giá tư thế yoga bằng AI, có kèm kết quả từ model phân loại (Yoga-82).
     * @param analysis Kết quả model: pose gần nhất, confidence, sai lệch lớn nhất...
     */
    default EvaluationResult evaluatePose(
            String imageUrl,
            PoseLandmarkRequest landmarkData,
            String poseCode,
            String poseName,
            String poseDescription,
            PoseModelAnalysis analysis
    ) {
        return evaluatePose(imageUrl, landmarkData, poseCode, poseName, poseDescription);
    }
    
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
