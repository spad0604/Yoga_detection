package com.yogadetection.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CreateGroupRequest {
    private String name;
    private String description;
    private String imageUrl;
    private Boolean isPrivate;
}

