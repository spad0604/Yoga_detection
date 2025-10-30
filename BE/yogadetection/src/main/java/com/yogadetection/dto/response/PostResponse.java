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
public class PostResponse {
    private String id;
    private String groupId;
    private String authorId;
    private String authorName;
    private String content;
    private String imageUrls;
    private Integer likeCount;
    private Integer commentCount;
    private Boolean likedByMe;
    private OffsetDateTime createdAt;
}


