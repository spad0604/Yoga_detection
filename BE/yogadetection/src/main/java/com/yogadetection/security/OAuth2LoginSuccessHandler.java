package com.yogadetection.security;

import com.yogadetection.entity.User;
import com.yogadetection.entity.enums.UserProviderEnum;
import com.yogadetection.entity.enums.UserRoleEnum;
import com.yogadetection.repository.UserRepository;
import com.yogadetection.service.JwtService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Optional;

/**
 * Handler xử lý sau khi đăng nhập Google OAuth2 thành công
 * Tự động tạo user mới hoặc cập nhật thông tin user hiện có
 * Redirect về frontend với JWT token
 * 
 * Bean này chỉ được tạo khi OAuth2 client properties được cấu hình
 */
@Slf4j
@Component
@RequiredArgsConstructor
@ConditionalOnProperty(prefix = "spring.security.oauth2.client.registration.google", name = "client-id")
public class OAuth2LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
    
    private final UserRepository userRepository;
    private final JwtService jwtService;
    private final PasswordEncoder passwordEncoder;
    
    @Override
    public void onAuthenticationSuccess(
            HttpServletRequest request,
            HttpServletResponse response,
            Authentication authentication
    ) throws IOException, ServletException {
        
        OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
        
        // Lấy thông tin từ Google
        String email = oAuth2User.getAttribute("email");
        String name = oAuth2User.getAttribute("name");
        String picture = oAuth2User.getAttribute("picture");
        String googleId = oAuth2User.getAttribute("sub");
        
        log.info("OAuth2 login success for email: {}", email);
        
        try {
            // Tìm hoặc tạo user
            User user = findOrCreateUser(email, name, picture, googleId);
            
            // Generate JWT tokens
            String accessToken = jwtService.generateToken(user);
            String refreshToken = jwtService.generateRefreshToken(user);
            
            // Redirect về frontend với tokens
            String redirectUrl = UriComponentsBuilder.fromUriString("http://localhost:3000/auth/callback")
                    .queryParam("userId", user.getId())
                    .queryParam("accessToken", accessToken)
                    .queryParam("refreshToken", refreshToken)
                    .queryParam("provider", "GOOGLE")
                    .build()
                    .toUriString();
            
            log.info("Redirecting to: {}", redirectUrl);
            getRedirectStrategy().sendRedirect(request, response, redirectUrl);
            
        } catch (Exception e) {
            log.error("Error handling OAuth2 login: {}", e.getMessage(), e);
            
            // Redirect về frontend với error
            String errorUrl = UriComponentsBuilder.fromUriString("http://localhost:3000/auth/error")
                    .queryParam("error", "authentication_failed")
                    .queryParam("message", e.getMessage())
                    .build()
                    .toUriString();
            
            getRedirectStrategy().sendRedirect(request, response, errorUrl);
        }
    }
    
    private User findOrCreateUser(String email, String name, String picture, String googleId) {
        Optional<User> existingUser = userRepository.findByEmail(email.toLowerCase());
        
        if (existingUser.isPresent()) {
            // User đã tồn tại - cập nhật thông tin
            User user = existingUser.get();
            boolean updated = false;
            
            if (picture != null && !picture.equals(user.getAvatarUrl())) {
                user.setAvatarUrl(picture);
                updated = true;
            }
            
            if (user.getUserProvider() == UserProviderEnum.ACCOUNT_CREATION) {
                user.setUserProvider(UserProviderEnum.GOOGLE);
                updated = true;
            }
            
            if (updated) {
                user = userRepository.save(user);
                log.info("Updated existing user from OAuth2: {}", email);
            }
            
            return user;
            
        } else {
            // Tạo user mới
            String[] nameParts = name != null ? name.split(" ", 2) : new String[]{"", ""};
            String firstName = nameParts.length > 0 ? nameParts[0] : "";
            String lastName = nameParts.length > 1 ? nameParts[1] : "";
            
            User newUser = User.builder()
                    .email(email.toLowerCase())
                    .firstName(firstName)
                    .lastName(lastName)
                    .avatarUrl(picture)
                    .password(passwordEncoder.encode(googleId)) // Random password
                    .userProvider(UserProviderEnum.GOOGLE)
                    .userRole(UserRoleEnum.USER)
                    .registerDate(LocalDateTime.now())
                    .build();
            
            newUser = userRepository.save(newUser);
            log.info("Created new user from OAuth2: {}", email);
            
            return newUser;
        }
    }
}
