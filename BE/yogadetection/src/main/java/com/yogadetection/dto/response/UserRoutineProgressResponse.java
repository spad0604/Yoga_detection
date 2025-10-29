package com.yogadetection.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.OffsetDateTime;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserRoutineProgressResponse {
    private String id;
    private String userId;
    private String routineId;
    private String routineName;
    private String routineImageUrl;
    private List<String> completedPoses;
    private Integer totalPoses;
    private Integer currentPoseIndex;
    private Boolean isCompleted;
    private Double completionPercentage;
    private Integer totalTimeSpentSeconds;
    private Double averageScore;
    private OffsetDateTime lastPracticedAt;
    private OffsetDateTime completedAt;
    private OffsetDateTime createdAt;
}

