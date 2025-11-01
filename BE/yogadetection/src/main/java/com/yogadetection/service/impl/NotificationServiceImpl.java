package com.yogadetection.service.impl;

import com.yogadetection.dto.request.NotificationRequest;
import com.yogadetection.entity.Notification;
import com.yogadetection.entity.User;
import com.yogadetection.repository.NotificationRepository;
import com.yogadetection.repository.UserRepository;
import com.yogadetection.service.FcmService;
import com.yogadetection.service.NotificationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class NotificationServiceImpl implements NotificationService {
    private final NotificationRepository notificationRepository;
    private final FcmService fcmService;
    private final UserRepository userRepository;

    @Override
    public Notification saveNotification(Notification notification) {
        return notificationRepository.save(notification);
    }

    @Override
    public Page<Notification> getNotificationsForUser(String userId, Pageable pageable) {
        return notificationRepository.findByUserIdOrderByCreatedAtDesc(userId, pageable);
    }

    @Override
    public Page<Notification> getAllNotifications(Pageable pageable) {
        return notificationRepository.findAllByOrderByCreatedAtDesc(pageable);
    }

    @Override
    @Transactional
    public void pushNotificationToUser(String userId, NotificationRequest request) {
        // find user
        userRepository.findById(userId).ifPresent(user -> {
            String token = user.getFcmToken();
            fcmService.sendNotification(token, request.getNormalTitle(), request.getHtmlTitle() == null ? request.getNormalTitle() : request.getHtmlTitle());
            Notification n = Notification.builder()
                    .isAll(false)
                    .userId(user.getId())
                    .normalTitle(request.getNormalTitle())
                    .htmlTitle(request.getHtmlTitle())
                    .imageUrl(request.getImageUrl())
                    .build();
            saveNotification(n);
        });
    }

    @Override
    @Transactional
    public void pushNotificationToAll(NotificationRequest request) {
        List<User> usersWithToken = userRepository.findAllUsersWithFcmToken();
        for (User u : usersWithToken) {
            fcmService.sendNotification(u.getFcmToken(), request.getNormalTitle(), request.getHtmlTitle() == null ? request.getNormalTitle() : request.getHtmlTitle());
            Notification n = Notification.builder()
                    .isAll(true)
                    .userId(u.getId())
                    .normalTitle(request.getNormalTitle())
                    .htmlTitle(request.getHtmlTitle())
                    .imageUrl(request.getImageUrl())
                    .build();
            saveNotification(n);
        }
    }

    @Override
    public Notification getNotificationById(Long id) {
        return notificationRepository.findById(id).orElse(null);
    }
    
    @Override
    @Transactional
    public void markAsRead(Long notificationId, String userId) {
        notificationRepository.findById(notificationId).ifPresent(notification -> {
            // Verify notification belongs to user
            if (notification.getUserId().equals(userId)) {
                notification.setRead(true);
                notificationRepository.save(notification);
                log.info("Marked notification {} as read for user {}", notificationId, userId);
            } else {
                log.warn("User {} attempted to mark notification {} that doesn't belong to them", userId, notificationId);
            }
        });
    }
    
    @Override
    @Transactional
    public void markAllAsRead(String userId) {
        List<Notification> unreadNotifications = notificationRepository.findByUserIdAndIsReadFalse(userId);
        unreadNotifications.forEach(notification -> notification.setRead(true));
        notificationRepository.saveAll(unreadNotifications);
        log.info("Marked {} notifications as read for user {}", unreadNotifications.size(), userId);
    }
    
    @Override
    public long countUnreadNotifications(String userId) {
        return notificationRepository.countByUserIdAndIsReadFalse(userId);
    }
}
