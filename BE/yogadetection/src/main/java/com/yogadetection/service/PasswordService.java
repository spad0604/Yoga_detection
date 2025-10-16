package com.yogadetection.service;

import com.yogadetection.dto.request.ChangePasswordRequest;
import com.yogadetection.dto.request.ResetPasswordRequest;
import com.yogadetection.dto.request.SendOTPRequest;
import com.yogadetection.dto.request.VerifyOTPRequest;
import com.yogadetection.dto.response.ApiResponse;

import java.util.Map;

public interface PasswordService {
    void changePassword(String token, ChangePasswordRequest request);
    void sendOTP(SendOTPRequest request);
    void verifyOTP(VerifyOTPRequest request);
    void resetPassword(String token, ResetPasswordRequest request);
}
