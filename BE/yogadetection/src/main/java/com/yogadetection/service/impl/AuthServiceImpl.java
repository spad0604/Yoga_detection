package com.yogadetection.service.impl;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.yogadetection.dto.request.GoogleLoginRequest;
import com.yogadetection.dto.request.LoginRequest;
import com.yogadetection.dto.request.RefreshTokenRequest;
import com.yogadetection.dto.request.RegisterRequest;
import com.yogadetection.dto.response.TokenResponse;
import com.yogadetection.entity.User;
import com.yogadetection.entity.enums.UserProviderEnum;
import com.yogadetection.entity.enums.UserRoleEnum;
import com.yogadetection.exception.EmailExistsException;
import com.yogadetection.exception.InvalidPasswordException;
import com.yogadetection.exception.InvalidTokenException;
import com.yogadetection.exception.UserNotFoundException;
import com.yogadetection.repository.UserRepository;
import com.yogadetection.service.AuthService;
import com.yogadetection.service.JwtService;
import com.yogadetection.service.TokenBlackListService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Optional;

@Slf4j
@Service
@Component("authService")
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {
    private final UserRepository userRepository;
    private final JwtService jwtService;
    private final PasswordEncoder passwordEncoder;
    private final TokenBlackListService tokenBlackListService;
    
    @Value("${google.client.id:}")
    private String googleClientId;

    @Override
    public TokenResponse login(LoginRequest request) {
        User user = userRepository.findByEmail(request.getEmail().toLowerCase()).orElseThrow(() -> new UserNotFoundException());

        if (passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            userRepository.saveFcmToken(request.getFcmToken(), request.getEmail().toLowerCase());
            String accessToken = jwtService.generateToken(user);
            String refreshToken = jwtService.generateRefreshToken(user);
            return new TokenResponse(user.getId(), user.getUserProvider(), user.getUserRole(), accessToken, refreshToken);
        } else throw new InvalidPasswordException();
    }

    @Override
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
                .userProvider(UserProviderEnum.ACCOUNT_CREATION)
                .userRole(UserRoleEnum.USER)
                .build();
        User savedUser = userRepository.save(user);
        String accessToken = jwtService.generateToken(savedUser);
        String refreshToken = jwtService.generateRefreshToken(savedUser);
        return new TokenResponse(savedUser.getId(), savedUser.getUserProvider(), savedUser.getUserRole(), accessToken, refreshToken);
    }

    @Override
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
                    return new TokenResponse(user.getId(), user.getUserProvider(), user.getUserRole(), newAccessToken, newRefreshToken);
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

    @Override
    public void logout(String token) {
        if (token == null) {
            throw new InvalidPasswordException();
        }
        tokenBlackListService.blacklistToken(token);
    }

    @Override
    public TokenResponse loginWithGoogle(GoogleLoginRequest request) {
        try {
            String idTokenString = request.getIdToken();
            
            if (idTokenString == null || idTokenString.isEmpty()) {
                throw new InvalidTokenException();
            }
            
            // Verify Google ID token
            GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
                    new NetHttpTransport(), new GsonFactory())
                    .setAudience(Collections.singletonList(googleClientId))
                    .build();
            
            GoogleIdToken idToken = verifier.verify(idTokenString);
            
            if (idToken == null) {
                log.error("Invalid Google ID token");
                throw new InvalidTokenException();
            }
            
            GoogleIdToken.Payload payload = idToken.getPayload();
            String email = payload.getEmail();
            String googleId = payload.getSubject();
            String name = (String) payload.get("name");
            String picture = (String) payload.get("picture");
            
            log.info("Google login attempt for email: {}", email);
            
            Optional<User> existingUser = userRepository.findByEmail(email.toLowerCase());
            User user;
            
            if (existingUser.isPresent()) {
                user = existingUser.get();
                boolean updated = false;
                
                if (picture != null && !picture.equals(user.getAvatarUrl())) {
                    user.setAvatarUrl(picture);
                    updated = true;
                }
                
                if (request.getFcmToken() != null && !request.getFcmToken().isEmpty()) {
                    user.setFcmToken(request.getFcmToken());
                    updated = true;
                }
                
                if (user.getUserProvider() == UserProviderEnum.ACCOUNT_CREATION) {
                    user.setUserProvider(UserProviderEnum.GOOGLE);
                    updated = true;
                }
                
                if (updated) {
                    user = userRepository.save(user);
                    log.info("Updated existing user: {}", email);
                }
                
            } else {
                String[] nameParts = name != null ? name.split(" ", 2) : new String[]{"", ""};
                String firstName = nameParts.length > 0 ? nameParts[0] : "";
                String lastName = nameParts.length > 1 ? nameParts[1] : "";
                
                user = User.builder()
                        .email(email.toLowerCase())
                        .firstName(firstName)
                        .lastName(lastName)
                        .avatarUrl(picture)
                        .password(passwordEncoder.encode(googleId))
                        .userProvider(UserProviderEnum.GOOGLE)
                        .userRole(UserRoleEnum.USER)
                        .fcmToken(request.getFcmToken())
                        .registerDate(LocalDateTime.now())
                        .build();
                
                user = userRepository.save(user);
                log.info("Created new user from Google account: {}", email);
            }
            
            // Generate JWT tokens
            String accessToken = jwtService.generateToken(user);
            String refreshToken = jwtService.generateRefreshToken(user);
            
            return new TokenResponse(user.getId(), UserProviderEnum.GOOGLE, user.getUserRole(), accessToken, refreshToken);
            
        } catch (InvalidTokenException e) {
            throw e;
        } catch (Exception e) {
            log.error("Error during Google login: {}", e.getMessage(), e);
            throw new RuntimeException("Failed to authenticate with Google: " + e.getMessage());
        }
    }

}
