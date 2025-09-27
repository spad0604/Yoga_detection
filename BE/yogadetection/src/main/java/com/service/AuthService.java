package com.service;

import com.dto.request.LoginRequest;
import com.dto.request.RegisterRequest;
import com.dto.response.ApiResponse;
import com.dto.response.TokenResponse;

public interface AuthService {
    ApiResponse login(LoginRequest request);

    ApiResponse register(RegisterRequest request);

    ApiResponse logout(String token);
}
