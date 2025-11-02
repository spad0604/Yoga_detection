package com.yogadetection.controller;

import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.UserInfoResponse;
import com.yogadetection.entity.User;
import com.yogadetection.entity.enums.UserRoleEnum;
import com.yogadetection.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * Admin Controller for managing Users
 * Only accessible by users with ADMIN role
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/admin/users")
@PreAuthorize("hasRole('ADMIN')")
public class AdminUserController {
    
    private final UserRepository userRepository;

    /**
     * GET /api/admin/users - Lấy danh sách tất cả users
     */
    @GetMapping
    public PagedResponse<UserInfoResponse> getAllUsers(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String keyword
    ) {
        Pageable pageable = PageRequest.of(page, size);
        Page<User> userPage;
        
        if (keyword != null && !keyword.isEmpty()) {
            userPage = userRepository.findByEmailContainingOrFirstNameContainingOrLastNameContaining(
                    keyword, keyword, keyword, pageable);
        } else {
            userPage = userRepository.findAll(pageable);
        }
        
        return PagedResponse.<UserInfoResponse>builder()
                .items(userPage.getContent().stream()
                        .map(this::mapToUserInfoResponse)
                        .toList())
                .page(userPage.getNumber())
                .pageSize(userPage.getSize())
                .totalElements(userPage.getTotalElements())
                .totalPages(userPage.getTotalPages())
                .hasNext(userPage.hasNext())
                .hasPrevious(userPage.hasPrevious())
                .build();
    }

    /**
     * GET /api/admin/users/{userId} - Lấy thông tin chi tiết user
     */
    @GetMapping("/{userId}")
    public UserInfoResponse getUserById(@PathVariable String userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userId));
        return mapToUserInfoResponse(user);
    }

    /**
     * PUT /api/admin/users/{userId}/role - Cập nhật role của user
     */
    @PutMapping("/{userId}/role")
    public ApiResponse<UserInfoResponse> updateUserRole(
            @PathVariable String userId,
            @RequestParam String role
    ) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userId));
        
        try {
            UserRoleEnum newRole = UserRoleEnum.valueOf(role.toUpperCase());
            user.setUserRole(newRole);
            User updatedUser = userRepository.save(user);
            
            return ApiResponse.<UserInfoResponse>defaultResponse();
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException("Invalid role: " + role + ". Must be USER or ADMIN");
        }
    }

    /**
     * DELETE /api/admin/users/{userId} - Xóa user
     */
    @DeleteMapping("/{userId}")
    public ApiResponse<Void> deleteUser(@PathVariable String userId) {
        if (!userRepository.existsById(userId)) {
            throw new IllegalArgumentException("User not found: " + userId);
        }
        
        userRepository.deleteById(userId);
        return ApiResponse.<Void>defaultResponse();
    }

    /**
     * PUT /api/admin/users/{userId}/ban - Ban/Unban user
     */
    @PutMapping("/{userId}/ban")
    public ApiResponse<UserInfoResponse> toggleBanUser(
            @PathVariable String userId,
            @RequestParam boolean banned
    ) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("User not found: " + userId));
        
        // Note: Bạn cần thêm field 'isBanned' vào User entity nếu muốn chức năng này
        // user.setIsBanned(banned);
        User updatedUser = userRepository.save(user);
        
        return ApiResponse.defaultResponse();
    }

    private UserInfoResponse mapToUserInfoResponse(User user) {
        return UserInfoResponse.builder()
                .id(user.getId())
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .email(user.getEmail())
                .birthDate(user.getBirthDate())
                .avatarUrl(user.getAvatarUrl())
                .provider(user.getUserProvider())
                .role(user.getUserRole())
                .registerDateTime(user.getRegisterDate())
                .registerDate(user.getRegisterDate() != null ? user.getRegisterDate().toString() : null)
                .build();
    }
}
