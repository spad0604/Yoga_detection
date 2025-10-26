package com.yogadetection.websocket;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yogadetection.dto.request.PoseLandmarkRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Slf4j
@Component
@RequiredArgsConstructor
public class PoseWebSocketHandler extends TextWebSocketHandler {
    private final ObjectMapper objectMapper;
    
    private final Map<String, WebSocketSession> activeSessions = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String email = (String) session.getAttributes().get("email");
        
        if (email != null) {
            activeSessions.put(email, session);
            log.info("WebSocket connection established for user: {}, sessionId: {}", email, session.getId());
            
            session.sendMessage(new TextMessage("{\"type\":\"connected\",\"message\":\"Successfully connected to pose detection websocket\"}"));
        } else {
            log.warn("Session established without email attribute, closing connection");
            session.close(CloseStatus.BAD_DATA);
        }
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String email = (String) session.getAttributes().get("email");
        String payload = message.getPayload();
        
        log.debug("Received message from user {}: {}", email, payload);
        
        try {
            PoseLandmarkRequest[] requests = objectMapper.readValue(payload, PoseLandmarkRequest[].class);
            
            for (PoseLandmarkRequest request : requests) {
                processPoseData(email, request);
            }
            
            String response = objectMapper.writeValueAsString(Map.of(
                    "type", "ack",
                    "message", "Pose data received successfully",
                    "count", requests.length
            ));
            session.sendMessage(new TextMessage(response));
            
        } catch (Exception e) {
            log.error("Error processing pose data from user {}: {}", email, e.getMessage(), e);
            
            String errorResponse = objectMapper.writeValueAsString(Map.of(
                    "type", "error",
                    "message", "Failed to process pose data: " + e.getMessage()
            ));
            session.sendMessage(new TextMessage(errorResponse));
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String email = (String) session.getAttributes().get("email");
        
        if (email != null) {
            activeSessions.remove(email);
            log.info("WebSocket connection closed for user: {}, status: {}", email, status);
        }
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        String email = (String) session.getAttributes().get("email");
        log.error("WebSocket error for user {}: {}", email, exception.getMessage(), exception);
        
        if (session.isOpen()) {
            session.close(CloseStatus.SERVER_ERROR);
        }
    }

    private void processPoseData(String email, PoseLandmarkRequest request) {
        log.info("Processing pose data for user: {}, poseId: {}, landmarks count: {}", 
                email, request.getPoseId(), request.getLandmarks().size());
        
        // Socket giờ chỉ nhận để debug, không xử lý gì
        // Tất cả xử lý chính qua REST API POST /api/pose-attempts
    }

    /**
     * Gửi kết quả chấm điểm về cho user qua WebSocket
     * @param email Email của user
     * @param attemptId ID của attempt vừa tạo
     * @param score Điểm số từ AI (0-100)
     * @param feedback Feedback từ AI
     * @param poseName Tên tư thế
     */
    public void sendPoseResultToUser(String email, String attemptId, Double score, String feedback, String poseName) {
        WebSocketSession session = activeSessions.get(email);
        if (session != null && session.isOpen()) {
            try {
                Map<String, Object> result = Map.of(
                        "type", "pose_result",
                        "attemptId", attemptId,
                        "poseName", poseName,
                        "score", score != null ? score : 0.0,
                        "feedback", feedback != null ? feedback : "",
                        "timestamp", System.currentTimeMillis()
                );
                
                String message = objectMapper.writeValueAsString(result);
                session.sendMessage(new TextMessage(message));
                log.info("Pose result sent to user {} via WebSocket: score={}", email, score);
            } catch (Exception e) {
                log.error("Failed to send pose result to user {}: {}", email, e.getMessage());
            }
        } else {
            log.warn("User {} is not connected to WebSocket, result not sent", email);
        }
    }

    /**
     * Gửi message tùy chỉnh cho user
     */
    public void sendMessageToUser(String email, String message) {
        WebSocketSession session = activeSessions.get(email);
        if (session != null && session.isOpen()) {
            try {
                session.sendMessage(new TextMessage(message));
                log.debug("Message sent to user {}: {}", email, message);
            } catch (Exception e) {
                log.error("Failed to send message to user {}: {}", email, e.getMessage());
            }
        }
    }

    public void broadcastMessage(String message) {
        activeSessions.forEach((email, session) -> {
            if (session.isOpen()) {
                try {
                    session.sendMessage(new TextMessage(message));
                } catch (Exception e) {
                    log.error("Failed to broadcast to user {}: {}", email, e.getMessage());
                }
            }
        });
    }

    public int getActiveUsersCount() {
        return activeSessions.size();
    }

    public boolean isUserConnected(String email) {
        return activeSessions.containsKey(email) && activeSessions.get(email).isOpen();
    }
}
