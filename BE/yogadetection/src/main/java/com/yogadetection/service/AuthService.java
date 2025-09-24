package com.yogadetection.service;

import com.yogadetection.dto.request.LoginRequest;
import com.yogadetection.dto.request.RegisterRequest;
import com.yogadetection.dto.response.ApiResponse;

public interface AuthService {
    String login(LoginRequest request);
    String register(RegisterRequest request);
}
