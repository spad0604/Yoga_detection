package com.yogadetection.dto.request;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.yogadetection.jackson.FlexibleOffsetDateTimeDeserializer;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.OffsetDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CreateBodyProgressRequest {
    // Basic measurements
    @JsonAlias("weight_kg")
    private Double weightKg;

    @JsonAlias("height_cm")
    private Double heightCm;
    
    // Body composition
    @JsonAlias("body_fat_percentage")
    private Double bodyFatPercentage;

    @JsonAlias("muscle_mass_kg")
    private Double muscleMassKg;

    @JsonAlias("body_water_percentage")
    private Double bodyWaterPercentage;
    
    // Body measurements (circumferences)
    @JsonAlias("chest_cm")
    private Double chestCm;

    @JsonAlias("waist_cm")
    private Double waistCm;

    @JsonAlias("hip_cm")
    private Double hipCm;

    @JsonAlias("arm_cm")
    private Double armCm;

    @JsonAlias("thigh_cm")
    private Double thighCm;
    
    // Additional info
    private String notes;

    @JsonAlias("photo_url")
    private String photoUrl;
    
    @JsonAlias("recorded_at")
    @JsonDeserialize(using = FlexibleOffsetDateTimeDeserializer.class)
    private OffsetDateTime recordedAt; // Optional, defaults to now
}

