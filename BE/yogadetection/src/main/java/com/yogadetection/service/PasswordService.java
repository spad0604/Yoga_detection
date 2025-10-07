package com.yogadetection.service;

import com.yogadetection.dto.request.ChangePasswordRequest;
import com.yogadetection.dto.request.ResetPasswordRequest;
import com.yogadetection.dto.request.VerifyOTPRequest;
import com.yogadetection.dto.response.ApiResponse;

public interface PasswordService {
    ApiResponse<String> changePassword(ChangePasswordRequest request);
    ApiResponse<String> sendOTP(ResetPasswordRequest request);
    ApiResponse<String> verifyOTP(VerifyOTPRequest request);
}
