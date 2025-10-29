package com.yogadetection.service;

import com.yogadetection.dto.request.CreateGroupRequest;
import com.yogadetection.dto.response.FriendResponse;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.UserActivityResponse;
import com.yogadetection.dto.response.YogaGroupResponse;

public interface SocialService {
    
    // Friendship methods
    void sendFriendRequest(String userId, String friendEmail);
    
    void acceptFriendRequest(String userId, String friendshipId);
    
    void rejectFriendRequest(String userId, String friendshipId);
    
    void removeFriend(String userId, String friendshipId);
    
    PagedResponse<FriendResponse> getFriends(String userId, int page, int size);
    
    PagedResponse<FriendResponse> getPendingRequests(String userId, int page, int size);
    
    // Group methods
    YogaGroupResponse createGroup(String userId, CreateGroupRequest request);
    
    YogaGroupResponse getGroupById(String groupId, String userId);
    
    PagedResponse<YogaGroupResponse> getPublicGroups(int page, int size, String userId);
    
    PagedResponse<YogaGroupResponse> getMyGroups(String userId, int page, int size);
    
    PagedResponse<YogaGroupResponse> searchGroups(String keyword, int page, int size, String userId);
    
    void joinGroup(String userId, String groupId);
    
    void leaveGroup(String userId, String groupId);
    
    // Activity feed
    PagedResponse<UserActivityResponse> getFriendActivities(String userId, int page, int size);
    
    PagedResponse<UserActivityResponse> getMyActivities(String userId, int page, int size);
}

