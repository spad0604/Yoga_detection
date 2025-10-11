package com.yogadetection.service;

import com.yogadetection.dto.request.ChangeInformationRequest;
import com.yogadetection.dto.request.ChangePasswordRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.dto.response.UserInfoResponse;
import com.yogadetection.entity.User;

import java.util.Map;

public interface UserService {
    UserInfoResponse getInformation(String token);
    ApiResponse <String> changeInformation(ChangeInformationRequest request);
    ApiResponse <String> deleteUser(String token);
    String getUserId(String token);
}
