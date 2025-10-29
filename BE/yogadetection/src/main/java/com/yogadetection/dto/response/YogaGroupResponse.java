package com.yogadetection.dto.response;

import java.time.OffsetDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class YogaGroupResponse {
    private String id;
    private String name;
    private String description;
    private String imageUrl;
    private String ownerId;
    private String ownerName;
    private Integer memberCount;
    private Boolean isPrivate;
    private Boolean isMember; // User đã join chưa
    private String userRole; // OWNER, ADMIN, MEMBER
    private OffsetDateTime createdAt;
    private OffsetDateTime updatedAt;
}

