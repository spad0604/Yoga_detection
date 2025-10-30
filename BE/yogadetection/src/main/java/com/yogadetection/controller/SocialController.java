package com.yogadetection.controller;

import com.yogadetection.dto.request.CreateGroupRequest;
import com.yogadetection.dto.response.*;
import com.yogadetection.service.JwtService;
import com.yogadetection.service.SocialService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/social")
public class SocialController {

    private final SocialService socialService;
    private final JwtService jwtService;

    // ============ FRIENDS ENDPOINTS ============

    @PostMapping("/friends/request")
    public ApiResponse<Void> sendFriendRequest(
            @RequestParam String friendEmail,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        socialService.sendFriendRequest(userId, friendEmail);
        return ApiResponse.defaultResponse();
    }

    @PostMapping("/friends/accept/{friendshipId}")
    public ApiResponse<Void> acceptFriendRequest(
            @PathVariable String friendshipId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        socialService.acceptFriendRequest(userId, friendshipId);
        return ApiResponse.defaultResponse();
    }

    @PostMapping("/friends/reject/{friendshipId}")
    public ApiResponse<Void> rejectFriendRequest(
            @PathVariable String friendshipId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        socialService.rejectFriendRequest(userId, friendshipId);
        return ApiResponse.defaultResponse();
    }

    @DeleteMapping("/friends/{friendshipId}")
    public ApiResponse<Void> removeFriend(
            @PathVariable String friendshipId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        socialService.removeFriend(userId, friendshipId);
        return ApiResponse.defaultResponse();
    }

    @GetMapping("/friends")
    public ApiResponse<PagedResponse<FriendResponse>> getFriends(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        PagedResponse<FriendResponse> response = socialService.getFriends(userId, page, size);
        return ApiResponse.success(response);
    }

    @GetMapping("/friends/pending")
    public ApiResponse<PagedResponse<FriendResponse>> getPendingRequests(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        PagedResponse<FriendResponse> response = socialService.getPendingRequests(userId, page, size);
        return ApiResponse.success(response);
    }

    // ============ GROUPS ENDPOINTS ============

    @PostMapping("/groups")
    public ApiResponse<YogaGroupResponse> createGroup(
            @RequestBody CreateGroupRequest request,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        YogaGroupResponse response = socialService.createGroup(userId, request);
        return ApiResponse.success(response);
    }

    @GetMapping("/groups/{id}")
    public ApiResponse<YogaGroupResponse> getGroupById(
            @PathVariable String id,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        YogaGroupResponse response = socialService.getGroupById(id, userId);
        return ApiResponse.success(response);
    }

    @GetMapping("/groups")
    public ApiResponse<PagedResponse<YogaGroupResponse>> getPublicGroups(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        PagedResponse<YogaGroupResponse> response = socialService.getPublicGroups(page, size, userId);
        return ApiResponse.success(response);
    }

    @GetMapping("/groups/my")
    public ApiResponse<PagedResponse<YogaGroupResponse>> getMyGroups(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        PagedResponse<YogaGroupResponse> response = socialService.getMyGroups(userId, page, size);
        return ApiResponse.success(response);
    }

    @GetMapping("/groups/search")
    public ApiResponse<PagedResponse<YogaGroupResponse>> searchGroups(
            @RequestParam String keyword,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        PagedResponse<YogaGroupResponse> response = socialService.searchGroups(keyword, page, size, userId);
        return ApiResponse.success(response);
    }

    @PostMapping("/groups/{groupId}/join")
    public ApiResponse<Void> joinGroup(
            @PathVariable String groupId,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        socialService.joinGroup(userId, groupId);
        return ApiResponse.defaultResponse();
    }

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

    @GetMapping("/activities/friends")
    public ApiResponse<PagedResponse<UserActivityResponse>> getFriendActivities(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        PagedResponse<UserActivityResponse> response = socialService.getFriendActivities(userId, page, size);
        return ApiResponse.success(response);
    }

    @GetMapping("/activities/me")
    public ApiResponse<PagedResponse<UserActivityResponse>> getMyActivities(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestHeader("Authorization") String authHeader
    ) {
        String userId = extractUserId(authHeader);
        PagedResponse<UserActivityResponse> response = socialService.getMyActivities(userId, page, size);
        return ApiResponse.success(response);
    }

    // ============ PRIVATE UTILS ============

    private String extractUserId(String authHeader) {
        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            String token = authHeader.substring(7);
            return jwtService.extractUserId(token);
        }
        throw new IllegalArgumentException("Invalid authorization header");
    }
}
