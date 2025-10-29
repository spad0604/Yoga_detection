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
public class FriendResponse {
    private String friendshipId;
    private String userId;
    private String username;
    private String email;
    private String avatarUrl;
    private String status; // PENDING, ACCEPTED, etc
    private OffsetDateTime friendsSince;
    
    // Stats
    private Long totalPosesCompleted;
    private Long totalRoutinesCompleted;
    private Double averageScore;
    private Integer currentStreak;
}

