package com.yogadetection.service.impl;

import com.yogadetection.dto.request.LoginRequest;
import com.yogadetection.dto.request.RefreshTokenRequest;
import com.yogadetection.dto.request.RegisterRequest;
import com.yogadetection.dto.response.TokenResponse;
import com.yogadetection.entity.User;
import com.yogadetection.exception.EmailExistsException;
import com.yogadetection.exception.InvalidPasswordException;
import com.yogadetection.exception.InvalidTokenException;
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
            userRepository.saveFcmToken(request.getFcmToken(), request.getEmail().toLowerCase());
            String accessToken = jwtService.generateToken(user);
            String refreshToken = jwtService.generateRefreshToken(user);
            return new TokenResponse(accessToken, refreshToken);
        } else throw new InvalidPasswordException();
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
        String accessToken = jwtService.generateToken(user);
        String refreshToken = jwtService.generateRefreshToken(user);
        return new TokenResponse(accessToken, refreshToken);
    }

    public TokenResponse refreshToken(RefreshTokenRequest request) {
        String refreshToken = request.getRefreshToken();

        if (refreshToken == null || refreshToken.isEmpty()) {
            throw new InvalidTokenException();
        }

        try {
            String username = jwtService.extractUsername(refreshToken);

            if (username != null) {
                User user = userRepository.findByEmail(username)
                        .orElseThrow(() -> new UserNotFoundException());

                if (jwtService.isTokenValid(refreshToken, user)) {
                    String newAccessToken = jwtService.generateToken(user);
                    String newRefreshToken = jwtService.generateRefreshToken(user);
                    return new TokenResponse(newAccessToken, newRefreshToken);
                } else {
                    throw new InvalidTokenException();
                }
            } else {
                throw new InvalidTokenException();
            }
        } catch (Exception e) {
            throw new InvalidTokenException();
        }
    }

    public void logout(String token) {
        if (token == null) {
            throw new InvalidPasswordException();
        }
        tokenBlackListService.blacklistToken(token);
    }

}
