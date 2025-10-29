import 'package:freezed_annotation/freezed_annotation.dart';

part 'friends_event.freezed.dart';

@freezed
class FriendsEvent with _$FriendsEvent {
  const factory FriendsEvent.loadFriends() = FriendsLoadFriends;
  const factory FriendsEvent.loadPendingRequests() = FriendsLoadPendingRequests;
  const factory FriendsEvent.refreshFriends() = FriendsRefreshFriends;
  const factory FriendsEvent.refreshPendingRequests() = FriendsRefreshPendingRequests;
  const factory FriendsEvent.sendFriendRequest(String email) = FriendsSendFriendRequest;
  const factory FriendsEvent.acceptRequest(String friendshipId) = FriendsAcceptRequest;
  const factory FriendsEvent.rejectRequest(String friendshipId) = FriendsRejectRequest;
  const factory FriendsEvent.removeFriend(String friendshipId) = FriendsRemoveFriend;
}

