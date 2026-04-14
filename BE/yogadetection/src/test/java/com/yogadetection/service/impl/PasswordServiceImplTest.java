package com.yogadetection.service.impl;

import com.yogadetection.dto.request.ResetPasswordRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.entity.User;
import com.yogadetection.repository.UserRepository;
import com.yogadetection.service.JwtService;
import com.yogadetection.service.MailService;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

class PasswordServiceImplTest {

    @Test
    void resetPassword_allowsSpecialCharacters_andPersistsUser() {
        UserRepository userRepository = mock(UserRepository.class);
        PasswordEncoder passwordEncoder = mock(PasswordEncoder.class);
        MailService mailService = mock(MailService.class);
        JwtService jwtService = mock(JwtService.class);

        PasswordServiceImpl service = new PasswordServiceImpl(
                userRepository,
                passwordEncoder,
                mailService,
                jwtService
        );

        String token = "dummy";
        when(jwtService.extractUsername(token)).thenReturn("user@example.com");

        User user = User.builder()
                .email("user@example.com")
                .password("old")
                .firstName("A")
                .lastName("B")
                .build();
        when(userRepository.findByEmail("user@example.com")).thenReturn(Optional.of(user));

        String newPassword = "Hbc1905:)";
        when(passwordEncoder.encode(newPassword)).thenReturn("encoded");
        when(userRepository.save(any(User.class))).thenAnswer(invocation -> invocation.getArgument(0));

        ResetPasswordRequest request = new ResetPasswordRequest();
        request.setNewPassword(newPassword);
        request.setConfirmNewPassword(newPassword);

        ApiResponse<String> response = service.resetPassword(token, request);

        assertThat(response).isNotNull();

        ArgumentCaptor<User> userCaptor = ArgumentCaptor.forClass(User.class);
        verify(userRepository).save(userCaptor.capture());
        assertThat(userCaptor.getValue().getPassword()).isEqualTo("encoded");

        verify(passwordEncoder).encode(newPassword);
        verify(jwtService).extractUsername(token);
    }
}
