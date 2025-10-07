package com.yogadetection.service.impl;

import com.yogadetection.dto.request.LoginRequest;
import com.yogadetection.dto.request.RegisterRequest;
import com.yogadetection.dto.response.TokenResponse;
import com.yogadetection.entity.User;
import com.yogadetection.exception.EmailExistsException;
import com.yogadetection.exception.InvalidPasswordException;
import com.yogadetection.exception.UserNotFoundException;
import com.yogadetection.repository.UserRepository;
import com.yogadetection.service.AuthService;
import com.yogadetection.service.JwtService;
import com.yogadetection.service.TokenBlackListService;
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
