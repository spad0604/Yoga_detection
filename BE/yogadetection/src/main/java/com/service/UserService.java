package com.service;

import com.dto.request.ChangePasswordRequest;

public interface UserService {
    void changePassword(ChangePasswordRequest request);
}
