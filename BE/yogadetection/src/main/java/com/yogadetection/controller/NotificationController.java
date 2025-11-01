package com.yogadetection.controller;

import com.yogadetection.dto.request.NotificationRequest;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.entity.Notification;
import com.yogadetection.config.ErrorCode;
import com.yogadetection.entity.User;
import com.yogadetection.service.FcmService;
import com.yogadetection.service.NotificationService;
import com.yogadetection.dto.response.ApiResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/notifications")
public class NotificationController {
    
    private final FcmService fcmService;
    private final NotificationService notificationService;
    
    /**
     * Test endpoint để gửi notification cho chính user đang login
     * GET /api/notifications/test
     */
    @GetMapping("/test")
    public ApiResponse<String> sendTestNotification(@AuthenticationPrincipal User user) {
        if (user.getFcmToken() == null || user.getFcmToken().isEmpty()) {
            log.warn("FCM token not found for user {}", user == null ? "unknown" : user.getEmail());
            return ApiResponse.error(ErrorCode.WRONG_DATA_FORMAT);
        }

        boolean success = fcmService.sendNotification(
                user.getFcmToken(),
                "🧘 Test Notification",
                String.format("Xin chào %s! Đây là thông báo test từ Yoga Detection app.",
                        user.getFirstName())
        );

        // save notification record
        NotificationRequest req = new NotificationRequest(false, user.getId(), "🧘 Test Notification",
                String.format("Xin chào %s! Đây là thông báo test từ Yoga Detection app.", user.getFirstName()), null);
        notificationService.pushNotificationToUser(user.getId(), req);

        log.info("Test notification sent to {}: {}", user.getEmail(), success);
        return ApiResponse.success("Test notification sent");
    }
    
    /**
     * Gửi notification nhắc nhở yoga cho chính user
     * POST /api/notifications/yoga-reminder
     */
    @PostMapping("/yoga-reminder")
    public ApiResponse<String> sendYogaReminder(@AuthenticationPrincipal User user) {
        if (user.getFcmToken() == null || user.getFcmToken().isEmpty()) {
            log.warn("FCM token not found for user {}", user == null ? "unknown" : user.getEmail());
            return ApiResponse.error(ErrorCode.WRONG_DATA_FORMAT);
        }

        String title = "🧘 Đã lâu rồi bạn chưa tập yoga!";
        String body = String.format("Xin chào %s! Hãy dành vài phút để luyện tập yoga hôm nay nhé. Sức khỏe của bạn rất quan trọng! 💪",
                user.getFirstName());
        boolean success = fcmService.sendNotification(user.getFcmToken(), title, body);

        NotificationRequest req = new NotificationRequest(false, user.getId(), title, body, null);
        notificationService.pushNotificationToUser(user.getId(), req);

        log.info("Yoga reminder sent to {}: {}", user.getEmail(), success);
        return ApiResponse.success("Yoga reminder sent");
    }

    /**
     * Lấy danh sách notification của user (paged)
     * GET /api/notifications?page=0&size=20
     */
    @GetMapping
    public ApiResponse<PagedResponse<Notification>> getNotifications(@AuthenticationPrincipal User user,
                                                                     @RequestParam(defaultValue = "0") int page,
                                                                     @RequestParam(defaultValue = "20") int size) {
    org.springframework.data.domain.Page<Notification> pageResult = notificationService.getNotificationsForUser(user.getId(), PageRequest.of(page, size)); 

    PagedResponse<Notification> paged = PagedResponse.<Notification>builder()
                .items(pageResult.getContent())
                .page(pageResult.getNumber())
                .pageSize(pageResult.getSize())
                .totalElements(pageResult.getTotalElements())
                .totalPages(pageResult.getTotalPages())
                .hasNext(pageResult.hasNext())
                .hasPrevious(pageResult.hasPrevious())
                .build();
        return ApiResponse.success(paged);
    }

    /**
     * Admin push notification to all or specific user
     * POST /api/notifications/push
     * Body: NotificationRequest
     */
    @PostMapping("/push")
    public ApiResponse<String> adminPushNotification(@RequestBody NotificationRequest request,
                                                      @AuthenticationPrincipal User user) {
        // NOTE: project may not have roles configured; ideally protect this endpoint with method security
        if (!request.isAll() && (request.getUserId() == null || request.getUserId().isBlank())) {
            log.warn("adminPushNotification called without userId when isAll=false");
            return ApiResponse.error(ErrorCode.WRONG_DATA_FORMAT);
        }

        if (request.isAll()) {
            notificationService.pushNotificationToAll(request);
        } else {
            notificationService.pushNotificationToUser(request.getUserId(), request);
        }
        log.info("Admin push executed by {}: isAll={}", user == null ? "unknown" : user.getEmail(), request.isAll());
        return ApiResponse.success("Notification pushed successfully");
    }

    /**
     * Get notification details by id
     */
    @GetMapping("/{id}")
    public ApiResponse<Notification> getNotificationDetails(@PathVariable Long id) {
        Notification n = notificationService.getNotificationById(id);
        if (n == null) {
            return ApiResponse.error(ErrorCode.NOT_FOUND);
        }
        return ApiResponse.success(n);
    }
    
    /**
     * Đánh dấu notification đã đọc
     * PUT /api/notifications/{id}/read
     */
    @PutMapping("/{id}/read")
    public ApiResponse<String> markAsRead(
            @PathVariable Long id,
            @AuthenticationPrincipal User user) {
        notificationService.markAsRead(id, user.getId());
        return ApiResponse.success("Notification marked as read");
    }
    
    /**
     * Đánh dấu tất cả notifications đã đọc
     * PUT /api/notifications/read-all
     */
    @PutMapping("/read-all")
    public ApiResponse<String> markAllAsRead(@AuthenticationPrincipal User user) {
        notificationService.markAllAsRead(user.getId());
        return ApiResponse.success("All notifications marked as read");
    }
    
    /**
     * Lấy số lượng notifications chưa đọc
     * GET /api/notifications/unread-count
     */
    @GetMapping("/unread-count")
    public ApiResponse<Map<String, Long>> getUnreadCount(@AuthenticationPrincipal User user) {
        long count = notificationService.countUnreadNotifications(user.getId());
        Map<String, Long> response = new HashMap<>();
        response.put("unreadCount", count);
        return ApiResponse.success(response);
    }
}
