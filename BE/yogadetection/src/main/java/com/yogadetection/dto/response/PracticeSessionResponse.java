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
public class PracticeSessionResponse {
    private String sessionId;
    private String routineId;
    private String routineName;
    private String userId;
    
    // Session metadata
    private SessionStatus status;
    private Integer currentPoseIndex;
    private Integer totalPoses;
    
    // Current pose info
    private String currentPoseCode;
    private String currentPoseName;
    private String currentPoseDescription;
    private String currentPoseImageUrl;
    private Integer currentPoseDurationSeconds;
    
    // All poses in routine
    private List<RoutinePoseInfo> allPoses;
    
    // Session results
    private List<PoseSubmissionResult> completedPoses;
    private Double averageScore;
    private Integer totalTimeSpentSeconds;
    
    private OffsetDateTime startedAt;
    private OffsetDateTime completedAt;
    
    public enum SessionStatus {
        IN_PROGRESS,
        COMPLETED,
        ABANDONED
    }
    
    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class RoutinePoseInfo {
        private String poseCode;
        private String poseName;
        private Integer orderIndex;
        private Integer durationSeconds;
        private String imageUrl;
        private Boolean isCompleted;
    }
    
    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class PoseSubmissionResult {
        private String poseCode;
        private String poseName;
        private String imageUrl;
        private Double score;
        private String feedback;
        private Integer timeSpentSeconds;
        private OffsetDateTime submittedAt;
    }
}
