package com.yogadetection.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import java.time.OffsetDateTime;

@Data
@Table(name = "routine_pose")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class RoutinePose {
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "com.yogadetection.utils.UUIDv7Generator")
    private String id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "routine_id", nullable = false)
    private YogaRoutine routine;

    @Column(name = "pose_code", nullable = false)
    private String poseCode;

    @Column(name = "pose_name")
    private String poseName;

    @Column(name = "order_index", nullable = false)
    private Integer orderIndex;

    @Column(name = "duration_seconds")
    private Integer durationSeconds; // Thời gian giữ tư thế (seconds)

    @Column(name = "repetitions")
    private Integer repetitions; // Số lần lặp lại (nếu có)

    @Column(name = "rest_after_seconds")
    private Integer restAfterSeconds; // Thời gian nghỉ sau pose này

    @Column(name = "instructions", columnDefinition = "TEXT")
    private String instructions; // Hướng dẫn đặc biệt cho pose trong routine này

    @Column(name = "created_at", nullable = false, updatable = false)
    private OffsetDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = OffsetDateTime.now();
        if (repetitions == null) {
            repetitions = 1;
        }
        if (restAfterSeconds == null) {
            restAfterSeconds = 5;
        }
    }
}

