package com.yogadetection.controller;

import com.yogadetection.dto.request.LoginRequest;
import com.yogadetection.dto.request.RegisterRequest;
import com.yogadetection.dto.response.TokenResponse;
import com.yogadetection.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/auth")
public class AuthController {
    private final AuthService authService;

    @PostMapping("/login")
    public TokenResponse login(@RequestBody LoginRequest request) {
        return authService.login(request);
    }

    @PostMapping("/register")
    public TokenResponse register(@RequestBody RegisterRequest request) {
        return authService.register(request);
    }

    @PostMapping("/logout")
    public void logout(@RequestBody Map<String, String> request) {
        authService.logout(request.get("token"));
    }
}
