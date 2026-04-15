package com.yogadetection.service.impl;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yogadetection.dto.request.ChangeInformationRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.dto.response.UserInfoResponse;
import com.yogadetection.entity.User;
import com.yogadetection.exception.UserNotFoundException;
import com.yogadetection.repository.UserRepository;
import com.yogadetection.service.ImageService;
import com.yogadetection.service.JwtService;
import com.yogadetection.service.UserService;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    private final JwtService jwtService;
    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;
    private final ImageService imageService;

    @Override
    public UserInfoResponse getInformation(String token) {
        String email = jwtService.extractUsername(token);
        User user = userRepository.findByEmail(email.toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        return UserInfoResponse.builder()
                .id(user.getId())
                .email(user.getEmail())
                .phone(user.getPhone())
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .dob(user.getBirthDate() != null ? user.getBirthDate().toString() : null)
                .registerDate(user.getRegisterDate() != null ? user.getRegisterDate().toString() : null)
                .avatarUrl(user.getAvatarUrl())
                .build();
    }

    @Override
    public ApiResponse<String> changeInformation(ChangeInformationRequest request) {
        User user = userRepository.findByEmail(request.getEmail().toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        if (request.getDob() != null) {
            user.setBirthDate(request.getDob());
        }
        if (request.getFirstName() != null) {
            user.setFirstName(request.getFirstName());
        }
        if (request.getLastName() != null) {
            user.setLastName(request.getLastName());
        }
        userRepository.save(user);
        return new ApiResponse<>();
    }

    public ApiResponse<String> deleteUser(String token) {
        String email = jwtService.extractUsername(token);
        User user = userRepository.findByEmail(email.toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        userRepository.delete(user);
        return new ApiResponse<>();
    }

    @Override
    public String getUserId(String token) {
        String email = jwtService.extractUsername(token);
        User user = userRepository.findByEmail(email.toLowerCase()).orElseThrow(() -> new UserNotFoundException());
        return user.getId();
    }

    @Override
    public UserInfoResponse updateProfile(String token, String firstName, String lastName, String dob, String phone, MultipartFile avatar) {
        String email = jwtService.extractUsername(token);
        User user = userRepository.findByEmail(email.toLowerCase()).orElseThrow(UserNotFoundException::new);

        if (firstName != null && !firstName.isBlank()) {
            user.setFirstName(firstName);
        }
        if (lastName != null && !lastName.isBlank()) {
            user.setLastName(lastName);
        }
        if (dob != null && !dob.isBlank()) {
            try {
                user.setBirthDate(java.time.LocalDate.parse(dob));
            } catch (Exception ignored) { }
        }
        if (phone != null) {
            final String trimmed = phone.trim();
            user.setPhone(trimmed.isEmpty() ? null : trimmed);
        }
        if (avatar != null && !avatar.isEmpty()) {
            String imageUrl = imageService.uploadImage(avatar, user.getId());
            user.setAvatarUrl(imageUrl);
        }
        userRepository.save(user);

        return UserInfoResponse.builder()
                .id(user.getId())
                .email(user.getEmail())
                .phone(user.getPhone())
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .dob(user.getBirthDate() != null ? user.getBirthDate().toString() : null)
                .registerDate(user.getRegisterDate() != null ? user.getRegisterDate().toString() : null)
                .avatarUrl(user.getAvatarUrl())
                .build();
    }
}
