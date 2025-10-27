package com.yogadetection.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PoseStatisticsResponse {
    private String poseCode;
    private String poseName;
    private Long totalAttempts;
    private Double averageScore;
    private Double highestScore;
}
