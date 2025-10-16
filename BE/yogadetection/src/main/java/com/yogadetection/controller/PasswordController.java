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
    public void changePassword(@RequestHeader("Authorization") String token, @RequestBody ChangePasswordRequest request) {
        passwordService.changePassword(token, request);
    }

    @PostMapping("/send-otp")
    public void sendOTP(@RequestBody SendOTPRequest request) {
        passwordService.sendOTP(request);
    }

    @PostMapping("/verify-otp")
    public void verifyOTP(@RequestBody VerifyOTPRequest request) {
        passwordService.verifyOTP(request);
    }

    @PostMapping("/reset")
    public void resetPassword(@RequestHeader("Authorization") String token, @RequestBody ResetPasswordRequest request) {
        passwordService.resetPassword(token, request);
    }
}
