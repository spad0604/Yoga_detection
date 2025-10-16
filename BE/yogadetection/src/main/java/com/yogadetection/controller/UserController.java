package com.yogadetection.controller;

import com.yogadetection.dto.request.ChangeInformationRequest;
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

    @GetMapping("/me")
    public ApiResponse<Map<String, String>> getInformation(@RequestHeader("Authorization") String token) {
        return userService.getInformation(token);
    }

    @PostMapping("/change")
    public void changeInformation(@RequestBody ChangeInformationRequest request) {
        userService.changeInformation(request);
    }

    @DeleteMapping
    public void deleteUser(@RequestHeader("Authorization") String token) {
        userService.deleteUser(token);
    }
}
