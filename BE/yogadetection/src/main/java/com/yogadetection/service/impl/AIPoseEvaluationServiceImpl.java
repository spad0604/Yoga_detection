package com.yogadetection.service.impl;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yogadetection.dto.request.Landmark;
import com.yogadetection.dto.request.PoseLandmarkRequest;
import com.yogadetection.repository.YogaPoseDetailsRepository;
import com.yogadetection.service.AIPoseEvaluationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.messages.UserMessage;
import org.springframework.ai.chat.prompt.Prompt;
import org.springframework.ai.model.Media;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.MimeTypeUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * ENHANCED VERSION - AI Pose Evaluation Service with Angle Calculation
 * 
 * Improvements:
 * 1. Tích hợp LandmarkAngleCalculator để tính góc khớp
 * 2. Better prompt engineering với tiêu chí chấm điểm chi tiết
 * 3. Context về ảnh đã crop/focus
 * 4. Structured feedback format
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AIPoseEvaluationServiceImpl implements AIPoseEvaluationService {

    private final YogaPoseDetailsRepository poseDetailsRepository;
    private final ObjectMapper objectMapper;
    private final ChatClient chatClient;
    private final LandmarkAngleCalculator angleCalculator;

    @Value("${spring.ai.openai.api-key:}")
    private String apiKey;

    @Override
    public EvaluationResult evaluatePose(String imageUrl, PoseLandmarkRequest landmarkData, String poseCode, String poseName, String poseDescription) {
        try {
            // Sử dụng thông tin từ routine_pose thay vì query yoga_pose_details
            String actualPoseName = poseName != null ? poseName : "Unknown Pose";
            String actualDescription = poseDescription != null ? poseDescription : "";

            String prompt = buildEvaluationPrompt(actualPoseName, actualDescription, landmarkData);
            EvaluationResult result = callOpenAIVision(imageUrl, prompt);

            log.info("✅ AI evaluation completed for pose {} ({}) → score={} | feedback length={}",
                    poseCode, actualPoseName, result.getScore(), result.getFeedback().length());

            return result;

        } catch (Exception e) {
            log.error("❌ Failed to evaluate pose with AI: {}", e.getMessage(), e);
            return new EvaluationResult(0.0, "Lỗi khi đánh giá tư thế. Vui lòng thử lại sau.");
        }
    }

    private String buildEvaluationPrompt(String poseName, String poseDescription, PoseLandmarkRequest landmarkData) {
        StringBuilder prompt = new StringBuilder();

        // Header
        prompt.append("🧘 BẠN LÀ CHUYÊN GIA YOGA VỚI 10+ NĂM KINH NGHIỆM\n\n");

        prompt.append("📋 THÔNG TIN TƯ THẾ ĐÁNH GIÁ:\n");
        prompt.append("• Tên tư thế: ").append(poseName).append("\n");
        prompt.append("• Mô tả chi tiết: ").append(poseDescription).append("\n\n");

        // Context về ảnh đã được crop
        prompt.append("📸 THÔNG TIN VỀ ẢNH:\n");
        prompt.append("• Ảnh đã được xử lý và FOCUS VÀO NGƯỜI TẬP YOGA\n");
        prompt.append("• Có thể có nhiễu nền nhẹ hoặc ánh sáng không hoàn hảo\n");
        prompt.append("• Ưu tiên đánh giá TƯ THẾ, bỏ qua chi tiết nền\n\n");

        // Landmark data + GÓC KHỚP (QUAN TRỌNG NHẤT!)
        if (landmarkData != null && landmarkData.getLandmarks() != null && !landmarkData.getLandmarks().isEmpty()) {
            // 1. Tính góc các khớp
            try {
                LandmarkAngleCalculator.BodyAngles angles = 
                    angleCalculator.calculateBodyAngles(landmarkData.getLandmarks());
                
                prompt.append("📐 GÓC CÁC KHỚP THỰC TẾ (QUAN TRỌNG NHẤT!):\n");
                prompt.append(angles.toString()).append("\n");
                
                prompt.append("⚠️ HƯỚNG DẪN SỬ DỤNG GÓC KHỚP:\n");
                prompt.append("• Đây là góc THỰC TẾ của học viên\n");
                prompt.append("• Hãy SO SÁNH với góc chuẩn của tư thế ").append(poseName).append("\n");
                prompt.append("• Sai lệch 5-10° = tốt | 10-20° = cần cải thiện | >20° = sai nghiêm trọng\n");
                prompt.append("• ƯU TIÊN ĐÁNH GIÁ DỰA VÀO GÓC KHỚP hơn là chỉ nhìn hình ảnh!\n\n");
                
                log.info("✅ Góc khớp: {}", angles.toShortString());
            } catch (Exception e) {
                log.warn("⚠️ Không thể tính góc khớp: {}", e.getMessage());
            }
            
            // 2. Landmark data chi tiết
            prompt.append("🎯 DỮ LIỆU KHỚP XƯƠNG (33 ĐIỂM LANDMARK):\n");
            prompt.append(formatLandmarks(landmarkData.getLandmarks())).append("\n\n");
        } else {
            prompt.append("⚠️ Không có dữ liệu landmark. Đánh giá dựa hoàn toàn trên ảnh.\n\n");
        }

        // Tiêu chí chấm điểm chi tiết
        prompt.append("📊 TIÊU CHÍ CHẤM ĐIỂM (0-100):\n");
        prompt.append("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
        prompt.append("🏆 90-100: XUẤT SẮC - Tư thế gần như hoàn hảo, góc khớp chính xác\n");
        prompt.append("✅ 70-89: TỐT - Đúng cơ bản, cần điều chỉnh 1-2 điểm nhỏ\n");
        prompt.append("⚠️ 50-69: TRUNG BÌNH - Có hình dáng nhưng góc khớp chưa đúng\n");
        prompt.append("❌ 30-49: YẾU - Sai nhiều, cần học lại\n");
        prompt.append("🚫 0-29: RẤT KÉM - Hoàn toàn sai, có thể gây chấn thương\n");
        prompt.append("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

        prompt.append("📝 YÊU CẦU OUTPUT:\n");
        prompt.append("Trả về JSON với cấu trúc:\n");
        prompt.append("{\n");
        prompt.append("  \"score\": <số từ 0-100>,\n");
        prompt.append("  \"feedback\": \"<phản hồi chi tiết>\"\n");
        prompt.append("}\n\n");

        prompt.append("📋 CẤU TRÚC FEEDBACK (viết bằng TIẾNG VIỆT):\n");
        prompt.append("═══════════════════════════════════\n");
        prompt.append("🎯 ĐÁNH GIÁ TỔNG QUAN:\n");
        prompt.append("[Tóm tắt 1-2 câu về tư thế]\n\n");
        prompt.append("✅ ĐIỂM MẠNH:\n");
        prompt.append("• [Điểm làm tốt 1]\n");
        prompt.append("• [Điểm làm tốt 2]\n\n");
        prompt.append("⚠️ CẦN CẢI THIỆN:\n");
        prompt.append("• [Điểm cần sửa 1] - Gợi ý: [cách sửa cụ thể]\n");
        prompt.append("• [Điểm cần sửa 2] - Gợi ý: [cách sửa cụ thể]\n\n");
        prompt.append("💡 LỜI KHUYÊN:\n");
        prompt.append("[Lời khích lệ và hướng dẫn]\n");
        prompt.append("═══════════════════════════════════\n\n");

        prompt.append("⚡ LƯU Ý:\n");
        prompt.append("• KHÔNG thêm ```json``` hoặc markdown formatting\n");
        prompt.append("• CHỈ trả về JSON thuần túy\n");
        prompt.append("• Feedback phải CHI TIẾT, CỤ THỂ, DỄ HIỂU\n");
        prompt.append("• Nếu không nhận diện được tư thế, trả về score=0\n\n");
        prompt.append("❗Không trả lời dưới dạng markdown, không thêm ```json``` hoặc văn bản ngoài JSON.\n");
        prompt.append("Nếu không thể xác định tư thế trong hình ảnh, hãy trả về đúng JSON sau (nhớ chèn tên tư thế thực tế vào chỗ <pose_name>):\n");
        prompt.append("{\"score\": 0, \"feedback\": \"Bạn đang không thực hiện đúng dáng <pose_name> rồi! Hãy nghiêm túc hơn và thử lại nhé 😄\"}");

        return prompt.toString();
    }

    private String formatLandmarks(List<Landmark> landmarks) {
        return landmarks.stream()
                .map(l -> String.format("- %s: (x=%.2f, y=%.2f, z=%.2f)", l.getType(), l.getX(), l.getY(), l.getZ()))
                .collect(Collectors.joining("\n"));
    }

    private EvaluationResult callOpenAIVision(String imageUrl, String prompt) {
        try {
            if (apiKey == null || apiKey.isEmpty()) {
                log.warn("⚠️ OpenAI API key not configured → dùng kết quả giả lập");
                return new EvaluationResult(70.0, "Chưa cấu hình API key. Dùng kết quả mô phỏng.");
            }

            log.info("📤 Sending image to OpenAI Vision: {}", imageUrl);

            UserMessage userMessage = new UserMessage(
                    prompt,
                    List.of(new Media(MimeTypeUtils.IMAGE_JPEG, new UrlResource(imageUrl)))
            );

            Prompt chatPrompt = new Prompt(userMessage);
            String response = chatClient.prompt(chatPrompt)
                    .call()
                    .content();

            log.info("📥 Raw OpenAI response: {}", response.replaceAll("[\\r\\n]+", " ").trim());

            return parseAIResponse(response);

        } catch (Exception e) {
            log.error("❌ Error calling OpenAI API: {}", e.getMessage(), e);
            return new EvaluationResult(0.0, "Không thể kết nối tới OpenAI API.");
        }
    }

    private EvaluationResult parseAIResponse(String response) {
        try {
            String json = sanitizeAIResponse(response);
            JsonNode node = objectMapper.readTree(json);

            double score = node.path("score").asDouble(0.0);
            String feedback = node.path("feedback").asText("Không thể phân tích phản hồi.");

            if (score < 0 || score > 100) score = 0.0;

            return new EvaluationResult(score, feedback);

        } catch (Exception e) {
            log.warn("⚠️ Non-JSON AI response → fallback. Reason: {}", e.getMessage());
            return new EvaluationResult(0.0, "AI trả về dữ liệu không đúng định dạng JSON.");
        }
    }

    private String sanitizeAIResponse(String response) {
        if (response == null || response.isBlank()) return "{}";
        String s = response.trim()
                .replaceAll("^```[a-zA-Z]*", "")
                .replaceAll("```$", "")
                .trim();

        int first = s.indexOf('{');
        int last = s.lastIndexOf('}');
        if (first >= 0 && last > first) {
            return s.substring(first, last + 1);
        }
        return s;
    }
}
