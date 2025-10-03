package com.controller;

import com.dto.request.ChangePasswordRequest;
import com.dto.request.LoginRequest;
import com.dto.request.RegisterRequest;
import com.dto.response.TokenResponse;
import com.service.AuthService;
import com.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/user")
public class UserController {
    private final UserService userService;

    @PostMapping("/change-password")
    public void changePassword(@RequestBody ChangePasswordRequest request) {
        System.out.println("hehe");
        userService.changePassword(request);
    }

}
