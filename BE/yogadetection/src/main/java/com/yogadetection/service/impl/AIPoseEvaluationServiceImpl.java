package com.yogadetection.service.impl;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yogadetection.dto.request.Landmark;
import com.yogadetection.dto.request.PoseLandmarkRequest;
import com.yogadetection.repository.YogaPoseDetailsRepository;
import com.yogadetection.service.AIPoseEvaluationService;
import com.yogadetection.service.PoseModelService.PoseModelAnalysis;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    private static final Pattern SCORE_PATTERN = Pattern.compile("\\\"score\\\"\\s*:\\s*(-?\\d+(?:\\.\\d+)?)");
            private static final Pattern SCORE_RANGE_TEXT_PATTERN = Pattern.compile(
                "(?i)(?:score|scores|scoring|điểm)[^\\d]{0,24}(\\d+(?:\\.\\d+)?)\\s*(?:-|to|–|~)\\s*(\\d+(?:\\.\\d+)?)"
            );
            private static final Pattern SCORE_SINGLE_TEXT_PATTERN = Pattern.compile(
                "(?i)(?:score|scores|scoring|điểm)[^\\d]{0,24}(\\d+(?:\\.\\d+)?)"
            );
            private static final String DEFAULT_USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36";

    private final YogaPoseDetailsRepository poseDetailsRepository;
    private final ObjectMapper objectMapper;
            private final RestTemplate restTemplate;
    private final LandmarkAngleCalculator angleCalculator;

    @Value("${spring.ai.openai.api-key:${OPENAI_API_KEY:}}")
    private String apiKey;

    @Value("${spring.ai.openai.base-url:https://api.openai.com}")
    private String openAiBaseUrl;

    @Value("${spring.ai.openai.chat.options.model:gpt-4o-mini}")
    private String openAiModel;

    @Value("${spring.ai.openai.chat.options.max-tokens:4096}")
    private int openAiMaxTokens;

    @Value("${spring.ai.openai.chat.options.temperature:1.0}")
    private double openAiTemperature;

    @Value("${ai.llm.chat-completions-path:/v1/chat/completions}")
    private String openAiChatCompletionsPath;

    /**
     * If the input imageUrl is a Cloudinary URL, we can request a smaller/compressed variant
     * to reduce payload size and avoid transient upstream 502s.
     * Example value: f_jpg,q_auto,w_768
     */
    @Value("${ai.vision.cloudinary-transform:f_jpg,q_auto,w_768}")
    private String cloudinaryTransform;

    @Value("${ai.vision.log-prompt-preview:true}")
    private boolean logPromptPreview;

    @Value("${ai.vision.prompt-preview-max-chars:1200}")
    private int promptPreviewMaxChars;

    @Override
    public EvaluationResult evaluatePose(String imageUrl, PoseLandmarkRequest landmarkData, String poseCode, String poseName, String poseDescription) {
        return evaluatePose(imageUrl, landmarkData, poseCode, poseName, poseDescription, null);
    }

    @Override
    public EvaluationResult evaluatePose(
            MultipartFile imageFile,
            PoseLandmarkRequest landmarkData,
            String poseCode,
            String poseName,
            String poseDescription,
            PoseModelAnalysis analysis
    ) {
        return evaluatePoseInternal(null, imageFile, landmarkData, poseCode, poseName, poseDescription, analysis);
    }

    @Override
    public EvaluationResult evaluatePose(
            String imageUrl,
            PoseLandmarkRequest landmarkData,
            String poseCode,
            String poseName,
            String poseDescription,
            PoseModelAnalysis analysis
    ) {
            return evaluatePoseInternal(imageUrl, null, landmarkData, poseCode, poseName, poseDescription, analysis);
            }

            private EvaluationResult evaluatePoseInternal(
                String imageUrl,
                MultipartFile imageFile,
                PoseLandmarkRequest landmarkData,
                String poseCode,
                String poseName,
                String poseDescription,
                PoseModelAnalysis analysis
            ) {
        try {
            String actualPoseName = poseName != null ? poseName : "Unknown Pose";
            String actualDescription = poseDescription != null ? poseDescription : "";

            String prompt = buildEvaluationPrompt(actualPoseName, actualDescription, landmarkData, analysis);
            EvaluationResult result = callOpenAiEvaluation(imageUrl, imageFile, prompt, actualPoseName, analysis);

            log.info("✅ AI evaluation completed for pose {} ({}) → score={} | feedback length={}",
                    poseCode, actualPoseName, result.getScore(), result.getFeedback() != null ? result.getFeedback().length() : 0);

            return result;

        } catch (Exception e) {
            log.error("❌ Failed to evaluate pose with AI: {}", e.getMessage(), e);
            return new EvaluationResult(0.0, PoseFeedbackTemplate.buildFallbackFeedback(poseName, analysis));
        }
    }

    private String buildEvaluationPrompt(String poseName, String poseDescription, PoseLandmarkRequest landmarkData, PoseModelAnalysis analysis) {
        StringBuilder prompt = new StringBuilder();

        // Header
        prompt.append("🧘 BẠN LÀ CHUYÊN GIA YOGA VỚI 10+ NĂM KINH NGHIỆM\n");
        prompt.append("⚠️ QUAN TRỌNG: CHỈ TRẢ VỀ JSON CUỐI CÙNG, KHÔNG IN SUY LUẬN NỘI BỘ.\n\n");

        prompt.append("📋 THÔNG TIN TƯ THẾ ĐÁNH GIÁ:\n");
        prompt.append("• Tên tư thế: ").append(poseName).append("\n");
        prompt.append("• Mô tả chi tiết: ").append(poseDescription).append("\n\n");

        if (analysis != null && analysis.getPredictedPose() != null) {
            prompt.append("🤖 KẾT QUẢ MODEL PHÂN LOẠI (Yoga-82):\n");
            prompt.append("• Pose gần nhất: ").append(analysis.getPredictedPose())
                .append(String.format(" (%.0f%%)\n", analysis.getConfidence() * 100.0));
            if (analysis.getMostOff() != null) {
            var m = analysis.getMostOff();
            prompt.append(String.format("• Sai lệch lớn nhất: %s | lệch %.1f° (chuẩn %.1f°, hiện tại %.1f°)\n",
                m.getMetric(), Math.abs(m.getDiff()), m.getReference(), m.getActual()));
            }
            prompt.append("\n");
        }

        // Context về ảnh đã được crop
        prompt.append("📸 THÔNG TIN VỀ ẢNH:\n");
        prompt.append("• Đây là ảnh người dùng upload trực tiếp\n");
        prompt.append("• Có thể có nhiễu nền hoặc ánh sáng không hoàn hảo\n");
        prompt.append("• Ưu tiên đánh giá TƯ THẾ, bỏ qua chi tiết nền\n\n");

        // Landmark data + GÓC KHỚP (QUAN TRỌNG NHẤT!)
        if (landmarkData != null && landmarkData.getLandmarks() != null && !landmarkData.getLandmarks().isEmpty()) {
            List<Landmark> normalizedLandmarks = normalizeLandmarkTypes(landmarkData.getLandmarks());

            boolean hasModelAngles = analysis != null
                    && analysis.getActualAngles() != null
                    && !analysis.getActualAngles().isEmpty();

            // 1. Góc khớp (ưu tiên từ pose-model nội bộ nếu có)
            if (hasModelAngles) {
                prompt.append("📐 GÓC CÁC KHỚP (TỪ MODEL NỘI BỘ TỰ TRAIN — THAM KHẢO):\n");
                prompt.append("⚠️ Lưu ý: Đây là kết quả góc do model nội bộ tự training suy ra (có thể không đúng dáng hiện tại hoặc có sai số nếu landmark lỗi). Dùng để tham khảo.\n");
                prompt.append(formatModelAngles(analysis.getActualAngles())).append("\n");

                if (analysis.getReferenceAngles() != null && !analysis.getReferenceAngles().isEmpty()) {
                    prompt.append("📏 GÓC CHUẨN THAM CHIẾU (THEO POSE MODEL DỰ ĐOÁN: ")
                            .append(analysis.getPredictedPose() != null ? analysis.getPredictedPose() : "unknown")
                            .append("):\n");
                    prompt.append(formatModelAngles(analysis.getReferenceAngles())).append("\n");
                }

                prompt.append("⚠️ HƯỚNG DẪN SỬ DỤNG GÓC KHỚP:\n");
                prompt.append("• Góc trên là dữ liệu tham khảo từ model; hãy kết hợp quan sát ảnh + landmark\n");
                prompt.append("• Mục tiêu vẫn là tư thế ").append(poseName).append("\n");
                prompt.append("• Nếu có góc chuẩn tham chiếu, hãy so sánh chênh lệch để chỉ ra điểm sai\n\n");
            } else {
                // Fallback: tính góc bằng calculator trong BE
                try {
                    LandmarkAngleCalculator.BodyAngles angles =
                            angleCalculator.calculateBodyAngles(normalizedLandmarks);

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
            }
            
            // 2. Landmark data chi tiết
            prompt.append("🎯 DỮ LIỆU KHỚP XƯƠNG (33 ĐIỂM LANDMARK):\n");
            prompt.append(formatLandmarks(normalizedLandmarks)).append("\n\n");
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

        prompt.append("📝 OUTPUT BẮT BUỘC (JSON-ONLY MODE):\n");
        prompt.append("- Trả về CHÍNH XÁC 1 object JSON hợp lệ, không thêm ký tự nào trước/sau JSON.\n");
        prompt.append("- Ký tự đầu tiên phải là '{' và ký tự cuối cùng phải là '}'.\n");
        prompt.append("- KHÔNG markdown, KHÔNG code block, KHÔNG giải thích, KHÔNG chuỗi kiểu 'The user wants me...'.\n");
        prompt.append("- Toàn bộ nội dung feedback phải là TIẾNG VIỆT tự nhiên.\n");
        prompt.append("- score trong khoảng 0-100.\n");
        prompt.append("- feedback nên có các phần: Đánh giá tổng quan, Điểm mạnh, Cần cải thiện, Lời khuyên.\n\n");

        prompt.append("Schema bắt buộc:\n");
        prompt.append("{\"score\": <number 0..100>, \"feedback\": \"<Vietnamese text>\"}\n\n");

        prompt.append("Ví dụ hợp lệ duy nhất (chỉ để tham chiếu format):\n");
        prompt.append("{\"score\": 72, \"feedback\": \"🎯 ĐÁNH GIÁ TỔNG QUAN: ...\\n\\n✅ ĐIỂM MẠNH: ...\\n\\n⚠️ CẦN CẢI THIỆN: ...\\n\\n💡 LỜI KHUYÊN: ...\"}\n\n");

        prompt.append("Nếu không thể xác định tư thế, trả về:\n");
        prompt.append("{\"score\": 0, \"feedback\": \"Bạn đang không thực hiện đúng dáng ").append(poseName).append(" rồi! Hãy nghiêm túc hơn và thử lại nhé 😄\"}");

        return prompt.toString();
    }

    private String formatLandmarks(List<Landmark> landmarks) {
        return landmarks.stream()
                .map(l -> String.format("- %s: (x=%.2f, y=%.2f, z=%.2f)", l.getType(), l.getX(), l.getY(), l.getZ()))
                .collect(Collectors.joining("\n"));
    }

    private List<Landmark> normalizeLandmarkTypes(List<Landmark> landmarks) {
        List<Landmark> out = new ArrayList<>(landmarks.size());
        for (Landmark lm : landmarks) {
            if (lm == null) continue;
            out.add(Landmark.builder()
                    .type(LandmarkTypeNormalizer.normalize(lm.getType()))
                    .x(lm.getX())
                    .y(lm.getY())
                    .z(lm.getZ())
                    .build());
        }
        return out;
    }

    private String formatModelAngles(Map<String, Double> angles) {
        if (angles == null || angles.isEmpty()) return "(no angles)";

        Double leftElbow = pickAngle(angles, "leftElbowAngle", "left_elbow", "leftElbow");
        Double rightElbow = pickAngle(angles, "rightElbowAngle", "right_elbow", "rightElbow");
        Double leftShoulder = pickAngle(angles, "leftShoulderAngle", "left_shoulder", "leftShoulder");
        Double rightShoulder = pickAngle(angles, "rightShoulderAngle", "right_shoulder", "rightShoulder");
        Double leftHip = pickAngle(angles, "leftHipAngle", "left_hip", "leftHip");
        Double rightHip = pickAngle(angles, "rightHipAngle", "right_hip", "rightHip");
        Double leftKnee = pickAngle(angles, "leftKneeAngle", "left_knee", "leftKnee");
        Double rightKnee = pickAngle(angles, "rightKneeAngle", "right_knee", "rightKnee");
        Double leftAnkle = pickAngle(angles, "leftAnkleAngle", "left_ankle", "leftAnkle");
        Double rightAnkle = pickAngle(angles, "rightAnkleAngle", "right_ankle", "rightAnkle");
        Double spine = pickAngle(angles, "spineAngle", "spine");

        return String.format("""
                ┌─ TAY & VAI ──────────────────────┐
                │ Khuỷu trái: %6s │ Khuỷu phải: %6s │
                │ Vai trái:   %6s │ Vai phải:   %6s │
                ├─ CHÂN & HÔNG ────────────────────┤
                │ Hông trái:  %6s │ Hông phải:  %6s │
                │ Gối trái:   %6s │ Gối phải:   %6s │
                │ Cổ chân trái:%5s │ Cổ chân phải:%5s │
                ├─ THÂN & LƯNG ────────────────────┤
                │ Độ thẳng lưng:     %6s         │
                └───────────────────────────────────┘
                """,
                fmtDeg(leftElbow), fmtDeg(rightElbow),
                fmtDeg(leftShoulder), fmtDeg(rightShoulder),
                fmtDeg(leftHip), fmtDeg(rightHip),
                fmtDeg(leftKnee), fmtDeg(rightKnee),
                fmtDeg(leftAnkle), fmtDeg(rightAnkle),
                fmtDeg(spine)
        );
    }

    private Double pickAngle(Map<String, Double> angles, String... keys) {
        if (angles == null || keys == null) return null;
        for (String key : keys) {
            if (key == null) continue;
            if (angles.containsKey(key)) {
                return angles.get(key);
            }
        }
        return null;
    }

    private String fmtDeg(Double value) {
        if (value == null) return "N/A";
        return String.format("%.1f°", value);
    }

    private EvaluationResult callOpenAiEvaluation(
            String imageUrl,
            MultipartFile imageFile,
            String prompt,
            String expectedPoseName,
            PoseModelAnalysis analysis
    ) {
        try {
            if (apiKey == null || apiKey.isEmpty()) {
                log.warn("⚠️ OpenAI API key not configured → dùng template fallback");
                return new EvaluationResult(0.0, PoseFeedbackTemplate.buildFallbackFeedback(expectedPoseName, analysis));
            }

            String mediaSourceLog;
            String aiImageUrl = null;

            if (imageUrl != null && !imageUrl.isBlank()) {
                aiImageUrl = toAiImageUrl(imageUrl);
                mediaSourceLog = aiImageUrl;
            } else if (imageFile != null && !imageFile.isEmpty()) {
                log.warn("⚠️ Refusing to send multipart image bytes to LLM. Upload to Cloudinary first and pass imageUrl.");
                return new EvaluationResult(0.0, PoseFeedbackTemplate.buildFallbackFeedback(expectedPoseName, analysis));
            } else {
                log.warn("⚠️ No image provided for OpenAI evaluation call → dùng template fallback");
                return new EvaluationResult(0.0, PoseFeedbackTemplate.buildFallbackFeedback(expectedPoseName, analysis));
            }

            log.info("🌐 OpenAI base URL: {}", openAiBaseUrl);
            log.info("📤 Sending image context to OpenAI: {}", mediaSourceLog);

            int promptLen = prompt != null ? prompt.length() : 0;
            if (logPromptPreview) {
                log.info("📝 OpenAI prompt preview (len={}): {}", promptLen, buildPromptPreview(prompt, promptPreviewMaxChars));
            } else {
                log.info("📝 OpenAI prompt length: {}", promptLen);
            }

            String finalPrompt = prompt;
            if (aiImageUrl != null && !aiImageUrl.isBlank()) {
                finalPrompt = prompt
                        + "\n\n[IMAGE_URL]\n"
                        + aiImageUrl
                        + "\n[/IMAGE_URL]\n"
                        + "Hãy phân tích đúng ảnh ở URL trên.";
            }

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.setBearerAuth(apiKey);
            headers.set("User-Agent", DEFAULT_USER_AGENT);

            var payload = objectMapper.createObjectNode();
            payload.put("model", openAiModel);
            payload.put("max_completion_tokens", openAiMaxTokens);
            if (!isGpt5Model(openAiModel)) {
                payload.put("temperature", openAiTemperature);
            } else if (Math.abs(openAiTemperature - 1.0d) > 1e-9) {
                log.warn("⚠️ Model {} does not support custom temperature={} (only default). Omitting temperature.",
                        openAiModel, openAiTemperature);
            }

            var messages = objectMapper.createArrayNode();
            var message = objectMapper.createObjectNode();
            message.put("role", "user");
            message.put("content", finalPrompt);
            messages.add(message);
            payload.set("messages", messages);

            String endpoint = openAiBaseUrl + openAiChatCompletionsPath;
            HttpEntity<String> request = new HttpEntity<>(payload.toString(), headers);
            ResponseEntity<String> responseEntity = restTemplate.postForEntity(endpoint, request, String.class);
            String responseBody = responseEntity.getBody();

            if (responseBody == null || responseBody.isBlank()) {
                log.warn("⚠️ OpenAI returned empty response body → dùng template fallback");
                return new EvaluationResult(0.0, PoseFeedbackTemplate.buildFallbackFeedback(expectedPoseName, analysis));
            }

            log.info("📥 Raw OpenAI response: {}", responseBody.replaceAll("[\\r\\n]+", " ").trim());

            String assistantText = extractModelText(responseBody);
            if (assistantText == null || assistantText.isBlank()) {
                log.warn("⚠️ Cannot extract assistant text from LLM envelope, using raw body as fallback parse input.");
                assistantText = responseBody;
            }

            return parseAIResponse(assistantText, expectedPoseName, analysis);

        } catch (Exception e) {
            log.error("❌ Error calling OpenAI API: {}", e.getMessage(), e);
            return new EvaluationResult(0.0, PoseFeedbackTemplate.buildFallbackFeedback(expectedPoseName, analysis));
        }
    }

    private String toAiImageUrl(String imageUrl) {
        if (imageUrl == null || imageUrl.isBlank()) {
            return imageUrl;
        }

        String transform = sanitizeCloudinaryTransform((cloudinaryTransform == null) ? "" : cloudinaryTransform.trim());
        if (transform.isEmpty()) {
            return imageUrl;
        }

        // Cloudinary pattern: https://res.cloudinary.com/<cloud>/image/upload/<maybe_version>/<path>
        final String marker = "/image/upload/";
        int idx = imageUrl.indexOf(marker);
        if (idx < 0) {
            return imageUrl;
        }

        int insertPos = idx + marker.length();
        String rest = imageUrl.substring(insertPos);
        int nextSlash = rest.indexOf('/');
        String firstSeg = nextSlash >= 0 ? rest.substring(0, nextSlash) : rest;

        // If it already looks like it has a transform segment, don't double-insert.
        String firstSegLower = firstSeg.toLowerCase();
        boolean alreadyTransformed = firstSegLower.startsWith("f_")
                || firstSegLower.startsWith("q_")
                || firstSegLower.startsWith("w_")
                || firstSegLower.startsWith("h_")
                || firstSegLower.contains(",");

        if (alreadyTransformed) {
            return imageUrl;
        }

        return imageUrl.substring(0, insertPos) + transform + "/" + rest;
    }

    /**
     * Ensure we never apply visual-enhancement transforms (contrast/brightness/etc.)
     * that could change the appearance of the user's original image.
     *
     * We only allow safe transforms for transport/perf (format/quality/resize).
     */
    private String sanitizeCloudinaryTransform(String transform) {
        if (transform == null) return "";
        String t = transform.trim();
        if (t.isEmpty()) return "";

        String lower = t.toLowerCase();
        boolean hasVisualEffect = lower.contains("e_")
                || lower.contains("contrast")
                || lower.contains("brightness")
                || lower.contains("saturation")
                || lower.contains("gamma")
                || lower.contains("exposure")
                || lower.contains("vibrance")
                || lower.contains("improve")
                || lower.contains("enhance")
                || lower.contains("sharpen")
                || lower.contains("unsharp");

        if (hasVisualEffect) {
            log.warn("⚠️ Cloudinary transform contains visual effects; ignoring it to keep original image unchanged: {}", t);
            return "";
        }

        return t;
    }

    private String extractModelText(String rawBody) {
        if (rawBody == null || rawBody.isBlank()) return null;
        try {
            JsonNode root = objectMapper.readTree(rawBody);

            JsonNode choices = root.path("choices");
            if (choices.isArray() && !choices.isEmpty()) {
                JsonNode firstChoice = choices.get(0);
                String content = firstChoice.path("message").path("content").asText("");
                if (!content.isBlank()) {
                    return content;
                }
            }

            JsonNode content = root.path("content");
            if (!content.isArray()) {
                return rawBody;
            }

            StringBuilder out = new StringBuilder();
            for (JsonNode block : content) {
                String type = block.path("type").asText("");
                if ("text".equalsIgnoreCase(type)) {
                    String text = block.path("text").asText("");
                    if (!text.isBlank()) {
                        if (out.length() > 0) out.append("\n");
                        out.append(text);
                    }
                }
            }

            if (out.length() > 0) {
                return out.toString();
            }

            return rawBody;
        } catch (Exception e) {
            log.warn("⚠️ Failed to parse assistant text envelope: {}", e.getMessage());
            return rawBody;
        }
    }

    private EvaluationResult parseAIResponse(String response, String expectedPoseName, PoseModelAnalysis analysis) {
        try {
            String json = sanitizeAIResponse(response);
            JsonNode node = objectMapper.readTree(json);

            double score = node.path("score").asDouble(0.0);
            String feedback = node.path("feedback").asText("Không thể phân tích phản hồi.");

            if (score < 0 || score > 100) score = 0.0;

            return new EvaluationResult(score, feedback);

        } catch (Exception e) {
            String json = sanitizeAIResponse(response);
            EvaluationResult recovered = tryRecoverFromTruncatedJson(json);
            if (recovered != null) {
                log.warn("⚠️ AI JSON bị cắt, đã recover partial response. Reason: {}", e.getMessage());
                return recovered;
            }

            EvaluationResult recoveredFromText = tryRecoverFromNaturalLanguage(response);
            if (recoveredFromText != null) {
                log.warn("⚠️ Non-JSON AI response, recovered from plain text. Reason: {}", e.getMessage());
                return recoveredFromText;
            }

            log.warn("⚠️ Non-JSON AI response and cannot recover score. Returning raw text. Reason: {}", e.getMessage());
            String raw = response != null ? response.trim() : "";
            if (raw.isBlank()) {
                raw = "Không có phản hồi từ LLM.";
            }
            return new EvaluationResult(0.0, raw);
        }
    }

    private EvaluationResult tryRecoverFromNaturalLanguage(String raw) {
        if (raw == null || raw.isBlank()) return null;

        String feedback = raw.trim();
        if (feedback.isBlank()) return null;

        Double score = extractScore(raw);
        double safeScore = score != null ? score : 0.0;
        if (safeScore < 0 || safeScore > 100) safeScore = 0.0;

        return new EvaluationResult(safeScore, feedback);
    }

    private EvaluationResult tryRecoverFromTruncatedJson(String raw) {
        if (raw == null || raw.isBlank()) return null;

        Double score = extractScore(raw);
        String feedback = extractFeedback(raw);

        if (score == null && (feedback == null || feedback.isBlank())) {
            return null;
        }

        double safeScore = score != null ? score : 0.0;
        if (safeScore < 0 || safeScore > 100) safeScore = 0.0;

        String safeFeedback = (feedback == null || feedback.isBlank())
                ? "Đã nhận phản hồi nhưng nội dung không đầy đủ."
                : feedback;

        return new EvaluationResult(safeScore, safeFeedback);
    }

    private Double extractScore(String raw) {
        Matcher matcher = SCORE_PATTERN.matcher(raw);
        if (matcher.find()) {
            try {
                return Double.parseDouble(matcher.group(1));
            } catch (NumberFormatException ex) {
                // Continue to other score extraction patterns.
            }
        }

        // Example: "This pose scores in the 30-49 range"
        Matcher rangeMatcher = SCORE_RANGE_TEXT_PATTERN.matcher(raw);
        if (rangeMatcher.find()) {
            try {
                double min = Double.parseDouble(rangeMatcher.group(1));
                double max = Double.parseDouble(rangeMatcher.group(2));
                return (min + max) / 2.0;
            } catch (NumberFormatException ex) {
                // Continue to next pattern.
            }
        }

        // Example: "Score is 42"
        Matcher singleMatcher = SCORE_SINGLE_TEXT_PATTERN.matcher(raw);
        if (!singleMatcher.find()) return null;

        try {
            return Double.parseDouble(singleMatcher.group(1));
        } catch (NumberFormatException ex) {
            return null;
        }
    }

    private String extractFeedback(String raw) {
        int feedbackKey = raw.indexOf("\"feedback\"");
        if (feedbackKey < 0) return null;

        int colon = raw.indexOf(':', feedbackKey);
        if (colon < 0) return null;

        int openingQuote = raw.indexOf('"', colon + 1);
        if (openingQuote < 0) return null;

        return extractPossiblyUnterminatedJsonString(raw, openingQuote + 1).trim();
    }

    private String extractPossiblyUnterminatedJsonString(String input, int start) {
        StringBuilder out = new StringBuilder();
        boolean escaped = false;

        for (int i = start; i < input.length(); i++) {
            char c = input.charAt(i);

            if (escaped) {
                switch (c) {
                    case 'n' -> out.append('\n');
                    case 'r' -> out.append('\r');
                    case 't' -> out.append('\t');
                    case '"' -> out.append('"');
                    case '\\' -> out.append('\\');
                    default -> out.append(c);
                }
                escaped = false;
                continue;
            }

            if (c == '\\') {
                escaped = true;
                continue;
            }

            if (c == '"') {
                break;
            }

            out.append(c);
        }

        return out.toString();
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

    private String buildPromptPreview(String prompt, int maxChars) {
        if (prompt == null || prompt.isBlank()) return "(empty prompt)";

        int safeMax = Math.max(100, maxChars);
        String compact = prompt.replaceAll("[\\r\\n]+", " ").trim();

        if (compact.length() <= safeMax) {
            return compact;
        }

        return compact.substring(0, safeMax) + " ...[truncated]";
    }

    private boolean isGpt5Model(String model) {
        if (model == null) return false;
        return model.trim().toLowerCase().startsWith("gpt-5");
    }
}
