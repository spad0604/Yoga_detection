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
public class UpdateYogaPoseRequest {
    private String name;
    private Integer totalMinutes;
    private Integer totalCalos;
    private String level; // BEGINNER, INTERMEDIATE, ADVANCED
    private String description;
    private MultipartFile image;
}
