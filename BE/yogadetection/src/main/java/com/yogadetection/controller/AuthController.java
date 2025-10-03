package com.yogadetection.controller;

import com.yogadetection.config.ErrorCode;
import com.yogadetection.config.ErrorConfig;
import com.yogadetection.dto.request.LoginRequest;
import com.yogadetection.dto.request.RegisterRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.web.webauthn.api.AuthenticatorResponse;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping
public class AuthController {
    private final AuthService authService;
    private final ErrorCode errorCode;

    @PostMapping("/login")
    public ApiResponse login(@RequestBody LoginRequest request) {
        ApiResponse response = new ApiResponse();
        try {
            Map<String, Object> data;
            data.put("token", authService.login(request));
            response.setError(errorCode.SUCCESS);
            response.setData(data);
        }
        catch (Exception e) {
            response.setError(errorCode.INTERNAL_SERVER_ERROR);
        }
        return response;
    }

    @PostMapping("register")
    public ApiResponse register(@RequestBody RegisterRequest request) {
        return authService.register(request);
    }
}
