package com.service;

import com.dto.request.ChangePasswordRequest;
import com.dto.request.ResetPasswordRequest;
import com.dto.response.ApiResponse;

public interface PasswordService {
    ApiResponse<String> changePassword(ChangePasswordRequest request);
    ApiResponse<String> resetPassword(ResetPasswordRequest request);
}
