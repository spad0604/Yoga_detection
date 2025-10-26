package com.yogadetection.service;

import com.yogadetection.dto.request.LoginRequest;
import com.yogadetection.dto.request.RefreshTokenRequest;
import com.yogadetection.dto.request.RegisterRequest;
import com.yogadetection.dto.response.TokenResponse;

public interface AuthService {
    TokenResponse login(LoginRequest request);

    TokenResponse register(RegisterRequest request);

    TokenResponse refreshToken(RefreshTokenRequest request);

    void logout(String token);
}
