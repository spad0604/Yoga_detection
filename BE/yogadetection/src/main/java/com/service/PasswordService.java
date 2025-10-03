package com.service;

import com.dto.request.ChangePasswordRequest;
import com.dto.request.ResetPasswordRequest;
import com.dto.request.VerifyOTPRequest;
import com.dto.response.ApiResponse;

public interface PasswordService {
    ApiResponse<String> changePassword(ChangePasswordRequest request);
    ApiResponse<String> sendOTP(ResetPasswordRequest request);
    ApiResponse<String> verifyOTP(VerifyOTPRequest request);
}
