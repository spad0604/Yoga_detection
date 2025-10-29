package com.yogadetection.dto.response;

import java.time.OffsetDateTime;
import java.util.List;

import com.yogadetection.enums.YogaPoseLevelEnum;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class YogaRoutineResponse {
    private String id;
    private String name;
    private String description;
    private YogaPoseLevelEnum level;
    private Integer durationMinutes;
    private Integer estimatedCalories;
    private String imageUrl;
    private List<String> tags;
    private Boolean isPremium;
    private Integer totalPoses;
    private List<RoutinePoseResponse> poses;
    private OffsetDateTime createdAt;
    private OffsetDateTime updatedAt;
    
    // User progress info (nếu có)
    private UserRoutineProgressInfo userProgress;
    
    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class UserRoutineProgressInfo {
        private Double completionPercentage;
        private Boolean isCompleted;
        private Integer currentPoseIndex;
        private OffsetDateTime lastPracticedAt;
        private Double averageScore;
    }
}

