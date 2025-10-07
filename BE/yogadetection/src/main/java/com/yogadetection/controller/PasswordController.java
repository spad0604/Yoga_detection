package com.yogadetection.controller;

import com.yogadetection.dto.request.ChangePasswordRequest;
import com.yogadetection.dto.request.ResetPasswordRequest;
import com.yogadetection.dto.request.VerifyOTPRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.service.PasswordService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/password")
public class PasswordController {
    private final PasswordService passwordService;

    @PostMapping("/change")
    public ApiResponse<String> changePassword(@RequestBody ChangePasswordRequest request) {
        return passwordService.changePassword(request);
    }

    @PostMapping("/send-otp")
    public ApiResponse<String> sendOTP(@RequestBody ResetPasswordRequest request) {
        return passwordService.sendOTP(request);
    }

    @PostMapping("/verify-otp")
    public ApiResponse<String> verifyOTP(@RequestBody VerifyOTPRequest request) {
        return passwordService.verifyOTP(request);
    }

    @PostMapping("/update-password")
    public ApiResponse<String> updatePassword(@RequestBody ChangePasswordRequest request) {
        return passwordService.changePassword(request);
    }
}
