import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/data/entities/response/friend_response.dart';

part 'friends_state.freezed.dart';

@freezed
class FriendsState with _$FriendsState {
  const factory FriendsState({
    @Default([]) List<FriendResponse> friends,
    @Default([]) List<FriendResponse> pendingRequests,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingPending,
    String? error,
  }) = _FriendsState;
}

