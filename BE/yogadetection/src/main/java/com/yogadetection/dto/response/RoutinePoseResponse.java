package com.yogadetection.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RoutinePoseResponse {
    private String id;
    private String poseCode;
    private String poseName;
    private Integer orderIndex;
    private Integer durationSeconds;
    private Integer repetitions;
    private Integer restAfterSeconds;
    private String instructions;
    
    // Additional pose details
    private String poseImageUrl;
    private String poseDescription;
}

