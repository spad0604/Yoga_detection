package com.yogadetection.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SubmitPoseInSessionRequest {
    private String sessionId;
    private String poseCode;
    private Integer timeSpentSeconds;
    
    // Landmarks data for AI evaluation
    private PoseLandmarkRequest landmarkData;
}
