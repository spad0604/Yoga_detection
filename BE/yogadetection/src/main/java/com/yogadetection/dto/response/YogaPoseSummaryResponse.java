package com.yogadetection.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class YogaPoseSummaryResponse {
    private String id;     
    private String name;
    private String description;
    private String imageUrl;
    private int minutes;      
    private int calos;
    private String level;
    private String tutorialVideoUrl;
}
