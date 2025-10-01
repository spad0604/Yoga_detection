package com.service.impl;

import com.dto.request.ChangePasswordRequest;
import com.dto.request.ResetPasswordRequest;
import com.dto.response.ApiResponse;
import com.entity.User;
import com.exception.InvalidPasswordException;
import com.exception.UserNotFoundException;
import com.repository.UserRepository;
import com.service.MailService;
import com.service.PasswordService;
import com.utils.PasswordGenerator;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class PasswordServiceImpl implements PasswordService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final MailService mailService;

    @Override
    public ApiResponse<String> changePassword(ChangePasswordRequest request) {
        User user = userRepository.findByEmail(request.getEmail().toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        if (!passwordEncoder.matches(request.getOldPassword(), user.getPassword())) {
            throw new InvalidPasswordException();
        }
        user.setPassword(passwordEncoder.encode(request.getNewPassword()));
        userRepository.save(user);
        return new ApiResponse<>();
    }

    @Override
    public ApiResponse<String> resetPassword(ResetPasswordRequest request) {
        User user = userRepository.findByEmail(request.getEmail().toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        String newPassword = PasswordGenerator.generatePassword();
        mailService.sendEmail(request.getEmail(), "Password Reset", "Your new password is: " + newPassword);
        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);
        return new ApiResponse<>();
    }
}
