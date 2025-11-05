package com.yogadetection.service.impl;

import com.yogadetection.dto.request.Landmark;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Service tính toán góc giữa các landmarks để đánh giá tư thế chính xác hơn
 */
@Slf4j
@Component
public class LandmarkAngleCalculator {

    /**
     * Tính góc giữa 3 điểm landmarks (A-B-C, với B là đỉnh)
     * @param pointA Điểm đầu tiên
     * @param pointB Điểm đỉnh (điểm giữa) - góc tính tại đây
     * @param pointC Điểm cuối cùng
     * @return Góc tính bằng độ (0-180°)
     */
    public double calculateAngle(Landmark pointA, Landmark pointB, Landmark pointC) {
        try {
            // Vector BA (từ B đến A)
            double ba_x = pointA.getX() - pointB.getX();
            double ba_y = pointA.getY() - pointB.getY();
            double ba_z = pointA.getZ() - pointB.getZ();

            // Vector BC (từ B đến C)
            double bc_x = pointC.getX() - pointB.getX();
            double bc_y = pointC.getY() - pointB.getY();
            double bc_z = pointC.getZ() - pointB.getZ();

            // Tích vô hướng (dot product): BA · BC
            double dotProduct = ba_x * bc_x + ba_y * bc_y + ba_z * bc_z;

            // Độ dài vector |BA| và |BC|
            double magnitudeBA = Math.sqrt(ba_x * ba_x + ba_y * ba_y + ba_z * ba_z);
            double magnitudeBC = Math.sqrt(bc_x * bc_x + bc_y * bc_y + bc_z * bc_z);

            // Tránh chia cho 0
            if (magnitudeBA == 0 || magnitudeBC == 0) {
                log.warn("⚠️ Vector có độ dài = 0, không thể tính góc");
                return 0.0;
            }

            // cos(θ) = (BA · BC) / (|BA| * |BC|)
            double cosTheta = dotProduct / (magnitudeBA * magnitudeBC);
            
            // Clamp giá trị về [-1, 1] để tránh lỗi acos
            cosTheta = Math.max(-1.0, Math.min(1.0, cosTheta));

            // Góc = arccos(cosTheta), chuyển từ radian sang độ
            double angleRadians = Math.acos(cosTheta);
            return Math.toDegrees(angleRadians);
            
        } catch (Exception e) {
            log.error("❌ Lỗi khi tính góc: {}", e.getMessage());
            return 0.0;
        }
    }

    /**
     * Tính tất cả các góc quan trọng của cơ thể
     */
    public BodyAngles calculateBodyAngles(List<Landmark> landmarks) {
        BodyAngles angles = new BodyAngles();

        try {
            // ===== TAY & VAI =====
            
            // Góc khuỷu tay trái (shoulder-elbow-wrist)
            angles.leftElbowAngle = calculateAngle(
                getLandmark(landmarks, "LEFT_SHOULDER"),
                getLandmark(landmarks, "LEFT_ELBOW"),
                getLandmark(landmarks, "LEFT_WRIST")
            );

            // Góc khuỷu tay phải
            angles.rightElbowAngle = calculateAngle(
                getLandmark(landmarks, "RIGHT_SHOULDER"),
                getLandmark(landmarks, "RIGHT_ELBOW"),
                getLandmark(landmarks, "RIGHT_WRIST")
            );

            // Góc vai trái (hip-shoulder-elbow)
            angles.leftShoulderAngle = calculateAngle(
                getLandmark(landmarks, "LEFT_HIP"),
                getLandmark(landmarks, "LEFT_SHOULDER"),
                getLandmark(landmarks, "LEFT_ELBOW")
            );

            // Góc vai phải
            angles.rightShoulderAngle = calculateAngle(
                getLandmark(landmarks, "RIGHT_HIP"),
                getLandmark(landmarks, "RIGHT_SHOULDER"),
                getLandmark(landmarks, "RIGHT_ELBOW")
            );

            // ===== CHÂN & HÔNG =====
            
            // Góc hông trái (shoulder-hip-knee)
            angles.leftHipAngle = calculateAngle(
                getLandmark(landmarks, "LEFT_SHOULDER"),
                getLandmark(landmarks, "LEFT_HIP"),
                getLandmark(landmarks, "LEFT_KNEE")
            );

            // Góc hông phải
            angles.rightHipAngle = calculateAngle(
                getLandmark(landmarks, "RIGHT_SHOULDER"),
                getLandmark(landmarks, "RIGHT_HIP"),
                getLandmark(landmarks, "RIGHT_KNEE")
            );

            // Góc đầu gối trái (hip-knee-ankle)
            angles.leftKneeAngle = calculateAngle(
                getLandmark(landmarks, "LEFT_HIP"),
                getLandmark(landmarks, "LEFT_KNEE"),
                getLandmark(landmarks, "LEFT_ANKLE")
            );

            // Góc đầu gối phải
            angles.rightKneeAngle = calculateAngle(
                getLandmark(landmarks, "RIGHT_HIP"),
                getLandmark(landmarks, "RIGHT_KNEE"),
                getLandmark(landmarks, "RIGHT_ANKLE")
            );

            // Góc mắt cá chân trái (knee-ankle-heel)
            angles.leftAnkleAngle = calculateAngle(
                getLandmark(landmarks, "LEFT_KNEE"),
                getLandmark(landmarks, "LEFT_ANKLE"),
                getLandmark(landmarks, "LEFT_HEEL")
            );

            // Góc mắt cá chân phải
            angles.rightAnkleAngle = calculateAngle(
                getLandmark(landmarks, "RIGHT_KNEE"),
                getLandmark(landmarks, "RIGHT_ANKLE"),
                getLandmark(landmarks, "RIGHT_HEEL")
            );

            // ===== THÂN & LƯNG =====
            
            // Góc lưng/thân (đo độ thẳng) - dùng trung bình 2 bên
            double leftSpine = calculateAngle(
                getLandmark(landmarks, "LEFT_SHOULDER"),
                getLandmark(landmarks, "LEFT_HIP"),
                getLandmark(landmarks, "LEFT_KNEE")
            );
            double rightSpine = calculateAngle(
                getLandmark(landmarks, "RIGHT_SHOULDER"),
                getLandmark(landmarks, "RIGHT_HIP"),
                getLandmark(landmarks, "RIGHT_KNEE")
            );
            angles.spineAngle = (leftSpine + rightSpine) / 2.0;

            log.info("✅ Đã tính toán {} góc khớp thành công", 11);

        } catch (Exception e) {
            log.error("❌ Lỗi khi tính các góc cơ thể: {}", e.getMessage());
        }

        return angles;
    }

