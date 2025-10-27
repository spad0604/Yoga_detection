package com.yogadetection.scheduler;

import com.yogadetection.entity.User;
import com.yogadetection.entity.YogaPoseAttempt;
import com.yogadetection.repository.UserRepository;
import com.yogadetection.repository.YogaPoseAttemptRepository;
import com.yogadetection.service.FcmService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.OffsetDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
public class YogaReminderScheduler {
    
    private final UserRepository userRepository;
    private final YogaPoseAttemptRepository attemptRepository;
    private final FcmService fcmService;
    
    /**
     * Chạy mỗi ngày lúc 9:00 sáng để kiểm tra users không luyện tập > 24h
     * Cron: giây phút giờ ngày tháng thứ
     */
    @Scheduled(cron = "0 0 9 * * ?") // 9:00 AM mỗi ngày
    public void sendYogaReminder() {
        log.info("Starting yoga reminder scheduler...");
        
        // Lấy tất cả users có FCM token
        List<User> users = userRepository.findAllUsersWithFcmToken();
        log.info("Found {} users with FCM tokens", users.size());
        
        int remindersSent = 0;
        
        for (User user : users) {
            try {
                // Lấy lần attempt cuối cùng
                List<YogaPoseAttempt> latestAttempts = attemptRepository.findLatestAttemptByUserId(
                        user.getId(), PageRequest.of(0, 1));
                
                boolean shouldSendReminder = false;
                
                if (latestAttempts.isEmpty()) {
                    // User chưa bao giờ luyện tập
                    shouldSendReminder = true;
                    log.info("User {} has never practiced yoga", user.getEmail());
                } else {
                    YogaPoseAttempt latestAttempt = latestAttempts.get(0);
                    OffsetDateTime lastPracticeTime = latestAttempt.getCreatedAt();
                    OffsetDateTime now = OffsetDateTime.now();
                    
                    // Tính số giờ từ lần luyện tập cuối
                    long hoursSinceLastPractice = ChronoUnit.HOURS.between(lastPracticeTime, now);
                    
                    // Nếu > 24 giờ thì gửi thông báo
                    if (hoursSinceLastPractice >= 24) {
                        shouldSendReminder = true;
                        log.info("User {} hasn't practiced for {} hours", 
                                user.getEmail(), hoursSinceLastPractice);
                    }
                }
                
                if (shouldSendReminder && user.getFcmToken() != null && !user.getFcmToken().isEmpty()) {
                    sendReminderNotification(user);
                    remindersSent++;
                }
                
            } catch (Exception e) {
                log.error("Error checking user {}: {}", user.getEmail(), e.getMessage(), e);
            }
        }
        
        log.info("Yoga reminder scheduler completed. Sent {} reminders", remindersSent);
    }
    
    /**
     * Test method - chạy mỗi 5 phút (để test)
     * Comment lại khi deploy production
     */
    // @Scheduled(fixedRate = 300000) // 5 phút = 300000ms
    public void sendYogaReminderTest() {
        log.info("Running TEST yoga reminder...");
        sendYogaReminder();
    }
    
    private void sendReminderNotification(User user) {
        try {
            String title = "🧘 Đã lâu rồi bạn chưa tập yoga!";
            String body = String.format(
                    "Xin chào %s! Hãy dành vài phút để luyện tập yoga hôm nay nhé. " +
                    "Sức khỏe của bạn rất quan trọng! 💪",
                    user.getFirstName()
            );
            
            fcmService.sendNotification(user.getFcmToken(), title, body);
            log.info("Sent reminder to user: {}", user.getEmail());
            
        } catch (Exception e) {
            log.error("Failed to send notification to user {}: {}", 
                    user.getEmail(), e.getMessage(), e);
        }
    }
}
