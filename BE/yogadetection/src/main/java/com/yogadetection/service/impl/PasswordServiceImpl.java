package com.yogadetection.service.impl;

import com.yogadetection.config.ErrorCode;
import com.yogadetection.dto.request.ChangePasswordRequest;
import com.yogadetection.dto.request.ResetPasswordRequest;
import com.yogadetection.dto.request.VerifyOTPRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.dto.response.TokenResponse;
import com.yogadetection.entity.OTPCode;
import com.yogadetection.entity.User;
import com.yogadetection.exception.InvalidPasswordException;
import com.yogadetection.exception.UserNotFoundException;
import com.yogadetection.repository.UserRepository;
import com.yogadetection.service.JwtService;
import com.yogadetection.service.MailService;
import com.yogadetection.service.PasswordService;
import lombok.AllArgsConstructor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Service
@AllArgsConstructor
public class PasswordServiceImpl implements PasswordService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final MailService mailService;
    private final Map<String, OTPCode> otpSet = new HashMap<>();
    private final JwtService jwtService;

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
    public ApiResponse<String> sendOTP(ResetPasswordRequest request) {
        User user = userRepository.findByEmail(request.getEmail().toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        Random random = new Random();
        OTPCode otpCode = new OTPCode();
        String newOtp = String.valueOf(random.nextInt(100000));
        while (newOtp.length() < 6) {
            newOtp = "0" + newOtp;
        }
        otpCode.setCode(newOtp);
        otpCode.setExpireTime((int)System.currentTimeMillis() / 1000 + 60);
        otpSet.put(request.getEmail(), otpCode);
        mailService.sendEmail(request.getEmail(), "OTP CODE", "Your otp code is: " + newOtp);
        return new ApiResponse<>();
    }

    public ApiResponse<Map<String, String>> verifyOTP(VerifyOTPRequest request) {
        ApiResponse<Map<String, String>> apiResponse = new ApiResponse<>();
        Map<String, String> token = new HashMap<>();
        User user = userRepository.findByEmail(request.getEmail().toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        if (!otpSet.containsKey(request.getEmail())) {
            return new ApiResponse<>(ErrorCode.OTP_INCORRECT);
        }
        if (otpSet.get(request.getEmail()).getExpireTime() > System.currentTimeMillis()) {
            return new ApiResponse<>(ErrorCode.OTP_EXPIRED);
        }
        token.put("token", jwtService.generateToken(user));
        apiResponse.setData(token);
        return apiResponse;
    }

    @Scheduled(fixedRate = 60 * 60 * 1000)
    public void cleanupOTPSet() {
        long now = System.currentTimeMillis();
        otpSet.entrySet().removeIf(entry -> entry.getValue().getExpireTime() < now);
    }
}
