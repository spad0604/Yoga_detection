package com.yogadetection.dto.request;

import lombok.*;

import java.util.List;

@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PoseLandmarkRequest {
    private Long poseId;
    private List<Landmark> landmarks;
    private long timestamp;
}
