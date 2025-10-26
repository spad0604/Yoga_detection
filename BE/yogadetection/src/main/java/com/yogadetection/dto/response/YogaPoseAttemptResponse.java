package com.yogadetection.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.OffsetDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class YogaPoseAttemptResponse {
    private String id;
    private String poseCode;
    private String poseName;
    private String imageUrl;
    private Double score;
    private String feedback;
    private OffsetDateTime createdAt;
}
