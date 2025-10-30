import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_response.freezed.dart';
part 'friend_response.g.dart';

@freezed
class FriendResponse with _$FriendResponse {
  const factory FriendResponse({
    @JsonKey(name: 'friendshipId') required String friendshipId,
    @JsonKey(name: 'userId') required String userId,
    required String username,
    required String email,
    @JsonKey(name: 'avatarUrl') String? avatarUrl,
    String? status,
    @JsonKey(name: 'friendsSince') DateTime? friendsSince,
    @JsonKey(name: 'totalPosesCompleted') int? totalPosesCompleted,
    @JsonKey(name: 'totalRoutinesCompleted') int? totalRoutinesCompleted,
    @JsonKey(name: 'averageScore') double? averageScore,
    @JsonKey(name: 'currentStreak') int? currentStreak,
  }) = _FriendResponse;

  factory FriendResponse.fromJson(Map<String, dynamic> json) => _$FriendResponseFromJson(json);
}
