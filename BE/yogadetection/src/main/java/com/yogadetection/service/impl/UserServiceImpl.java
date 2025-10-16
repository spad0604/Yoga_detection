package com.yogadetection.service.impl;

import com.yogadetection.dto.request.ChangeInformationRequest;
import com.yogadetection.dto.request.ChangePasswordRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.dto.response.UserInfoResponse;
import com.yogadetection.entity.User;
import com.yogadetection.exception.InvalidPasswordException;
import com.yogadetection.exception.UserNotFoundException;
import com.yogadetection.repository.UserRepository;
import com.yogadetection.service.JwtService;
import com.yogadetection.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;


@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    private final JwtService jwtService;
    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;

    @Override
    public UserInfoResponse getInformation(String token) {
        String email = jwtService.extractUsername(token);
        User user = userRepository.findByEmail(email.toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        return UserInfoResponse.builder()
                .id(user.getId())
                .email(user.getEmail())
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .dob(user.getBirthDate().toString())
                .registerDate(user.getRegisterDate().toString())
                .build();
    }

    @Override
    public void changeInformation(ChangeInformationRequest request) {
        User user = userRepository.findByEmail(request.getEmail().toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        if (request.getDob() != null) {
            user.setBirthDate(request.getDob());
        }
        if (request.getFirstName() != null) {
            user.setFirstName(request.getFirstName());
        }
        if (request.getLastName() != null) {
            user.setLastName(request.getLastName());
        }
        userRepository.save(user);
    }

    public void deleteUser(String token) {
        String email = jwtService.extractUsername(token);
        User user = userRepository.findByEmail(email.toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        userRepository.delete(user);
    }

    @Override
    public String getUserId(String token) {
        String email = jwtService.extractUsername(token);
        User user = userRepository.findByEmail(email.toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        return user.getId();
    }
}
