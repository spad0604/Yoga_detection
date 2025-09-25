package com.service;

import com.dto.request.LoginRequest;
import com.dto.request.RegisterRequest;

public interface AuthService {
    String login(LoginRequest request);

    String register(RegisterRequest request);
}
