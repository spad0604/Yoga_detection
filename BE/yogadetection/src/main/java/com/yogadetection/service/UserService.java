package com.yogadetection.service;

import com.yogadetection.dto.request.ChangeInformationRequest;
import com.yogadetection.dto.request.ChangePasswordRequest;
import com.yogadetection.dto.response.ApiResponse;

import java.util.Map;

public interface UserService {
    ApiResponse<Map<String, String>> getInformation(String token);
    void changeInformation(ChangeInformationRequest request);
    void deleteUser(String token);
}
