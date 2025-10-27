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
            if (token == null || token.isEmpty()) {
                log.warn("FCM token is null or empty, skipping notification");
                return false;
            }
            
            Notification notification = Notification.builder()
                    .setTitle(title)
                    .setBody(body)
                    .build();

            Message message = Message.builder()
                    .setNotification(notification)
                    .setToken(token)
                    .build();

            String response = FirebaseMessaging.getInstance().send(message);
            log.info("Notification sent successfully. Message ID: {}", response);
            return true;
            
        } catch (FirebaseMessagingException e) {
            log.error("Failed to send FCM notification: {} - Error code: {}", 
                    e.getMessage(), e.getMessagingErrorCode());
            return false;
        } catch (Exception e) {
            log.error("Unexpected error sending notification: {}", e.getMessage(), e);
            return false;
        }
    }
    
    /**
     * Gửi notification với data payload
     */
    public boolean sendNotificationWithData(String token, String title, String body, 
                                           java.util.Map<String, String> data) {
        try {
            if (token == null || token.isEmpty()) {
                log.warn("FCM token is null or empty, skipping notification");
                return false;
            }
            
            Notification notification = Notification.builder()
                    .setTitle(title)
                    .setBody(body)
                    .build();

            Message.Builder messageBuilder = Message.builder()
                    .setNotification(notification)
                    .setToken(token);
            
            if (data != null && !data.isEmpty()) {
                messageBuilder.putAllData(data);
            }

            String response = FirebaseMessaging.getInstance().send(messageBuilder.build());
            log.info("Notification with data sent successfully. Message ID: {}", response);
            return true;
            
        } catch (FirebaseMessagingException e) {
            log.error("Failed to send FCM notification with data: {} - Error code: {}", 
                    e.getMessage(), e.getMessagingErrorCode());
            return false;
        } catch (Exception e) {
            log.error("Unexpected error sending notification with data: {}", e.getMessage(), e);
            return false;
        }
    }
}
