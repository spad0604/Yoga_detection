package com.yogadetection.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity(name = "notifications")
@Table(name = "notifications")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Notification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private boolean isAll;

    private String userId;

    private String normalTitle;

    private String htmlTitle;
    
    @Column(columnDefinition = "TEXT")
    private String normalBody;
    
    @Column(columnDefinition = "TEXT")
    private String htmlBody;

    private String imageUrl;
    
    // Type: POSE_RESULT, SOCIAL, SYSTEM, ROUTINE_REMINDER, etc.
    private String type;
    
    // Reference ID (attemptId, postId, routineId, etc.)
    private String referenceId;
    
    @Builder.Default
    private boolean isRead = false;

    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
    }
}

