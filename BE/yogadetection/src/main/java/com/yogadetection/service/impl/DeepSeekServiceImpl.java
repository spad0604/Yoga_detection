package com.yogadetection.service.impl;

import com.yogadetection.dto.MultipartFile;
import com.yogadetection.service.DeepSeekService;
import com.yogadetection.service.UploadService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

@Service
public class DeepSeekServiceImpl implements DeepSeekService {
    @Value("${deepseek.api.key}")
    private String apiKey;

    @Value("${deepseek.api.url}")
    private String apiUrl;

    private UploadService uploadService;

    @Override
    public String ask(String imageUrl) {
        RestTemplate restTemplate = new RestTemplate();
        String prompt = "This is image url: " + imageUrl;
        Map<String, Object> userMessage = Map.of(
                "role", "user",
                "content", prompt
        );

        Map<String, Object> systemMessage = Map.of(
                "role", "system",
                "content", "You are a professional yoga instructor and computer vision assistant. \n" +
                        "You analyze pose detection data (like keypoints, coordinates, or image inputs) \n" +
                        "and provide corrective feedback to help users refine their yoga posture safely and effectively. \n" +
                        "Always explain in a positive, encouraging tone and focus on safety and balance."
        );

        Map<String, Object> body = Map.of(
                "model", "deepseek-chat",
                "messages", List.of(systemMessage, userMessage)
        );

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(apiKey);

        HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);

        ResponseEntity<Map> response = restTemplate.exchange(
                apiUrl,
                HttpMethod.POST,
                request,
                Map.class
        );

        Map<String, Object> responseBody = response.getBody();
        if (responseBody != null && responseBody.containsKey("choices")) {
            List<Map<String, Object>> choices = (List<Map<String, Object>>) responseBody.get("choices");
            Map<String, Object> firstChoice = choices.get(0);
            Map<String, Object> messageMap = (Map<String, Object>) firstChoice.get("message");
            return (String) messageMap.get("content");
        }

        return "No response from DeepSeek.";
    }
}
