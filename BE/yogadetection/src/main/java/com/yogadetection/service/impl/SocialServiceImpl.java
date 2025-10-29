package com.yogadetection.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yogadetection.dto.request.CreateGroupRequest;
import com.yogadetection.dto.response.FriendResponse;
import com.yogadetection.dto.response.PagedResponse;
import com.yogadetection.dto.response.UserActivityResponse;
import com.yogadetection.dto.response.YogaGroupResponse;
import com.yogadetection.entity.Friendship;
import com.yogadetection.entity.Friendship.FriendshipStatus;
import com.yogadetection.entity.GroupMember;
import com.yogadetection.entity.GroupMember.MemberRole;
import com.yogadetection.entity.User;
import com.yogadetection.entity.UserActivity;
import com.yogadetection.entity.YogaGroup;
import com.yogadetection.exception.EntityNotFoundException;
import com.yogadetection.repository.FriendshipRepository;
import com.yogadetection.repository.GroupMemberRepository;
import com.yogadetection.repository.UserActivityRepository;
import com.yogadetection.repository.UserRepository;
import com.yogadetection.repository.YogaGroupRepository;
import com.yogadetection.service.SocialService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SocialServiceImpl implements SocialService {
    
    private final FriendshipRepository friendshipRepository;
    private final UserRepository userRepository;
    private final YogaGroupRepository groupRepository;
    private final GroupMemberRepository groupMemberRepository;
    private final UserActivityRepository activityRepository;

    @Override
    @Transactional
    public void sendFriendRequest(String userId, String friendEmail) {
        User friend = userRepository.findByEmail(friendEmail)
            .orElseThrow(() -> new EntityNotFoundException("User not found with email: " + friendEmail));
        
        if (userId.equals(friend.getId())) {
            throw new IllegalArgumentException("Cannot send friend request to yourself");
        }
        
        // Check if already friends or request exists
        if (friendshipRepository.findBetweenUsers(userId, friend.getId()).isPresent()) {
            throw new IllegalArgumentException("Friend request already exists or you are already friends");
        }
        
        Friendship friendship = Friendship.builder()
            .userId(userId)
            .friendId(friend.getId())
            .status(FriendshipStatus.PENDING)
            .build();
        
        friendshipRepository.save(friendship);
    }

    @Override
    @Transactional
    public void acceptFriendRequest(String userId, String friendshipId) {
        Friendship friendship = friendshipRepository.findById(friendshipId)
            .orElseThrow(() -> new EntityNotFoundException("Friendship not found"));
        
        if (!friendship.getFriendId().equals(userId)) {
            throw new IllegalArgumentException("You are not authorized to accept this request");
        }
        
        friendship.setStatus(FriendshipStatus.ACCEPTED);
        friendshipRepository.save(friendship);
    }

    @Override
    @Transactional
    public void rejectFriendRequest(String userId, String friendshipId) {
        Friendship friendship = friendshipRepository.findById(friendshipId)
            .orElseThrow(() -> new EntityNotFoundException("Friendship not found"));
        
        if (!friendship.getFriendId().equals(userId)) {
            throw new IllegalArgumentException("You are not authorized to reject this request");
        }
        
        friendshipRepository.delete(friendship);
    }

    @Override
    @Transactional
    public void removeFriend(String userId, String friendshipId) {
        Friendship friendship = friendshipRepository.findById(friendshipId)
            .orElseThrow(() -> new EntityNotFoundException("Friendship not found"));
        
        if (!friendship.getUserId().equals(userId) && !friendship.getFriendId().equals(userId)) {
            throw new IllegalArgumentException("You are not part of this friendship");
        }
        
        friendshipRepository.delete(friendship);
    }

    @Override
    public PagedResponse<FriendResponse> getFriends(String userId, int page, int size) {
        Pageable pageable = PageRequest.of(Math.max(0, page), Math.max(1, size));
        Page<Friendship> friendships = friendshipRepository.findByUserIdAndStatus(userId, FriendshipStatus.ACCEPTED, pageable);
        
        List<FriendResponse> responses = friendships.getContent().stream()
            .map(f -> mapToFriendResponse(f, userId))
            .collect(Collectors.toList());
        
        return PagedResponse.<FriendResponse>builder()
            .items(responses)
            .page(friendships.getNumber())
            .pageSize(friendships.getSize())
            .totalElements(friendships.getTotalElements())
            .totalPages(friendships.getTotalPages())
            .hasNext(friendships.hasNext())
            .hasPrevious(friendships.hasPrevious())
            .build();
    }

    @Override
    public PagedResponse<FriendResponse> getPendingRequests(String userId, int page, int size) {
        Pageable pageable = PageRequest.of(Math.max(0, page), Math.max(1, size));
        Page<Friendship> requests = friendshipRepository.findPendingRequests(userId, pageable);
        
        List<FriendResponse> responses = requests.getContent().stream()
            .map(f -> mapToFriendResponse(f, userId))
            .collect(Collectors.toList());
        
        return PagedResponse.<FriendResponse>builder()
            .items(responses)
            .page(requests.getNumber())
            .pageSize(requests.getSize())
            .totalElements(requests.getTotalElements())
            .totalPages(requests.getTotalPages())
            .hasNext(requests.hasNext())
            .hasPrevious(requests.hasPrevious())
            .build();
    }

    @Override
    @Transactional
    public YogaGroupResponse createGroup(String userId, CreateGroupRequest request) {
        YogaGroup group = YogaGroup.builder()
            .name(request.getName())
            .description(request.getDescription())
            .imageUrl(request.getImageUrl())
            .ownerId(userId)
            .isPrivate(request.getIsPrivate() != null ? request.getIsPrivate() : false)
            .build();
        
        YogaGroup savedGroup = groupRepository.save(group);
        
        // Add owner as member
        GroupMember owner = GroupMember.builder()
            .groupId(savedGroup.getId())
            .userId(userId)
            .role(MemberRole.OWNER)
            .build();
        
        groupMemberRepository.save(owner);
        
        return mapToGroupResponse(savedGroup, userId);
    }

    @Override
    public YogaGroupResponse getGroupById(String groupId, String userId) {
        YogaGroup group = groupRepository.findById(groupId)
            .orElseThrow(() -> new EntityNotFoundException("Group not found"));
        
        return mapToGroupResponse(group, userId);
    }

    @Override
    public PagedResponse<YogaGroupResponse> getPublicGroups(int page, int size, String userId) {
        Pageable pageable = PageRequest.of(Math.max(0, page), Math.max(1, size));
        Page<YogaGroup> groups = groupRepository.findPublicGroups(pageable);
        
        List<YogaGroupResponse> responses = groups.getContent().stream()
            .map(g -> mapToGroupResponse(g, userId))
            .collect(Collectors.toList());
        
        return PagedResponse.<YogaGroupResponse>builder()
            .items(responses)
            .page(groups.getNumber())
            .pageSize(groups.getSize())
            .totalElements(groups.getTotalElements())
            .totalPages(groups.getTotalPages())
            .hasNext(groups.hasNext())
            .hasPrevious(groups.hasPrevious())
            .build();
    }

    @Override
    public PagedResponse<YogaGroupResponse> getMyGroups(String userId, int page, int size) {
        Pageable pageable = PageRequest.of(Math.max(0, page), Math.max(1, size));
        Page<GroupMember> memberships = groupMemberRepository.findByUserIdOrderByJoinedAtDesc(userId, pageable);
        
        List<YogaGroupResponse> responses = memberships.getContent().stream()
            .map(gm -> {
                YogaGroup group = groupRepository.findById(gm.getGroupId()).orElse(null);
                return group != null ? mapToGroupResponse(group, userId) : null;
            })
            .filter(g -> g != null)
            .collect(Collectors.toList());
        
        return PagedResponse.<YogaGroupResponse>builder()
            .items(responses)
            .page(memberships.getNumber())
            .pageSize(memberships.getSize())
            .totalElements(memberships.getTotalElements())
            .totalPages(memberships.getTotalPages())
            .hasNext(memberships.hasNext())
            .hasPrevious(memberships.hasPrevious())
            .build();
    }

    @Override
    public PagedResponse<YogaGroupResponse> searchGroups(String keyword, int page, int size, String userId) {
        Pageable pageable = PageRequest.of(Math.max(0, page), Math.max(1, size));
        Page<YogaGroup> groups = groupRepository.searchGroups(keyword, pageable);
        
        List<YogaGroupResponse> responses = groups.getContent().stream()
            .map(g -> mapToGroupResponse(g, userId))
            .collect(Collectors.toList());
        
        return PagedResponse.<YogaGroupResponse>builder()
            .items(responses)
            .page(groups.getNumber())
            .pageSize(groups.getSize())
            .totalElements(groups.getTotalElements())
            .totalPages(groups.getTotalPages())
            .hasNext(groups.hasNext())
            .hasPrevious(groups.hasPrevious())
            .build();
    }

    @Override
    @Transactional
    public void joinGroup(String userId, String groupId) {
        YogaGroup group = groupRepository.findById(groupId)
            .orElseThrow(() -> new EntityNotFoundException("Group not found"));
        
        if (groupMemberRepository.isMember(groupId, userId)) {
            throw new IllegalArgumentException("You are already a member of this group");
        }
        
        GroupMember member = GroupMember.builder()
            .groupId(groupId)
            .userId(userId)
            .role(MemberRole.MEMBER)
            .build();
        
        groupMemberRepository.save(member);
        
        // Update member count
        group.setMemberCount(group.getMemberCount() + 1);
        groupRepository.save(group);
    }

    @Override
    @Transactional
    public void leaveGroup(String userId, String groupId) {
        YogaGroup group = groupRepository.findById(groupId)
            .orElseThrow(() -> new EntityNotFoundException("Group not found"));
        
        if (group.getOwnerId().equals(userId)) {
            throw new IllegalArgumentException("Group owner cannot leave the group. Please delete the group instead.");
        }
        
        groupMemberRepository.deleteByGroupIdAndUserId(groupId, userId);
        
        // Update member count
        group.setMemberCount(Math.max(1, group.getMemberCount() - 1));
        groupRepository.save(group);
    }

    @Override
    public PagedResponse<UserActivityResponse> getFriendActivities(String userId, int page, int size) {
        // Get friend IDs
        Pageable friendsPageable = PageRequest.of(0, 100); // Get up to 100 friends
        Page<Friendship> friendships = friendshipRepository.findByUserIdAndStatus(userId, FriendshipStatus.ACCEPTED, friendsPageable);
        
        List<String> friendIds = friendships.getContent().stream()
            .map(f -> f.getUserId().equals(userId) ? f.getFriendId() : f.getUserId())
            .collect(Collectors.toList());
        
        if (friendIds.isEmpty()) {
            return PagedResponse.<UserActivityResponse>builder()
                .items(new ArrayList<>())
                .page(0)
                .pageSize(size)
                .totalElements(0L)
                .totalPages(0)
                .hasNext(false)
                .hasPrevious(false)
                .build();
        }
        
        Pageable pageable = PageRequest.of(Math.max(0, page), Math.max(1, size));
        Page<UserActivity> activities = activityRepository.findByUserIdsOrderByCreatedAtDesc(friendIds, pageable);
        
        List<UserActivityResponse> responses = activities.getContent().stream()
            .map(this::mapToActivityResponse)
            .collect(Collectors.toList());
        
        return PagedResponse.<UserActivityResponse>builder()
            .items(responses)
            .page(activities.getNumber())
            .pageSize(activities.getSize())
            .totalElements(activities.getTotalElements())
            .totalPages(activities.getTotalPages())
            .hasNext(activities.hasNext())
            .hasPrevious(activities.hasPrevious())
            .build();
    }

    @Override
    public PagedResponse<UserActivityResponse> getMyActivities(String userId, int page, int size) {
        Pageable pageable = PageRequest.of(Math.max(0, page), Math.max(1, size));
        Page<UserActivity> activities = activityRepository.findByUserIdOrderByCreatedAtDesc(userId, pageable);
        
        List<UserActivityResponse> responses = activities.getContent().stream()
            .map(this::mapToActivityResponse)
            .collect(Collectors.toList());
        
        return PagedResponse.<UserActivityResponse>builder()
            .items(responses)
            .page(activities.getNumber())
            .pageSize(activities.getSize())
            .totalElements(activities.getTotalElements())
            .totalPages(activities.getTotalPages())
            .hasNext(activities.hasNext())
            .hasPrevious(activities.hasPrevious())
            .build();
    }

    private FriendResponse mapToFriendResponse(Friendship friendship, String currentUserId) {
        String friendId = friendship.getUserId().equals(currentUserId) ? friendship.getFriendId() : friendship.getUserId();
        User friend = userRepository.findById(friendId).orElse(null);
        
        if (friend == null) {
            return null;
        }
        
        return FriendResponse.builder()
            .friendshipId(friendship.getId())
            .userId(friend.getId())
            .username(friend.getUsername())
            .email(friend.getEmail())
            .avatarUrl(null) // TODO: Add avatar field to User entity
            .status(friendship.getStatus().name())
            .friendsSince(friendship.getCreatedAt())
            .build();
    }

    private YogaGroupResponse mapToGroupResponse(YogaGroup group, String userId) {
        User owner = userRepository.findById(group.getOwnerId()).orElse(null);
        GroupMember membership = groupMemberRepository.findByGroupIdAndUserId(group.getId(), userId).orElse(null);
        
        return YogaGroupResponse.builder()
            .id(group.getId())
            .name(group.getName())
            .description(group.getDescription())
            .imageUrl(group.getImageUrl())
            .ownerId(group.getOwnerId())
            .ownerName(owner != null ? owner.getUsername() : "Unknown")
            .memberCount(group.getMemberCount())
            .isPrivate(group.getIsPrivate())
            .isMember(membership != null)
            .userRole(membership != null ? membership.getRole().name() : null)
            .createdAt(group.getCreatedAt())
            .updatedAt(group.getUpdatedAt())
            .build();
    }

    private UserActivityResponse mapToActivityResponse(UserActivity activity) {
        User user = userRepository.findById(activity.getUserId()).orElse(null);
        
        return UserActivityResponse.builder()
            .id(activity.getId())
            .userId(activity.getUserId())
            .username(user != null ? user.getUsername() : "Unknown")
            .userAvatarUrl(null) // TODO: Add avatar field to User entity
            .activityType(activity.getActivityType().name())
            .title(activity.getTitle())
            .description(activity.getDescription())
            .createdAt(activity.getCreatedAt())
            .build();
    }
}

