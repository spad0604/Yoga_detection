package com.yogadetection.dto.response;

import java.time.OffsetDateTime;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserActivityResponse {
    private String id;
    private String userId;
    private String username;
    private String userAvatarUrl;
    private String activityType;
    private String title;
    private String description;
    private Map<String, Object> metadata;
    private OffsetDateTime createdAt;
}

