package com.yogadetection.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PoseLandmarkRequest {
    private Long poseId;
    private List<Landmark> landmarks;
}
