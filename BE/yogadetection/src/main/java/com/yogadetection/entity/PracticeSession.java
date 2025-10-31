package com.yogadetection.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import java.time.OffsetDateTime;

@Data
@Table(name = "practice_session")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class PracticeSession {
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "com.yogadetection.utils.UUIDv7Generator")
    private String id;

    @Column(name = "user_id", nullable = false)
    private String userId;

    @Column(name = "routine_id", nullable = false)
    private String routineId;

    @Column(name = "status", nullable = false)
    @Enumerated(EnumType.STRING)
    private SessionStatus status;

    @Column(name = "current_pose_index")
    private Integer currentPoseIndex;

    @Column(name = "total_poses")
    private Integer totalPoses;

    // JSON array of completed pose codes
    @Column(name = "completed_poses", columnDefinition = "TEXT")
    private String completedPoses;

    // JSON array of submission results
    @Column(name = "submissions", columnDefinition = "TEXT")
    private String submissions;

    @Column(name = "average_score")
    private Double averageScore;

    @Column(name = "total_time_spent_seconds")
    private Integer totalTimeSpentSeconds;

    @Column(name = "started_at", nullable = false)
    private OffsetDateTime startedAt;

    @Column(name = "completed_at")
    private OffsetDateTime completedAt;

    @Column(name = "created_at", nullable = false, updatable = false)
    private OffsetDateTime createdAt;

    @Column(name = "updated_at")
    private OffsetDateTime updatedAt;

    public enum SessionStatus {
        IN_PROGRESS,
        COMPLETED,
        ABANDONED
    }

    @PrePersist
    protected void onCreate() {
        createdAt = OffsetDateTime.now();
        updatedAt = OffsetDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = OffsetDateTime.now();
    }
}