    /**
     * Lấy landmark theo type
     */
    private Landmark getLandmark(List<Landmark> landmarks, String type) {
        return landmarks.stream()
            .filter(l -> type.equalsIgnoreCase(l.getType()))
            .findFirst()
            .orElseThrow(() -> new RuntimeException("❌ Không tìm thấy landmark: " + type));
    }

    /**
     * Class chứa tất cả các góc quan trọng
     */
    @Data
    public static class BodyAngles {
        // Tay & Vai
        private double leftElbowAngle;      // Góc khuỷu tay trái
        private double rightElbowAngle;     // Góc khuỷu tay phải
        private double leftShoulderAngle;   // Góc vai trái
        private double rightShoulderAngle;  // Góc vai phải
        
        // Chân & Hông
        private double leftHipAngle;        // Góc hông trái
        private double rightHipAngle;       // Góc hông phải
        private double leftKneeAngle;       // Góc đầu gối trái
        private double rightKneeAngle;      // Góc đầu gối phải
        private double leftAnkleAngle;      // Góc mắt cá trái
        private double rightAnkleAngle;     // Góc mắt cá phải
        
        // Thân
        private double spineAngle;          // Góc lưng/thân

        /**
         * Format đẹp để thêm vào prompt
         */
        @Override
        public String toString() {
            return String.format("""
                ┌─ TAY & VAI ──────────────────────┐
                │ Khuỷu trái: %6.1f° │ Khuỷu phải: %6.1f° │
                │ Vai trái:   %6.1f° │ Vai phải:   %6.1f° │
                ├─ CHÂN & HÔNG ────────────────────┤
                │ Hông trái:  %6.1f° │ Hông phải:  %6.1f° │
                │ Gối trái:   %6.1f° │ Gối phải:   %6.1f° │
                │ Cổ chân trái:%5.1f° │ Cổ chân phải:%5.1f° │
                ├─ THÂN & LƯNG ────────────────────┤
                │ Độ thẳng lưng:     %6.1f°         │
                └───────────────────────────────────┘
                """,
                leftElbowAngle, rightElbowAngle,
                leftShoulderAngle, rightShoulderAngle,
                leftHipAngle, rightHipAngle,
                leftKneeAngle, rightKneeAngle,
                leftAnkleAngle, rightAnkleAngle,
                spineAngle
            );
        }

        /**
         * Format ngắn gọn cho logging
         */
        public String toShortString() {
            return String.format(
                "Vai:%.0f°/%.0f° | Khuỷu:%.0f°/%.0f° | Hông:%.0f°/%.0f° | Gối:%.0f°/%.0f° | Lưng:%.0f°",
                leftShoulderAngle, rightShoulderAngle,
                leftElbowAngle, rightElbowAngle,
                leftHipAngle, rightHipAngle,
                leftKneeAngle, rightKneeAngle,
                spineAngle
            );
        }
    }
}
