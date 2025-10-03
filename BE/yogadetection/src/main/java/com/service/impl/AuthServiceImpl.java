package com.service.impl;

import com.config.ErrorCode;
import com.dto.request.ChangePasswordRequest;
import com.dto.request.LoginRequest;
import com.dto.request.RegisterRequest;
import com.dto.response.ApiResponse;
import com.dto.response.TokenResponse;
import com.entity.User;
import com.exception.EmailExistsException;
import com.exception.InvalidPasswordException;
import com.exception.UserNotFoundException;
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

    public TokenResponse login(LoginRequest request) {
        User user = userRepository.findByEmail(request.getEmail().toLowerCase()).orElseThrow(() -> new UserNotFoundException());

        if (passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            return new TokenResponse(jwtService.generateToken(user));
        }
        else throw new InvalidPasswordException();
    }

    public TokenResponse register(RegisterRequest request) {
        if (userRepository.existsByEmail(request.getEmail().toLowerCase())) {
            throw new EmailExistsException();
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
        return new TokenResponse(jwtService.generateToken(user));
    }

    public void logout(String token) {
        if (token == null) {
            throw new InvalidPasswordException();
        }
        tokenBlackListService.blacklistToken(token);
    }

}
