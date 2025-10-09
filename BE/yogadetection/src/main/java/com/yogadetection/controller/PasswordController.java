package com.yogadetection.controller;

import com.yogadetection.dto.request.ChangePasswordRequest;
import com.yogadetection.dto.request.ResetPasswordRequest;
import com.yogadetection.dto.request.SendOTPRequest;
import com.yogadetection.dto.request.VerifyOTPRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.service.PasswordService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/password")
public class PasswordController {
    private final PasswordService passwordService;

    @PostMapping("/change")
    public ApiResponse<String> changePassword(@RequestHeader("Authorization") String token, @RequestBody ChangePasswordRequest request) {
        return passwordService.changePassword(token, request);
    }

    @PostMapping("/send-otp")
    public ApiResponse<String> sendOTP(@RequestBody SendOTPRequest request) {
        return passwordService.sendOTP(request);
    }

    @PostMapping("/verify-otp")
    public ApiResponse<Map<String, String>> verifyOTP(@RequestBody VerifyOTPRequest request) {
        return passwordService.verifyOTP(request);
    }

    @PostMapping("/reset")
    public ApiResponse<String> resetPassword(@RequestHeader("Authorization") String token, @RequestBody ResetPasswordRequest request) {
        return  passwordService.resetPassword(token, request);
    }
}
