package com.yogadetection.dto.request;

import lombok.Data;
import lombok.Getter;

@Data
@Getter
public class LoginRequest {
    private String email;
    private String password;
    private String fcmToken;
}
