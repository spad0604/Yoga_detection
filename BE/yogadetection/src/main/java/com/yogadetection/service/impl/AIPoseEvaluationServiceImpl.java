package com.yogadetection.service.impl;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yogadetection.dto.request.Landmark;
import com.yogadetection.dto.request.PoseLandmarkRequest;
import com.yogadetection.entity.YogaPoseDetails;
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

@Slf4j
@Service
@RequiredArgsConstructor
public class AIPoseEvaluationServiceImpl implements AIPoseEvaluationService {

    private final YogaPoseDetailsRepository poseDetailsRepository;
    private final ObjectMapper objectMapper;
    private final ChatClient chatClient;

    @Value("${spring.ai.openai.api-key:}")
    private String apiKey;

    @Override
    public EvaluationResult evaluatePose(String imageUrl, PoseLandmarkRequest landmarkData, String poseCode) {
        try {
            YogaPoseDetails poseDetails = poseDetailsRepository.getYogaPoseDetails(poseCode);
            String poseName = poseDetails != null ? poseDetails.getName() : "Unknown Pose";
            String poseDescription = poseDetails != null ? poseDetails.getDescription() : "";

            String prompt = buildEvaluationPrompt(poseName, poseDescription, landmarkData);
            EvaluationResult result = callOpenAIVision(imageUrl, prompt);

            log.info("✅ AI evaluation completed for pose {} → score={} | feedback length={}",
                    poseCode, result.getScore(), result.getFeedback().length());

            return result;

        } catch (Exception e) {
            log.error("❌ Failed to evaluate pose with AI: {}", e.getMessage(), e);
            return new EvaluationResult(0.0, "Lỗi khi đánh giá tư thế. Vui lòng thử lại sau.");
        }
    }

    private String buildEvaluationPrompt(String poseName, String poseDescription, PoseLandmarkRequest landmarkData) {
        StringBuilder prompt = new StringBuilder();

        prompt.append("Bạn là huấn luyện viên Yoga chuyên nghiệp. ");
        prompt.append("Nhiệm vụ của bạn là ĐÁNH GIÁ TƯ THẾ YOGA của học viên dựa trên ảnh và dữ liệu khớp xương.\n\n");

        prompt.append("Thông tin tư thế:\n");
        prompt.append("- Tên tư thế: ").append(poseName).append("\n");
        prompt.append("- Mô tả tư thế: ").append(poseDescription).append("\n\n");

        if (landmarkData != null && landmarkData.getLandmarks() != null && !landmarkData.getLandmarks().isEmpty()) {
            prompt.append("Dữ liệu khớp xương của học viên (33 điểm):\n");
            prompt.append(formatLandmarks(landmarkData.getLandmarks())).append("\n\n");
        } else {
            prompt.append("⚠️ Không có dữ liệu khớp xương. Chỉ có ảnh để đánh giá.\n\n");
        }

        prompt.append("Yêu cầu:\n");
        prompt.append("1️⃣ Đưa ra điểm số từ 0 đến 100 (100 là hoàn hảo).\n");
        prompt.append("2️⃣ Viết nhận xét chi tiết bằng TIẾNG VIỆT, bao gồm:\n");
        prompt.append("   - Học viên làm tốt điểm nào.\n");
        prompt.append("   - Cần cải thiện điều gì.\n");
        prompt.append("   - Gợi ý điều chỉnh cụ thể.\n\n");
        prompt.append("3️⃣ Chỉ trả về **JSON hợp lệ** theo đúng mẫu dưới đây:\n");
        prompt.append("{\n");
        prompt.append("  \"score\": <số từ 0 đến 100>,\n");
        prompt.append("  \"feedback\": \"<nhận xét chi tiết bằng tiếng Việt>\"\n");
        prompt.append("}\n\n");
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
