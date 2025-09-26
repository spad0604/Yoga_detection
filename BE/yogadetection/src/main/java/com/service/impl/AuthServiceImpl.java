package com.service.impl;

import com.config.ErrorCode;
import com.dto.request.LoginRequest;
import com.dto.request.RegisterRequest;
import com.dto.response.ApiResponse;
import com.dto.response.TokenResponse;
import com.entity.User;
import com.repository.UserRepository;
import com.service.AuthService;
import com.service.JwtService;
import com.service.TokenBlackListService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@Component("authService")
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {
    private final UserRepository userRepository;
    private final JwtService jwtService;
    private final PasswordEncoder passwordEncoder;
    private final TokenBlackListService tokenBlackListService;

    public ApiResponse login(LoginRequest request) {
        ApiResponse apiResponse = new ApiResponse();
        User user = userRepository.findByEmail(request.getEmail().toLowerCase()).orElse(null);
        if (user == null) {
            apiResponse.setError(ErrorCode.USER_NOT_FOUND);
            return apiResponse;
        }
        if (passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            apiResponse.setError(ErrorCode.SUCCESS);
            apiResponse.setData(new TokenResponse(jwtService.generateToken(user)));
            return apiResponse;
        }
        apiResponse.setError(ErrorCode.INVALID_PASSWORD);
        return apiResponse;
    }

    public ApiResponse register(RegisterRequest request) {
        ApiResponse apiResponse = new ApiResponse();
        if (userRepository.existsByEmail(request.getEmail().toLowerCase())) {
            apiResponse.setError(ErrorCode.EMAIL_ALREADY_EXISTS);
            return apiResponse;
        }
        User user = User.builder()
                .firstName(request.getFirstName())
                .lastName(request.getLastName())
                .birthDate(request.getBirthDate())
                .registerDate(LocalDateTime.now())
                .email(request.getEmail().toLowerCase())
                .password(passwordEncoder.encode(request.getPassword()))
                .build();
        userRepository.save(user);
        apiResponse.setError(ErrorCode.SUCCESS);
        apiResponse.setData(new TokenResponse(jwtService.generateToken(user)));
        return apiResponse;
    }

    public ApiResponse logout(String token) {
        ApiResponse apiResponse = new ApiResponse();
        if (token == null) {
            apiResponse.setError(ErrorCode.INVALID_TOKEN);
            return apiResponse;
        }
        tokenBlackListService.blacklistToken(token);
        apiResponse.setError(ErrorCode.SUCCESS);
        return apiResponse;
    }
}
