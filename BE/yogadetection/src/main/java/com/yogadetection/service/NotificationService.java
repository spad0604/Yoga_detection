package com.yogadetection.service;

import com.yogadetection.dto.request.NotificationRequest;
import com.yogadetection.entity.Notification;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface NotificationService {
    Notification saveNotification(Notification notification);
    Page<Notification> getNotificationsForUser(String userId, Pageable pageable);
    Page<Notification> getAllNotifications(Pageable pageable);
    void pushNotificationToUser(String userId, NotificationRequest request);
    void pushNotificationToAll(NotificationRequest request);
    Notification getNotificationById(Long id);
    
    /**
     * Đánh dấu notification đã đọc
     */
    void markAsRead(Long notificationId, String userId);
    
    /**
     * Đánh dấu tất cả notifications của user đã đọc
     */
    void markAllAsRead(String userId);
    
    /**
     * Lấy số lượng notifications chưa đọc của user
     */
    long countUnreadNotifications(String userId);
}
