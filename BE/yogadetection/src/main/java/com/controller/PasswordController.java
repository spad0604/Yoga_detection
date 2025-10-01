package com.controller;

import com.dto.request.ChangePasswordRequest;
import com.dto.request.ResetPasswordRequest;
import com.dto.response.ApiResponse;
import com.service.AuthService;
import com.service.PasswordService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/password")
public class PasswordController {
    private final PasswordService passwordService;

    @PostMapping("/change")
    public ApiResponse<String> changePassword(@RequestBody ChangePasswordRequest request) {
        return passwordService.changePassword(request);
    }

    @PostMapping("/reset")
    public ApiResponse<String> resetPassword(@RequestBody ResetPasswordRequest request) {
        return passwordService.resetPassword(request);
    }
}
