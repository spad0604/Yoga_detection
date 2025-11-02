package com.yogadetection.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CreateYogaRoutineRequest {
    private String name;
    private String description;
    private String level; // BEGINNER, INTERMEDIATE, ADVANCED
    private Integer durationMinutes;
    private Integer estimatedCalories;
    private String tags; // JSON array string: ["morning", "flexibility"]
    private Boolean isPremium;
    private Integer orderIndex;
    private String poseIds; // Comma-separated pose IDs: "pose1,pose2,pose3"
    private MultipartFile image;
}
