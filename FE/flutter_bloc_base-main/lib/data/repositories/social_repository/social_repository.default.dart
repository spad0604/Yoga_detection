import 'package:flutter_starter/data/entities/request/create_group_request.dart';
import 'package:flutter_starter/data/entities/response/friend_response.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/user_activity_response.dart';
import 'package:flutter_starter/data/entities/response/yoga_group_response.dart';
import 'package:flutter_starter/data/repositories/social_repository/social_repository.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: SocialRepository)
class SocialRepositoryImpl implements SocialRepository {
  final NetworkDataSource _networkDataSource;

  SocialRepositoryImpl({
    required NetworkDataSource networkDataSource,
  }) : _networkDataSource = networkDataSource;

  @override
  Future<void> sendFriendRequest(String friendEmail) async {
    try {
      final res = await _networkDataSource.sendFriendRequest(friendEmail);
      if (res.code != 200) {
        throw Exception('Failed to send friend request');
      }
    } catch (e) {
      throw Exception('Failed to send friend request: $e');
    }
  }

  @override
  Future<void> acceptFriendRequest(String friendshipId) async {
    try {
      final res = await _networkDataSource.acceptFriendRequest(friendshipId);
      if (res.code != 200) {
        throw Exception('Failed to accept friend request');
      }
    } catch (e) {
      throw Exception('Failed to accept friend request: $e');
    }
  }

  @override
  Future<void> rejectFriendRequest(String friendshipId) async {
    try {
      final res = await _networkDataSource.rejectFriendRequest(friendshipId);
      if (res.code != 200) {
        throw Exception('Failed to reject friend request');
      }
    } catch (e) {
      throw Exception('Failed to reject friend request: $e');
    }
  }

  @override
  Future<void> removeFriend(String friendshipId) async {
    try {
      final res = await _networkDataSource.removeFriend(friendshipId);
      if (res.code != 200) {
        throw Exception('Failed to remove friend');
      }
    } catch (e) {
      throw Exception('Failed to remove friend: $e');
    }
  }

  @override
  Future<PageResponse<FriendResponse>> getFriends(int page, int size) async {
    try {
      final res = await _networkDataSource.getFriends(page, size);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load friends');
      }
    } catch (e) {
      throw Exception('Failed to load friends: $e');
    }
  }

  @override
  Future<PageResponse<FriendResponse>> getPendingFriendRequests(int page, int size) async {
    try {
      final res = await _networkDataSource.getPendingFriendRequests(page, size);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load pending requests');
      }
    } catch (e) {
      throw Exception('Failed to load pending requests: $e');
    }
  }

  @override
  Future<YogaGroupResponse> createGroup(CreateGroupRequest request) async {
    try {
      final res = await _networkDataSource.createGroup(request);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to create group');
      }
    } catch (e) {
      throw Exception('Failed to create group: $e');
    }
  }

  @override
  Future<YogaGroupResponse> getGroupById(String groupId) async {
    try {
      final res = await _networkDataSource.getGroupById(groupId);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load group');
      }
    } catch (e) {
      throw Exception('Failed to load group: $e');
    }
  }

  @override
  Future<PageResponse<YogaGroupResponse>> getPublicGroups(int page, int size) async {
    try {
      final res = await _networkDataSource.getPublicGroups(page, size);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load public groups');
      }
    } catch (e) {
      throw Exception('Failed to load public groups: $e');
    }
  }

  @override
  Future<PageResponse<YogaGroupResponse>> getMyGroups(int page, int size) async {
    try {
      final res = await _networkDataSource.getMyGroups(page, size);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load my groups');
      }
    } catch (e) {
      throw Exception('Failed to load my groups: $e');
    }
  }

  @override
  Future<PageResponse<YogaGroupResponse>> searchGroups(String keyword, int page, int size) async {
    try {
      final res = await _networkDataSource.searchGroups(keyword, page, size);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to search groups');
      }
    } catch (e) {
      throw Exception('Failed to search groups: $e');
    }
  }

  @override
  Future<void> joinGroup(String groupId) async {
    try {
      final res = await _networkDataSource.joinGroup(groupId);
      if (res.code != 200) {
        throw Exception('Failed to join group');
      }
    } catch (e) {
      throw Exception('Failed to join group: $e');
    }
  }

  @override
  Future<void> leaveGroup(String groupId) async {
    try {
      final res = await _networkDataSource.leaveGroup(groupId);
      if (res.code != 200) {
        throw Exception('Failed to leave group');
      }
    } catch (e) {
      throw Exception('Failed to leave group: $e');
    }
  }

  @override
  Future<PageResponse<UserActivityResponse>> getFriendActivities(int page, int size) async {
    try {
      final res = await _networkDataSource.getFriendActivities(page, size);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load friend activities');
      }
    } catch (e) {
      throw Exception('Failed to load friend activities: $e');
    }
  }

  @override
  Future<PageResponse<UserActivityResponse>> getMyActivities(int page, int size) async {
    try {
      final res = await _networkDataSource.getMyActivities(page, size);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load my activities');
      }
    } catch (e) {
      throw Exception('Failed to load my activities: $e');
    }
  }
}

