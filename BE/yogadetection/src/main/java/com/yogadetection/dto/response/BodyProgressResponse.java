package com.yogadetection.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.OffsetDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BodyProgressResponse {
    private String id;
    private String userId;
    
    // Basic measurements
    private Double weightKg;
    private Double heightCm;
    private Double bmi;
    
    // Body composition
    private Double bodyFatPercentage;
    private Double muscleMassKg;
    private Double bodyWaterPercentage;
    
    // Body measurements (circumferences)
    private Double chestCm;
    private Double waistCm;
    private Double hipCm;
    private Double armCm;
    private Double thighCm;
    
    // Additional info
    private String notes;
    private String photoUrl;
    
    private OffsetDateTime recordedAt;
    private OffsetDateTime createdAt;
    private OffsetDateTime updatedAt;
}

