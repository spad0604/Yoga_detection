package com.yogadetection.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TokenResponse {
    private String userId;
    private String accessToken;
    private String refreshToken;

    public TokenResponse(String accessToken) {
        this.userId = "";
        this.accessToken = accessToken;
        this.refreshToken = null;
    }
}
