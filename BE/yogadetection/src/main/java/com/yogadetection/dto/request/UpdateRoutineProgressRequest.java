package com.yogadetection.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UpdateRoutineProgressRequest {
    private String routineId;
    private String completedPoseCode;
    private Double poseScore;
    private Integer timeSpentSeconds;
}

