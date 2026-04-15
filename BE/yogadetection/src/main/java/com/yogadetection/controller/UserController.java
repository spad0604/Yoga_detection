package com.yogadetection.controller;

import com.yogadetection.dto.request.ChangeInformationRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.dto.response.UserInfoResponse;
import com.yogadetection.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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

    @PutMapping(value = "/profile", consumes = {"multipart/form-data"})
    public UserInfoResponse updateProfile(
            @RequestHeader("Authorization") String token,
            @RequestPart(value = "firstName", required = false) String firstName,
            @RequestPart(value = "lastName", required = false) String lastName,
            @RequestPart(value = "dob", required = false) String dob,
            @RequestPart(value = "phone", required = false) String phone,
            @RequestPart(value = "avatar", required = false) MultipartFile avatar
    ) {
        return userService.updateProfile(token, firstName, lastName, dob, phone, avatar);
    }
}
