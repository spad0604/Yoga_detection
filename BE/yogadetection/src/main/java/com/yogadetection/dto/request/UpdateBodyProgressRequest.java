package com.yogadetection.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.OffsetDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UpdateBodyProgressRequest {
    // Basic measurements
    private Double weightKg;
    private Double heightCm;
    
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
}

