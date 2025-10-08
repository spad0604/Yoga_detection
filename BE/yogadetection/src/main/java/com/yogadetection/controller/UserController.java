package com.yogadetection.controller;

import com.yogadetection.dto.request.ChangeInformationRequest;
import com.yogadetection.dto.request.ChangePasswordRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/user")
public class UserController {
    private final UserService userService;

    @PostMapping("/change-password")
    public void changePassword(@RequestBody ChangePasswordRequest request) {
        userService.changePassword(request);
    }

    @GetMapping("/me")
    public ApiResponse<Map<String, String>> getInformation(@RequestParam String id) {
        return userService.getInformation(id);
    }

    @PostMapping("/change")
    public ApiResponse<String> changeInformation(@RequestBody ChangeInformationRequest request) {
        return userService.changeInformation(request);
    }

    @DeleteMapping
    public ApiResponse<String> deleteUser(@RequestParam String id) {
        return userService.deleteUser(id);
    }

    @PostMapping("/update-password")
    public void updatePassword(@RequestBody ChangePasswordRequest request) {
        userService.changePassword(request);
    }
}
