package com.yogadetection.service.impl;

import com.yogadetection.config.ErrorCode;
import com.yogadetection.dto.request.ChangePasswordRequest;
import com.yogadetection.dto.request.ResetPasswordRequest;
import com.yogadetection.dto.request.SendOTPRequest;
import com.yogadetection.dto.request.VerifyOTPRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.dto.response.TokenResponse;
import com.yogadetection.entity.OTPCode;
import com.yogadetection.entity.User;
import com.yogadetection.exception.*;
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
    public void changePassword(String token, ChangePasswordRequest request) {
        if (!request.getConfirmNewPassword().equals(request.getNewPassword())) {
            throw new PasswordsDoNotMatchException();
        }
        String email = jwtService.extractUsername(token);
        User user = userRepository.findByEmail(email.toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        if (!passwordEncoder.matches(request.getOldPassword(), user.getPassword())) {
            throw new InvalidPasswordException();
        }
        user.setPassword(passwordEncoder.encode(request.getNewPassword()));
        userRepository.save(user);
    }

    @Override
    public void sendOTP(SendOTPRequest request) {
        User user = userRepository.findByEmail(request.getEmail().toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        Random random = new Random();
        OTPCode otpCode = new OTPCode();
        String newOtp = String.valueOf(random.nextInt(1000000));
        while (newOtp.length() < 6) {
            newOtp = "0" + newOtp;
        }
        otpCode.setCode(newOtp);
        otpCode.setExpireTime((int)System.currentTimeMillis() / 1000 + 60);
        otpSet.put(request.getEmail(), otpCode);
        mailService.sendEmail(request.getEmail(), "OTP CODE", "Your otp code is: " + newOtp);
    }

    public void verifyOTP(VerifyOTPRequest request) {
        ApiResponse<Map<String, String>> apiResponse = new ApiResponse<>();
        Map<String, String> token = new HashMap<>();
        User user = userRepository.findByEmail(request.getEmail().toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        if (!otpSet.containsKey(request.getEmail())) {
            throw new OtpIncorrectException();
        }
        if (otpSet.get(request.getEmail()).getExpireTime() > System.currentTimeMillis()) {
            throw new OtpExpiredException();
        }
        if (!otpSet.get(request.getEmail()).getCode().equals(request.getOtp())) {
            throw new OtpIncorrectException();
        }
        otpSet.remove(request.getEmail());
        token.put("token", jwtService.generateToken(user));
        apiResponse.setData(token);
    }

    public void resetPassword(String token, ResetPasswordRequest request) {
        if (!request.getNewPassword().matches(request.getConfirmNewPassword())) {
            throw new PasswordsDoNotMatchException();
        }
        String email =  jwtService.extractUsername(token);
        User user = userRepository.findByEmail(email.toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        user.setPassword(passwordEncoder.encode(request.getNewPassword()));
    }

    @Scheduled(fixedRate = 60 * 60 * 1000)
    public void cleanupOTPSet() {
        long now = System.currentTimeMillis();
        otpSet.entrySet().removeIf(entry -> entry.getValue().getExpireTime() < now);
    }
}
