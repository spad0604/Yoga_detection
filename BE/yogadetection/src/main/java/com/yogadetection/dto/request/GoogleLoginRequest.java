package com.yogadetection.dto.request;

import lombok.Data;

@Data
public class GoogleLoginRequest {
    private String idToken;
    private String fcmToken;
}
