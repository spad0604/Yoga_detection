package com.yogadetection.service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Service để phát hiện và phân tích yoga pose từ ảnh bằng AI
 * Dùng cho Social features (Group Posts, User Posts)
 */
public interface AIYogaDetectionService {

    /**
     * Phát hiện yoga pose từ URL ảnh
     * @param imageUrl URL ảnh đã upload lên Cloudinary
     * @return Kết quả phân tích (có pose hay không, tên pose, confidence)
     */
    DetectionResult detectYogaPose(String imageUrl);

    /**
     * Kết quả phát hiện yoga pose
     */
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    class DetectionResult {
        /**
         * Có phát hiện yoga pose không
         */
        private boolean isYogaPose;
        
        /**
         * Tên pose được phát hiện (nếu có)
         */
        private String poseName;
        
        /**
         * Mã pose code (nếu có trong hệ thống)
         */
        private String poseCode;
        
        /**
         * Độ tin cậy (0-100)
         */
        private Double confidence;
        
        /**
         * Mô tả ngắn gọn
         */
        private String description;
        
        /**
         * Tạo kết quả "không phải yoga"
         */
        public static DetectionResult notYogaPose() {
            return new DetectionResult(false, null, null, 0.0, "No yoga pose detected");
        }
        
        /**
         * Tạo kết quả "phát hiện yoga"
         */
        public static DetectionResult yogaPose(String poseName, String poseCode, Double confidence, String description) {
            return new DetectionResult(true, poseName, poseCode, confidence, description);
        }
    }
}
