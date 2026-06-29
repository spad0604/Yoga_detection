package com.yogadetection.service.impl;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
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

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * AI Pose Evaluation Service.
 *
 * Sends the user image directly to OpenAI Vision and asks for structured yoga feedback.
 * Landmarks are still accepted by the public API for compatibility/history, but they are
 * not sent to the model prompt.
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

    @Value("${openai.api-key:${OPENAI_API_KEY:}}")
    private String apiKey;

    @Value("${openai.base-url:https://api.openai.com}")
    private String openAiBaseUrl;

    @Value("${openai.model:gpt-5.4-mini}")
    private String openAiModel;

    @Value("${openai.max-output-tokens:1200}")
    private int openAiMaxOutputTokens;

    @Value("${openai.responses-path:/v1/responses}")
    private String openAiResponsesPath;

    @Value("${ai.llm.use-system-curl:true}")
    private boolean useSystemCurl;

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
            EvaluationResult result = callOpenAIVision(imageUrl, imageFile, prompt, actualPoseName, analysis);

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

        prompt.append("Bạn là huấn luyện viên yoga giàu kinh nghiệm, chuyên đánh giá tư thế từ ảnh.\n");
        prompt.append("Chỉ dùng ảnh người dùng gửi trực tiếp và thông tin tư thế bên dưới. Không giả định từ landmark, góc khớp, hay model phân loại nội bộ.\n");
        prompt.append("Chỉ trả về JSON hợp lệ, không markdown, không code block, không giải thích ngoài JSON.\n\n");

        prompt.append("TƯ THẾ CẦN ĐÁNH GIÁ:\n");
        prompt.append("- Tên tư thế: ").append(poseName).append("\n");
        prompt.append("- Mô tả chuẩn: ").append(poseDescription == null || poseDescription.isBlank() ? "Không có mô tả." : poseDescription).append("\n\n");

        prompt.append("CÁCH ĐÁNH GIÁ ẢNH:\n");
        prompt.append("- Xác định người dùng có đang thực hiện đúng dáng ").append(poseName).append(" hay không.\n");
        prompt.append("- Nhìn vào căn chỉnh toàn thân: đầu/cổ, vai, cột sống, hông, gối, cổ chân, bàn chân, tay và hướng trọng tâm.\n");
        prompt.append("- Bỏ qua nền, ánh sáng và chất lượng camera nếu vẫn nhìn rõ cơ thể.\n");
        prompt.append("- Nếu ảnh không rõ người, không rõ tư thế, hoặc tư thế khác hẳn dáng yêu cầu, score phải thấp.\n");
        prompt.append("- Feedback phải cụ thể, chi tiết, dễ tập theo, nêu rõ người dùng nên chỉnh gì và chỉnh như thế nào.\n\n");

        prompt.append("TIÊU CHÍ CHẤM ĐIỂM (0-100):\n");
        prompt.append("- 90-100: đúng dáng rõ ràng, căn chỉnh tốt, chỉ cần chỉnh rất nhỏ.\n");
        prompt.append("- 70-89: đúng dáng cơ bản, có 1-2 lỗi kỹ thuật đáng sửa.\n");
        prompt.append("- 50-69: nhận ra dáng nhưng nhiều phần cơ thể chưa vào vị trí.\n");
        prompt.append("- 30-49: cố gắng làm dáng nhưng sai nhiều, cần hướng dẫn lại từ đầu.\n");
        prompt.append("- 0-29: không phải dáng yêu cầu, ảnh không đủ thông tin, hoặc tư thế có rủi ro cao.\n\n");

        prompt.append("OUTPUT BẮT BUỘC:\n");
        prompt.append("- Trả về CHÍNH XÁC 1 object JSON hợp lệ, không thêm ký tự nào trước/sau JSON.\n");
        prompt.append("- Ký tự đầu tiên phải là '{' và ký tự cuối cùng phải là '}'.\n");
        prompt.append("- Toàn bộ nội dung feedback phải là TIẾNG VIỆT tự nhiên.\n");
        prompt.append("- score trong khoảng 0-100.\n");
        prompt.append("- feedback dài 5-8 câu, có các phần: Đánh giá tổng quan, Điểm mạnh, Cần cải thiện, Cách chỉnh ngay lần tập tiếp theo.\n\n");

        prompt.append("Schema bắt buộc:\n");
        prompt.append("{\"score\": <number 0..100>, \"feedback\": \"<Vietnamese text>\"}\n\n");

        prompt.append("Nếu không thể xác định tư thế, trả về:\n");
        prompt.append("{\"score\": 0, \"feedback\": \"Mình chưa thấy rõ bạn đang thực hiện đúng dáng ").append(poseName).append(". Hãy chụp lại toàn thân trong khung hình, giữ camera ổn định và thử lại với đúng tư thế nhé.\"}");

        return prompt.toString();
    }

    private EvaluationResult callOpenAIVision(
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
            String aiImageUrl;

            if (imageUrl != null && !imageUrl.isBlank()) {
                aiImageUrl = toAiImageUrl(imageUrl);
                mediaSourceLog = aiImageUrl;
            } else if (imageFile != null && !imageFile.isEmpty()) {
                String contentType = imageFile.getContentType();
                if (contentType == null || contentType.isBlank()) {
                    contentType = MediaType.IMAGE_JPEG_VALUE;
                }
                aiImageUrl = "data:" + contentType + ";base64,"
                        + Base64.getEncoder().encodeToString(imageFile.getBytes());
                mediaSourceLog = "multipart image bytes (" + contentType + ", " + imageFile.getSize() + " bytes)";
            } else {
                log.warn("⚠️ No image provided for OpenAI Vision call → dùng template fallback");
                return new EvaluationResult(0.0, PoseFeedbackTemplate.buildFallbackFeedback(expectedPoseName, analysis));
            }

            log.info("🌐 OpenAI base URL: {}", openAiBaseUrl);
            log.info("📤 Sending image directly to OpenAI Vision: {}", mediaSourceLog);

            int promptLen = prompt != null ? prompt.length() : 0;
            if (logPromptPreview) {
                log.info("📝 OpenAI prompt preview (len={}): {}", promptLen, buildPromptPreview(prompt, promptPreviewMaxChars));
            } else {
                log.info("📝 OpenAI prompt length: {}", promptLen);
            }

            var payload = objectMapper.createObjectNode();
            payload.put("model", openAiModel);
            payload.put("max_output_tokens", openAiMaxOutputTokens);

            var input = objectMapper.createArrayNode();
            var message = objectMapper.createObjectNode();
            message.put("role", "user");
            var content = objectMapper.createArrayNode();
            var textBlock = objectMapper.createObjectNode();
            textBlock.put("type", "input_text");
            textBlock.put("text", prompt);
            content.add(textBlock);
            var imageBlock = objectMapper.createObjectNode();
            imageBlock.put("type", "input_image");
            imageBlock.put("image_url", aiImageUrl);
            content.add(imageBlock);
            message.set("content", content);
            input.add(message);
            payload.set("input", input);

            String responseBody = invokeOpenAIResponses(payload.toString());

            if (responseBody == null || responseBody.isBlank()) {
                log.warn("⚠️ OpenAI returned empty response body → dùng template fallback");
                return new EvaluationResult(0.0, PoseFeedbackTemplate.buildFallbackFeedback(expectedPoseName, analysis));
            }

            log.info("📥 Raw OpenAI response: {}", responseBody.replaceAll("[\\r\\n]+", " ").trim());

            String assistantText = extractAssistantText(responseBody);
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

    private String invokeOpenAIResponses(String payloadJson) throws Exception {
        if (useSystemCurl) {
            return invokeOpenAIResponsesWithCurl(payloadJson);
        }
        return invokeOpenAIResponsesWithRestTemplate(payloadJson);
    }

    private String invokeOpenAIResponsesWithRestTemplate(String payloadJson) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(apiKey);
        headers.set("User-Agent", DEFAULT_USER_AGENT);

        String endpoint = openAiBaseUrl + openAiResponsesPath;
        HttpEntity<String> request = new HttpEntity<>(payloadJson, headers);
        ResponseEntity<String> responseEntity = restTemplate.postForEntity(endpoint, request, String.class);
        return responseEntity.getBody();
    }

    private String invokeOpenAIResponsesWithCurl(String payloadJson) throws Exception {
        String endpoint = openAiBaseUrl + openAiResponsesPath;

        ProcessBuilder pb = new ProcessBuilder(
                "curl",
                "-sS",
                "-X", "POST",
                endpoint,
                "-H", "User-Agent: " + DEFAULT_USER_AGENT,
                "-H", "Authorization: Bearer " + apiKey,
                "-H", "content-type: application/json",
                "--data-raw", payloadJson,
                "-w", "\n__HTTP_STATUS__:%{http_code}"
        );
        pb.redirectErrorStream(true);

        Process process = pb.start();
        String output;
        try (var in = process.getInputStream()) {
            output = new String(in.readAllBytes(), StandardCharsets.UTF_8);
        }

        int exitCode = process.waitFor();
        if (exitCode != 0) {
            throw new IllegalStateException("curl call failed with exit code=" + exitCode + ", output=" + output);
        }

        String marker = "\n__HTTP_STATUS__:";
        int markerIdx = output.lastIndexOf(marker);
        if (markerIdx < 0) {
            throw new IllegalStateException("Cannot parse curl HTTP status marker from output=" + output);
        }

        String body = output.substring(0, markerIdx).trim();
        String statusRaw = output.substring(markerIdx + marker.length()).trim();

        int httpStatus;
        try {
            httpStatus = Integer.parseInt(statusRaw);
        } catch (NumberFormatException e) {
            throw new IllegalStateException("Invalid curl HTTP status: " + statusRaw + ", output=" + output, e);
        }

        if (httpStatus >= 400) {
            throw new IllegalStateException("OpenAI HTTP " + httpStatus + ": " + body);
        }

        return body;
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

    private String extractAssistantText(String rawBody) {
        if (rawBody == null || rawBody.isBlank()) return null;
        try {
            JsonNode root = objectMapper.readTree(rawBody);

            String outputText = root.path("output_text").asText("");
            if (!outputText.isBlank()) {
                return outputText;
            }

            JsonNode output = root.path("output");
            if (output.isArray()) {
                StringBuilder out = new StringBuilder();
                for (JsonNode item : output) {
                    JsonNode itemContent = item.path("content");
                    if (!itemContent.isArray()) continue;
                    for (JsonNode block : itemContent) {
                        String text = block.path("text").asText("");
                        if (text.isBlank()) {
                            text = block.path("content").asText("");
                        }
                        if (!text.isBlank()) {
                            if (out.length() > 0) out.append("\n");
                            out.append(text);
                        }
                    }
                }
                if (out.length() > 0) {
                    return out.toString();
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
}
