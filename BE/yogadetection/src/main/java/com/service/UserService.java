package com.service;

import com.dto.request.ChangeInformationRequest;
import com.dto.request.ChangePasswordRequest;
import com.dto.response.ApiResponse;

import java.util.Map;

public interface UserService {
    void changePassword(ChangePasswordRequest request);
    ApiResponse <Map<String, String>> getInformation(String id);
    ApiResponse <String> changeInformation(ChangeInformationRequest request);
    ApiResponse <String> deleteUser(String id);
}
