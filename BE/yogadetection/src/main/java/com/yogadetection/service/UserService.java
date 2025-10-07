package com.yogadetection.service;

import com.yogadetection.dto.request.ChangePasswordRequest;

public interface UserService {
    void changePassword(ChangePasswordRequest request);
}
