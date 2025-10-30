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
public class CommentResponse {
    private String id;
    private String postId;
    private String userId;
    private String username;
    private String content;
    private OffsetDateTime createdAt;
}


