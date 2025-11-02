package com.yogadetection.service;

import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class FcmService {
    
    /**
     * Gửi push notification qua Firebase Cloud Messaging
     * @param token FCM token của device
     * @param title Tiêu đề notification
     * @param body Nội dung notification
     * @return true nếu gửi thành công, false nếu thất bại
     */
    public boolean sendNotification(String token, String title, String body) {
        try {
            // Validate token format
            if (token == null || token.trim().isEmpty()) {
                log.warn("FCM token is null or empty, skipping notification");
                return false;
            }
            
            // Check if token looks valid (basic check)
            if (token.length() < 20) {
                log.warn("FCM token appears invalid (too short): {}", token.substring(0, Math.min(10, token.length())));
                return false;
            }
            
            Notification notification = Notification.builder()
                    .setTitle(title)
                    .setBody(body)
                    .build();

            Message message = Message.builder()
                    .setNotification(notification)
                    .setToken(token.trim())
                    .build();

            String response = FirebaseMessaging.getInstance().send(message);
            log.info("✅ FCM notification sent successfully. Message ID: {}", response);
            return true;
            
        } catch (FirebaseMessagingException e) {
            if ("INVALID_ARGUMENT".equals(e.getMessagingErrorCode().name())) {
                log.warn("⚠️ Invalid FCM token detected - User needs to re-register device. Error: {}", e.getMessage());
            } else {
                log.error("❌ Failed to send FCM notification: {} - Error code: {}", 
                        e.getMessage(), e.getMessagingErrorCode());
            }
            return false;
        } catch (Exception e) {
            log.error("❌ Unexpected error sending notification: {}", e.getMessage(), e);
            return false;
        }
    }
    
    /**
     * Gửi notification với data payload
     */
    public boolean sendNotificationWithData(String token, String title, String body, 
                                           java.util.Map<String, String> data) {
        try {
            // Validate token format
            if (token == null || token.trim().isEmpty()) {
                log.warn("FCM token is null or empty, skipping notification with data");
                return false;
            }
            
            // Check if token looks valid
            if (token.length() < 20) {
                log.warn("FCM token appears invalid (too short): {}", token.substring(0, Math.min(10, token.length())));
                return false;
            }
            
            Notification notification = Notification.builder()
                    .setTitle(title)
                    .setBody(body)
                    .build();

            Message.Builder messageBuilder = Message.builder()
                    .setNotification(notification)
                    .setToken(token.trim());
            
            if (data != null && !data.isEmpty()) {
                messageBuilder.putAllData(data);
            }

            String response = FirebaseMessaging.getInstance().send(messageBuilder.build());
            log.info("✅ FCM notification with data sent successfully. Message ID: {}", response);
            return true;
            
        } catch (FirebaseMessagingException e) {
            if ("INVALID_ARGUMENT".equals(e.getMessagingErrorCode().name())) {
                log.warn("⚠️ Invalid FCM token detected - User needs to re-register device. Error: {}", e.getMessage());
            } else {
                log.error("❌ Failed to send FCM notification with data: {} - Error code: {}", 
                        e.getMessage(), e.getMessagingErrorCode());
            }
            return false;
        } catch (Exception e) {
            log.error("❌ Unexpected error sending notification with data: {}", e.getMessage(), e);
            return false;
        }
    }
}
