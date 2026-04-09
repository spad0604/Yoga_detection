package com.yogadetection.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yogadetection.dto.request.Landmark;
import com.yogadetection.service.PoseModelService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class PoseModelServiceImpl implements PoseModelService {

    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper;

    @Value("${pose.model.enabled:true}")
    private boolean enabled;

    @Value("${pose.model.base-url:http://localhost:8001}")
    private String baseUrl;

    @Value("${pose.model.timeout-ms:1500}")
    private int timeoutMs;

    @Override
    public Optional<PoseModelAnalysis> analyze(List<Landmark> landmarks) {
        if (!enabled) return Optional.empty();
        if (landmarks == null || landmarks.isEmpty()) return Optional.empty();

        try {
            String url = baseUrl + "/analyze";

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            var payload = objectMapper.createObjectNode();
            payload.set("landmarks", objectMapper.valueToTree(landmarks));
            payload.put("topK", 3);

            HttpEntity<String> request = new HttpEntity<>(payload.toString(), headers);

            String response = restTemplate.postForObject(url, request, String.class);
            if (response == null || response.isBlank()) return Optional.empty();

            JsonNode node = objectMapper.readTree(response);
            String predictedPose = node.path("predictedPose").asText(null);
            double confidence = node.path("confidence").asDouble(0.0);

            List<PoseModelAnalysis.TopK> topK = new ArrayList<>();
            for (JsonNode item : node.path("topK")) {
                String pose = item.path("pose").asText(null);
                double conf = item.path("confidence").asDouble(0.0);
                if (pose != null) topK.add(new PoseModelAnalysis.TopK(pose, conf));
            }

            PoseModelAnalysis.MostOff mostOff = null;
            JsonNode mostOffNode = node.path("mostOff");
            if (mostOffNode != null && mostOffNode.isObject()) {
                String metric = mostOffNode.path("metric").asText(null);
                double diff = mostOffNode.path("diff").asDouble(0.0);
                double actual = mostOffNode.path("actual").asDouble(0.0);
                double reference = mostOffNode.path("reference").asDouble(0.0);
                if (metric != null) {
                    mostOff = new PoseModelAnalysis.MostOff(metric, diff, actual, reference);
                }
            }

            Map<String, Double> actualAngles = null;
            JsonNode actualAnglesNode = node.path("actualAngles");
            if (actualAnglesNode != null && actualAnglesNode.isObject()) {
                actualAngles = objectMapper.convertValue(actualAnglesNode, new TypeReference<Map<String, Double>>() {});
            }

            Map<String, Double> referenceAngles = null;
            JsonNode referenceAnglesNode = node.path("referenceAngles");
            if (referenceAnglesNode != null && referenceAnglesNode.isObject()) {
                referenceAngles = objectMapper.convertValue(referenceAnglesNode, new TypeReference<Map<String, Double>>() {});
            }

            if (predictedPose == null || predictedPose.isBlank()) return Optional.empty();

            return Optional.of(new PoseModelAnalysis(predictedPose, confidence, topK, mostOff, actualAngles, referenceAngles));

        } catch (Exception e) {
            log.warn("⚠️ Pose model service unavailable: {}", e.getMessage());
            return Optional.empty();
        }
    }
}
