package com.yogadetection.service;

import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.yogadetection.utils.ParamKey;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

import static com.yogadetection.config.SocketServer.CONNECTION_STATE;

@Slf4j
@Service
@RequiredArgsConstructor
public class SocketIOService {
    
    private final SocketIOServer server;
    
    /**
     * Gửi kết quả chấm điểm yoga về client qua Socket.IO
     * @param userId User ID
     * @param attemptId Attempt ID vừa tạo
     * @param poseName Tên tư thế
     * @param score Điểm số từ AI
     * @param feedback Feedback từ AI
     * @return true nếu gửi thành công
     */
    public boolean sendPoseResult(String userId, String attemptId, String poseName, 
                                   Double score, String feedback) {
        try {
            // Kiểm tra user có đang connect không
            String sessionId = CONNECTION_STATE.get(userId);
            if (sessionId == null) {
                log.warn("User {} is not connected to Socket.IO", userId);
                return false;
            }
            
            // Tìm client theo userId
            SocketIOClient client = findClientByUserId(userId);
            if (client == null || !client.isChannelOpen()) {
                log.warn("Client not found or disconnected for user {}", userId);
                return false;
            }
            
            // Tạo payload
            Map<String, Object> payload = new HashMap<>();
            payload.put("type", "pose_result");
            payload.put("attemptId", attemptId);
            payload.put("poseName", poseName);
            payload.put("score", score != null ? score : 0.0);
            payload.put("feedback", feedback != null ? feedback : "");
            payload.put("timestamp", System.currentTimeMillis());
            
            // Gửi event "pose_result" về client
            client.sendEvent("pose_result", payload);
            
            log.info("Sent pose result to user {} via Socket.IO: score={}", userId, score);
            return true;
            
        } catch (Exception e) {
            log.error("Failed to send pose result to user {} via Socket.IO: {}", 
                    userId, e.getMessage(), e);
            return false;
        }
    }
    
    /**
     * Gửi message tùy chỉnh cho user
     */
    public boolean sendMessageToUser(String userId, String eventName, Object data) {
        try {
            SocketIOClient client = findClientByUserId(userId);
            if (client != null && client.isChannelOpen()) {
                client.sendEvent(eventName, data);
                log.info("Sent event '{}' to user {}", eventName, userId);
                return true;
            }
            return false;
        } catch (Exception e) {
            log.error("Failed to send message to user {}: {}", userId, e.getMessage());
            return false;
        }
    }
    
    /**
     * Broadcast message cho tất cả clients đang connect
     */
    public void broadcastMessage(String eventName, Object data) {
        server.getBroadcastOperations().sendEvent(eventName, data);
        log.info("Broadcasted event '{}' to all clients", eventName);
    }
    
    /**
     * Kiểm tra user có đang connect không
     */
    public boolean isUserConnected(String userId) {
        String sessionId = CONNECTION_STATE.get(userId);
        if (sessionId == null) {
            return false;
        }
        
        SocketIOClient client = findClientByUserId(userId);
        return client != null && client.isChannelOpen();
    }
    
    /**
     * Lấy số lượng clients đang connect
     */
    public int getConnectedClientsCount() {
        return CONNECTION_STATE.size();
    }
    
    /**
     * Tìm client theo userId từ session
     */
    private SocketIOClient findClientByUserId(String userId) {
        for (SocketIOClient client : server.getAllClients()) {
            String clientUserId = client.get(ParamKey.USER_ID);
            if (userId.equals(clientUserId)) {
                return client;
            }
        }
        return null;
    }
}
