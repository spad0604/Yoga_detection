package com.yogadetection.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import java.time.OffsetDateTime;

@Data
@Table(name = "yoga_pose_attempt")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class YogaPoseAttempt {
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "com.yogadetection.utils.UUIDv7Generator")
    private String id;

    @Column(name = "user_id", nullable = false)
    private String userId;

    @Column(name = "pose_code", nullable = false)
    private String poseCode;

    @Column(name = "pose_name")
    private String poseName;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "score")
    private Double score;

    @Column(name = "landmarks_data", columnDefinition = "TEXT")
    private String landmarksData;

    @Column(name = "feedback", columnDefinition = "TEXT")
    private String feedback;

    @Column(name = "created_at", nullable = false, updatable = false)
    private OffsetDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = OffsetDateTime.now();
    }
}
