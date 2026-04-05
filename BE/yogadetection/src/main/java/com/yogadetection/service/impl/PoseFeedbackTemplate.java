package com.yogadetection.service.impl;

import com.yogadetection.service.PoseModelService.PoseModelAnalysis;

public class PoseFeedbackTemplate {

    private PoseFeedbackTemplate() {
    }

    public static String buildFallbackFeedback(String expectedPoseName, PoseModelAnalysis analysis) {
        StringBuilder sb = new StringBuilder();

        sb.append("🎯 ĐÁNH GIÁ TỔNG QUAN:\n");
        if (analysis != null && analysis.getPredictedPose() != null) {
            sb.append("Hệ thống nhận thấy bạn đang gần với: ")
                    .append(analysis.getPredictedPose())
                    .append(String.format(" (độ tin cậy %.0f%%).\n\n", analysis.getConfidence() * 100.0));
        } else {
            sb.append("Hiện tại hệ thống chưa đủ thông tin để nhận diện chắc chắn tư thế.\n\n");
        }

        sb.append("✅ ĐIỂM MẠNH:\n");
        sb.append("• Bạn đã hoàn thành được khung tư thế cơ bản.\n\n");

        sb.append("⚠️ CẦN CẢI THIỆN:\n");
        if (analysis != null && analysis.getMostOff() != null) {
            var m = analysis.getMostOff();
            sb.append(String.format("• Lệch nhiều nhất ở %s: lệch %.1f° (chuẩn %.1f°, hiện tại %.1f°).\n",
                    humanizeMetric(m.getMetric()), Math.abs(m.getDiff()), m.getReference(), m.getActual()));
            sb.append("  - Gợi ý: giảm/giữ lực ổn định và chỉnh dần trong 2-3 nhịp thở.\n\n");
        } else {
            sb.append("• Hãy giữ thẳng lưng, siết core nhẹ và cân bằng hai bên cơ thể.\n\n");
        }

        sb.append("💡 LỜI KHUYÊN:\n");
        sb.append("Hãy thử chụp lại với toàn thân vào khung hình, đủ sáng, và giữ tư thế 1-2 giây trước khi chụp.\n");

        if (expectedPoseName != null && !expectedPoseName.isBlank()) {
            sb.append("\nMục tiêu của bạn: ").append(expectedPoseName).append("\n");
        }

        return sb.toString();
    }

    public static String buildWrongPoseFeedback(String expectedPoseName, PoseModelAnalysis analysis) {
        String predicted = analysis != null ? analysis.getPredictedPose() : null;
        double conf = analysis != null ? analysis.getConfidence() : 0.0;

        if (predicted == null || predicted.isBlank()) {
            return "Bạn đang không thực hiện đúng dáng mong muốn. Hãy thử lại với tư thế rõ ràng hơn.";
        }

        StringBuilder sb = new StringBuilder();
        sb.append("🚫 BẠN ĐANG TẬP SAI DÁNG\n\n");
        if (expectedPoseName != null && !expectedPoseName.isBlank()) {
            sb.append("• Dáng bạn chọn: ").append(expectedPoseName).append("\n");
        }
        sb.append(String.format("• Hệ thống nhận thấy dáng gần nhất là: %s (%.0f%%).\n\n", predicted, conf * 100.0));

        if (analysis != null && analysis.getMostOff() != null) {
            var m = analysis.getMostOff();
            sb.append("⚠️ Sai lệch lớn nhất hiện tại:\n");
            sb.append(String.format("• %s: lệch %.1f° (chuẩn %.1f°, hiện tại %.1f°).\n\n",
                    humanizeMetric(m.getMetric()), Math.abs(m.getDiff()), m.getReference(), m.getActual()));
        }

        sb.append("👉 Hãy điều chỉnh lại để đúng dáng đã chọn rồi chụp lại nhé.");
        return sb.toString();
    }

    private static String humanizeMetric(String metric) {
        if (metric == null) return "khớp";
        return switch (metric) {
            case "leftElbowAngle" -> "khuỷu tay trái";
            case "rightElbowAngle" -> "khuỷu tay phải";
            case "leftShoulderAngle" -> "vai trái";
            case "rightShoulderAngle" -> "vai phải";
            case "leftHipAngle" -> "hông trái";
            case "rightHipAngle" -> "hông phải";
            case "leftKneeAngle" -> "gối trái";
            case "rightKneeAngle" -> "gối phải";
            case "leftAnkleAngle" -> "cổ chân trái";
            case "rightAnkleAngle" -> "cổ chân phải";
            case "spineAngle" -> "độ thẳng lưng";
            default -> metric;
        };
    }
}
