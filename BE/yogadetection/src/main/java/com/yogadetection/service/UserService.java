package com.yogadetection.service;

import com.yogadetection.dto.request.ChangeInformationRequest;
import com.yogadetection.dto.request.ChangePasswordRequest;
import com.yogadetection.dto.response.ApiResponse;

import java.util.Map;

public interface UserService {
    void changePassword(ChangePasswordRequest request);
    ApiResponse<Map<String, String>> getInformation(String token);
    ApiResponse <String> changeInformation(ChangeInformationRequest request);
    ApiResponse <String> deleteUser(String token);
}
