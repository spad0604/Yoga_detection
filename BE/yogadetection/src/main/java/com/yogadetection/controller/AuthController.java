package com.yogadetection.controller;

import com.yogadetection.dto.request.GoogleLoginRequest;
import com.yogadetection.dto.request.LoginRequest;
import com.yogadetection.dto.request.RefreshTokenRequest;
import com.yogadetection.dto.request.RegisterRequest;
import com.yogadetection.dto.response.TokenResponse;
import com.yogadetection.service.AuthService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/auth")
@Tag(name = "Authentication", description = "API xác thực người dùng")
public class AuthController {
    
    private final AuthService authService;

    @Operation(summary = "Đăng nhập", description = "Đăng nhập bằng email và password, trả về JWT token")
    @PostMapping("/login")
    public TokenResponse login(@RequestBody LoginRequest request) {
        return authService.login(request);
    }

    @Operation(summary = "Đăng ký", description = "Đăng ký tài khoản mới")
    @PostMapping("/register")
    public TokenResponse register(@RequestBody RegisterRequest request) {
        return authService.register(request);
    }

    @Operation(summary = "Refresh token", description = "Làm mới JWT token bằng refresh token")
    @PostMapping("/refresh")
    public TokenResponse refreshToken(@RequestBody RefreshTokenRequest request) {
        return authService.refreshToken(request);
    }

    @Operation(summary = "Đăng xuất", description = "Đăng xuất và thêm token vào blacklist")
    @PostMapping("/logout")
    public void logout(@RequestBody Map<String, String> request) {
        authService.logout(request.get("token"));
    }

    @Operation(summary = "Đăng nhập với Google", description = "Xác thực người dùng qua Google ID Token và trả về JWT access/refresh token")
    @PostMapping("/google")
    public TokenResponse loginWithGoogle(@RequestBody GoogleLoginRequest request) {
        return authService.loginWithGoogle(request);
    }
    
}
