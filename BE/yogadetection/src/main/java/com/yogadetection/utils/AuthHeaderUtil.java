package com.yogadetection.utils;

import org.springframework.stereotype.Component;

import com.yogadetection.service.JwtService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class AuthHeaderUtil {

    private final JwtService jwtService;

    public String extractUserId(String authHeader) {
        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            String token = authHeader.substring(7);
            return jwtService.extractUserId(token);
        }
        throw new IllegalArgumentException("Invalid authorization header");
    }
}


