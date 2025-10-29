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
@Table(name = "body_progress")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class BodyProgress {
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "com.yogadetection.utils.UUIDv7Generator")
    private String id;

    @Column(name = "user_id", nullable = false)
    private String userId;

    // Basic measurements
    @Column(name = "weight_kg")
    private Double weightKg; // Weight in kilograms

    @Column(name = "height_cm")
    private Double heightCm; // Height in centimeters

    @Column(name = "bmi")
    private Double bmi; // Body Mass Index (calculated)

    // Body composition
    @Column(name = "body_fat_percentage")
    private Double bodyFatPercentage; // Body fat percentage

    @Column(name = "muscle_mass_kg")
    private Double muscleMassKg; // Muscle mass in kilograms

    @Column(name = "body_water_percentage")
    private Double bodyWaterPercentage; // Body water percentage

    // Body measurements (circumferences)
    @Column(name = "chest_cm")
    private Double chestCm; // Chest circumference

    @Column(name = "waist_cm")
    private Double waistCm; // Waist circumference

    @Column(name = "hip_cm")
    private Double hipCm; // Hip circumference

    @Column(name = "arm_cm")
    private Double armCm; // Arm circumference

    @Column(name = "thigh_cm")
    private Double thighCm; // Thigh circumference

    // Additional info
    @Column(name = "notes", columnDefinition = "TEXT")
    private String notes; // Optional notes

    @Column(name = "photo_url")
    private String photoUrl; // Optional photo URL

    @Column(name = "recorded_at", nullable = false)
    private OffsetDateTime recordedAt; // When the measurement was taken

    @Column(name = "created_at", nullable = false, updatable = false)
    private OffsetDateTime createdAt;

    @Column(name = "updated_at")
    private OffsetDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = OffsetDateTime.now();
        updatedAt = OffsetDateTime.now();
        if (recordedAt == null) {
            recordedAt = OffsetDateTime.now();
        }
        // Calculate BMI if weight and height are provided
        if (weightKg != null && heightCm != null && heightCm > 0) {
            double heightM = heightCm / 100.0;
            bmi = weightKg / (heightM * heightM);
        }
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = OffsetDateTime.now();
        // Recalculate BMI if weight or height changed
        if (weightKg != null && heightCm != null && heightCm > 0) {
            double heightM = heightCm / 100.0;
            bmi = weightKg / (heightM * heightM);
        }
    }
}

