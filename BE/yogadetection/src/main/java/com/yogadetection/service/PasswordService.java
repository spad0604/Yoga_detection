package com.yogadetection.service;

import com.yogadetection.dto.request.ChangePasswordRequest;
import com.yogadetection.dto.request.ResetPasswordRequest;
import com.yogadetection.dto.request.SendOTPRequest;
import com.yogadetection.dto.request.VerifyOTPRequest;
import com.yogadetection.dto.response.ApiResponse;

import java.util.Map;

public interface PasswordService {
    ApiResponse<String> changePassword(String token, ChangePasswordRequest request);
    ApiResponse<String> sendOTP(SendOTPRequest request);
    ApiResponse<Map<String, String>> verifyOTP(VerifyOTPRequest request);
    ApiResponse<String> resetPassword(String token, ResetPasswordRequest request);
}
