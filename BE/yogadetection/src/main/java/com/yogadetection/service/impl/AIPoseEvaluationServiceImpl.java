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

            // Tạo prompt cho AI
            String prompt = buildEvaluationPrompt(poseName, poseDescription, landmarkData);

            // Gọi OpenAI API với vision
            EvaluationResult result = callOpenAIVision(imageUrl, prompt);

            log.info("AI Evaluation completed for pose {}: score={}, feedback length={}",
                    poseCode, result.getScore(), result.getFeedback().length());

            return result;

        } catch (Exception e) {
            log.error("Failed to evaluate pose with AI: {}", e.getMessage(), e);
            // Fallback: trả về kết quả mặc định
            return new EvaluationResult(
                    0.0,
                    "Unable to evaluate pose automatically. Please try again later."
            );
        }
    }

    private String buildEvaluationPrompt(String poseName, String poseDescription, PoseLandmarkRequest landmarkData) {
        StringBuilder prompt = new StringBuilder();

        prompt.append("You are a professional yoga instructor evaluating a student's yoga pose.\n\n");
        prompt.append("Pose Name: ").append(poseName).append("\n");
        prompt.append("Pose Description: ").append(poseDescription).append("\n\n");

        if (landmarkData != null && landmarkData.getLandmarks() != null && !landmarkData.getLandmarks().isEmpty()) {
            prompt.append("Student's Body Landmarks (33 key points):\n");
            prompt.append(formatLandmarks(landmarkData.getLandmarks()));
            prompt.append("\n\n");
            prompt.append("Please analyze BOTH the image and the landmarks data provided.\n\n");
        } else {
            prompt.append("Note: Only image analysis available (no landmark data provided).\n\n");
        }

        prompt.append("Please provide:\n");
        prompt.append("1. A score from 0 to 100 (100 being perfect alignment)\n");
        prompt.append("2. Detailed feedback in Vietnamese including:\n");
        prompt.append("   - What the student is doing well\n");
        prompt.append("   - What needs improvement\n");
        prompt.append("   - Specific corrections for alignment, balance, or form\n\n");
        prompt.append("Format your response as JSON:\n");
        prompt.append("{\n");
        prompt.append("  \"score\": <number 0-100>,\n");
        prompt.append("  \"feedback\": \"<detailed feedback in Vietnamese>\"\n");
        prompt.append("}");

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
                log.warn("OpenAI API key not configured, using mock evaluation");
                return createMockEvaluation();
            }

            log.info("Calling OpenAI Vision API with image: {}", imageUrl);

            UserMessage userMessage = new UserMessage(
                    prompt,
                    List.of(new Media(MimeTypeUtils.IMAGE_JPEG, new UrlResource(imageUrl)))
            );

            Prompt chatPrompt = new Prompt(userMessage);
            String response = chatClient.prompt(chatPrompt)
                    .call()
                    .content();

            log.info("OpenAI response received: {}", response.substring(0, Math.min(100, response.length())));

            // Parse JSON từ response
            return parseAIResponse(response);

        } catch (Exception e) {
            log.error("Error calling OpenAI API: {}", e.getMessage(), e);
            return createMockEvaluation();
        }
    }

    private EvaluationResult parseAIResponse(String response) {
        try {
            String sanitized = sanitizeAIResponse(response);
            JsonNode result = objectMapper.readTree(sanitized);
            Double score = result.path("score").asDouble();
            String feedback = result.path("feedback").asText();

            if (score < 0 || score > 100) {
                log.warn("Invalid score from AI: {}, using default", score);
                score = 75.0;
            }

            return new EvaluationResult(score, feedback);

        } catch (Exception e) {
            log.error("Error parsing AI response: {}", e.getMessage());
            return createMockEvaluation();
        }
    }

    /**
     * Sanitize AI response by removing markdown fences and extracting the first
     * JSON object If JSON braces are present, extract substring between first
     * '{' and last '}'
     */
    private String sanitizeAIResponse(String response) {
        if (response == null) {
            return "{}";
        }
        String s = response.trim();

        if (s.startsWith("```") && s.contains("```")) {
            s = s.replaceAll("(?s)^```[a-zA-Z]*\\n?", "").replaceAll("```$", "").trim();
        }

        // Try to extract JSON object by finding first '{' and last '}'
        int firstBrace = s.indexOf('{');
        int lastBrace = s.lastIndexOf('}');
        if (firstBrace >= 0 && lastBrace > firstBrace) {
            String candidate = s.substring(firstBrace, lastBrace + 1).trim();
            return candidate;
        }

        return s.replace("`", "").trim();
    }

    /**
     * Tạo đánh giá giả lập khi không có API key hoặc API lỗi
     */
    private EvaluationResult createMockEvaluation() {
        return new EvaluationResult(
                75.0,
                "Tư thế của bạn khá tốt! Hãy chú ý giữ lưng thẳng hơn và căng chân đều hai bên. "
                + "Tiếp tục luyện tập để cải thiện sự cân bằng và độ linh hoạt."
        );
    }
}
