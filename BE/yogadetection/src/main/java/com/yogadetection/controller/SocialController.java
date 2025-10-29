package com.yogadetection.controller;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yogadetection.dto.request.CreateGroupRequest;
import com.yogadetection.dto.response.ApiResponse;
import com.yogadetection.dto.response.FriendResponse;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.UserActivityResponse;
import com.yogadetection.dto.response.YogaGroupResponse;
import com.yogadetection.service.JwtService;
import com.yogadetection.service.SocialService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/social")
public class SocialController {
    
    private final SocialService socialService;
    private final JwtService jwtService;

    // ============ FRIENDS ENDPOINTS ============
    
    /**
     * POST /api/social/friends/request - Gửi lời mời kết bạn
     */
    @PostMapping("/friends/request")
    public ApiResponse<Void> sendFriendRequest(
            @RequestParam String friendEmail,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        socialService.sendFriendRequest(userId, friendEmail);
        return ApiResponse.defaultResponse();
    }

    /**
     * POST /api/social/friends/accept/{friendshipId} - Chấp nhận lời mời
     */
    @PostMapping("/friends/accept/{friendshipId}")
    public ApiResponse<Void> acceptFriendRequest(
            @PathVariable String friendshipId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        socialService.acceptFriendRequest(userId, friendshipId);
        return ApiResponse.defaultResponse();
    }

    /**
     * POST /api/social/friends/reject/{friendshipId} - Từ chối lời mời
     */
    @PostMapping("/friends/reject/{friendshipId}")
    public ApiResponse<Void> rejectFriendRequest(
            @PathVariable String friendshipId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        socialService.rejectFriendRequest(userId, friendshipId);
        return ApiResponse.defaultResponse();
    }

    /**
     * DELETE /api/social/friends/{friendshipId} - Xóa bạn bè
     */
    @DeleteMapping("/friends/{friendshipId}")
    public ApiResponse<Void> removeFriend(
            @PathVariable String friendshipId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        socialService.removeFriend(userId, friendshipId);
        return ApiResponse.defaultResponse();
    }

    /**
     * GET /api/social/friends - Lấy danh sách bạn bè
     */
    @GetMapping("/friends")
    public PagedResponse<FriendResponse> getFriends(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        return socialService.getFriends(userId, page, size);
    }

    /**
     * GET /api/social/friends/pending - Lấy lời mời kết bạn đang chờ
     */
    @GetMapping("/friends/pending")
    public PagedResponse<FriendResponse> getPendingRequests(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        return socialService.getPendingRequests(userId, page, size);
    }

    // ============ GROUPS ENDPOINTS ============
    
    /**
     * POST /api/social/groups - Tạo nhóm mới
     */
    @PostMapping("/groups")
    public YogaGroupResponse createGroup(
            @RequestBody CreateGroupRequest request,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        return socialService.createGroup(userId, request);
    }

    /**
     * GET /api/social/groups/{id} - Lấy chi tiết nhóm
     */
    @GetMapping("/groups/{id}")
    public YogaGroupResponse getGroupById(
            @PathVariable String id,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        return socialService.getGroupById(id, userId);
    }

    /**
     * GET /api/social/groups - Lấy danh sách nhóm công khai
     */
    @GetMapping("/groups")
    public PagedResponse<YogaGroupResponse> getPublicGroups(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        return socialService.getPublicGroups(page, size, userId);
    }

    /**
     * GET /api/social/groups/my - Lấy nhóm mà user đã join
     */
    @GetMapping("/groups/my")
    public PagedResponse<YogaGroupResponse> getMyGroups(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        return socialService.getMyGroups(userId, page, size);
    }

    /**
     * GET /api/social/groups/search - Tìm kiếm nhóm
     */
    @GetMapping("/groups/search")
    public PagedResponse<YogaGroupResponse> searchGroups(
            @RequestParam String keyword,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        return socialService.searchGroups(keyword, page, size, userId);
    }

    /**
     * POST /api/social/groups/{groupId}/join - Tham gia nhóm
     */
    @PostMapping("/groups/{groupId}/join")
    public ApiResponse<Void> joinGroup(
            @PathVariable String groupId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        socialService.joinGroup(userId, groupId);
        return ApiResponse.defaultResponse();
    }

    /**
     * POST /api/social/groups/{groupId}/leave - Rời khỏi nhóm
     */
    @PostMapping("/groups/{groupId}/leave")
    public ApiResponse<Void> leaveGroup(
            @PathVariable String groupId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        socialService.leaveGroup(userId, groupId);
        return ApiResponse.defaultResponse();
    }

    // ============ ACTIVITY FEED ENDPOINTS ============
    
    /**
     * GET /api/social/activities/friends - Xem hoạt động của bạn bè
     */
    @GetMapping("/activities/friends")
    public PagedResponse<UserActivityResponse> getFriendActivities(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        return socialService.getFriendActivities(userId, page, size);
    }

    /**
     * GET /api/social/activities/me - Xem hoạt động của mình
     */
    @GetMapping("/activities/me")
    public PagedResponse<UserActivityResponse> getMyActivities(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        return socialService.getMyActivities(userId, page, size);
    }

    private String extractUserId(String authHeader) {
        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            String token = authHeader.substring(7);
            return jwtService.extractUserId(token);
        }
        throw new IllegalArgumentException("Invalid authorization header");
    }
}

