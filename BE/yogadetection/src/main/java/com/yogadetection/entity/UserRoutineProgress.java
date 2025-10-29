package com.yogadetection.entity;

import java.time.OffsetDateTime;

import org.hibernate.annotations.GenericGenerator;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Table(name = "user_routine_progress")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class UserRoutineProgress {
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "com.yogadetection.utils.UUIDv7Generator")
    private String id;

    @Column(name = "user_id", nullable = false)
    private String userId;

    @Column(name = "routine_id", nullable = false)
    private String routineId;

    @Column(name = "completed_poses", columnDefinition = "TEXT")
    private String completedPoses; // JSON array of pose codes: ["pose1", "pose2"]

    @Column(name = "total_poses")
    private Integer totalPoses;

    @Column(name = "current_pose_index")
    private Integer currentPoseIndex;

    @Column(name = "is_completed")
    private Boolean isCompleted;

    @Column(name = "completion_percentage")
    private Double completionPercentage;

    @Column(name = "total_time_spent_seconds")
    private Integer totalTimeSpentSeconds;

    @Column(name = "average_score")
    private Double averageScore;

    @Column(name = "last_practiced_at")
    private OffsetDateTime lastPracticedAt;

    @Column(name = "completed_at")
    private OffsetDateTime completedAt;

    @Column(name = "created_at", nullable = false, updatable = false)
    private OffsetDateTime createdAt;

    @Column(name = "updated_at")
    private OffsetDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = OffsetDateTime.now();
        updatedAt = OffsetDateTime.now();
        if (isCompleted == null) {
            isCompleted = false;
        }
        if (currentPoseIndex == null) {
            currentPoseIndex = 0;
        }
        if (completionPercentage == null) {
            completionPercentage = 0.0;
        }
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = OffsetDateTime.now();
    }
}

