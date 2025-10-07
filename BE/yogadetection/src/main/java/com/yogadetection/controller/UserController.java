package com.yogadetection.controller;

import com.yogadetection.dto.request.ChangePasswordRequest;
import com.yogadetection.service.UserService;
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
        userService.changePassword(request);
    }

}
