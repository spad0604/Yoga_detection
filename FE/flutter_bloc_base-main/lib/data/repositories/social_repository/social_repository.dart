import 'package:flutter_starter/data/entities/request/create_group_request.dart';
import 'package:flutter_starter/data/entities/response/friend_response.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/user_activity_response.dart';
import 'package:flutter_starter/data/entities/response/yoga_group_response.dart';

abstract class SocialRepository {
  // Friends
  Future<void> sendFriendRequest(String friendEmail);
  Future<void> acceptFriendRequest(String friendshipId);
  Future<void> rejectFriendRequest(String friendshipId);
  Future<void> removeFriend(String friendshipId);
  Future<PageResponse<FriendResponse>> getFriends(int page, int size);
  Future<PageResponse<FriendResponse>> getPendingFriendRequests(int page, int size);

  // Groups
  Future<YogaGroupResponse> createGroup(CreateGroupRequest request);
  Future<YogaGroupResponse> getGroupById(String groupId);
  Future<PageResponse<YogaGroupResponse>> getPublicGroups(int page, int size);
  Future<PageResponse<YogaGroupResponse>> getMyGroups(int page, int size);
  Future<PageResponse<YogaGroupResponse>> searchGroups(String keyword, int page, int size);
  Future<void> joinGroup(String groupId);
  Future<void> leaveGroup(String groupId);

  // Activities
  Future<PageResponse<UserActivityResponse>> getFriendActivities(int page, int size);
  Future<PageResponse<UserActivityResponse>> getMyActivities(int page, int size);
}

