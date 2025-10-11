package com.yogadetection.controller;

import com.yogadetection.dto.request.ChangeInformationRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.dto.response.UserInfoResponse;
import com.yogadetection.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/user")
public class UserController {
    private final UserService userService;

    @GetMapping("/me")
    public UserInfoResponse getInformation(@RequestHeader("Authorization") String token) {
        return userService.getInformation(token);
    }

    @PostMapping("/change")
    public ApiResponse<String> changeInformation(@RequestBody ChangeInformationRequest request) {
        return userService.changeInformation(request);
    }

    @DeleteMapping
    public ApiResponse<String> deleteUser(@RequestHeader("Authorization") String token) {
        return userService.deleteUser(token);
    }
}
