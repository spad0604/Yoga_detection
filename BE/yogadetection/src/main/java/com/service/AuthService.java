package com.service;

import com.dto.request.ChangePasswordRequest;
import com.dto.request.LoginRequest;
import com.dto.request.RegisterRequest;
import com.dto.response.ApiResponse;
import com.dto.response.TokenResponse;

public interface AuthService {
    TokenResponse login(LoginRequest request);

    TokenResponse register(RegisterRequest request);

    void logout(String token);
}
