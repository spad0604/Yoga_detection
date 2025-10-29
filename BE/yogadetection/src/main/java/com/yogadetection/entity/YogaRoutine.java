package com.yogadetection.entity;

import com.yogadetection.enums.YogaPoseLevelEnum;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import java.time.OffsetDateTime;
import java.util.List;

@Data
@Table(name = "yoga_routine")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class YogaRoutine {
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "com.yogadetection.utils.UUIDv7Generator")
    private String id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(name = "level")
    private YogaPoseLevelEnum level;

    @Column(name = "duration_minutes")
    private Integer durationMinutes;

    @Column(name = "estimated_calories")
    private Integer estimatedCalories;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "tags")
    private String tags; // JSON array: ["morning", "flexibility", "strength"]

    @Column(name = "is_premium")
    private Boolean isPremium;

    @Column(name = "order_index")
    private Integer orderIndex;

    @Column(name = "created_at", nullable = false, updatable = false)
    private OffsetDateTime createdAt;

    @Column(name = "updated_at")
    private OffsetDateTime updatedAt;

    @OneToMany(mappedBy = "routine", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<RoutinePose> poses;

    @PrePersist
    protected void onCreate() {
        createdAt = OffsetDateTime.now();
        updatedAt = OffsetDateTime.now();
        if (isPremium == null) {
            isPremium = false;
        }
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = OffsetDateTime.now();
    }
}

