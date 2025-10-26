package com.yogadetection.controller;

import com.yogadetection.entity.User;
import com.yogadetection.service.FcmService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
    
    /**
     * Test endpoint để gửi notification cho chính user đang login
     * GET /api/notifications/test
     */
    @GetMapping("/test")
    public Map<String, Object> sendTestNotification(@AuthenticationPrincipal User user) {
        Map<String, Object> response = new HashMap<>();
        
        if (user.getFcmToken() == null || user.getFcmToken().isEmpty()) {
            response.put("success", false);
            response.put("message", "FCM token not found. Please login again to register FCM token.");
            return response;
        }
        
        boolean success = fcmService.sendNotification(
                user.getFcmToken(),
                "🧘 Test Notification",
                String.format("Xin chào %s! Đây là thông báo test từ Yoga Detection app.", 
                        user.getFirstName())
        );
        
        response.put("success", success);
        response.put("message", success ? "Test notification sent successfully!" : "Failed to send notification");
        response.put("fcmToken", user.getFcmToken().substring(0, Math.min(20, user.getFcmToken().length())) + "...");
        
        return response;
    }
    
    /**
     * Gửi notification nhắc nhở yoga cho chính user
     * POST /api/notifications/yoga-reminder
     */
    @PostMapping("/yoga-reminder")
    public Map<String, Object> sendYogaReminder(@AuthenticationPrincipal User user) {
        Map<String, Object> response = new HashMap<>();
        
        if (user.getFcmToken() == null || user.getFcmToken().isEmpty()) {
            response.put("success", false);
            response.put("message", "FCM token not found");
            return response;
        }
        
        boolean success = fcmService.sendNotification(
                user.getFcmToken(),
                "🧘 Đã lâu rồi bạn chưa tập yoga!",
                String.format("Xin chào %s! Hãy dành vài phút để luyện tập yoga hôm nay nhé. Sức khỏe của bạn rất quan trọng! 💪",
                        user.getFirstName())
        );
        
        response.put("success", success);
        response.put("message", success ? "Yoga reminder sent!" : "Failed to send reminder");
        
        return response;
    }
}
