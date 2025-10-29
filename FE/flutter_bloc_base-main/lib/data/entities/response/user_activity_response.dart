import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_activity_response.freezed.dart';
part 'user_activity_response.g.dart';

@freezed
class UserActivityResponse with _$UserActivityResponse {
  const factory UserActivityResponse({
    required String id,
    required String userId,
    required String username,
    String? userAvatarUrl,
    required String activityType,
    required String title,
    String? description,
    Map<String, dynamic>? metadata,
    required DateTime createdAt,
  }) = _UserActivityResponse;

  factory UserActivityResponse.fromJson(Map<String, dynamic> json) =>
      _$UserActivityResponseFromJson(json);
}

