import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_response.g.dart';
part 'notification_response.freezed.dart';

@freezed
class NotificationResponse with _$NotificationResponse {
  const factory NotificationResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'userId') required String userId,
    @JsonKey(name: 'normalTitle') required String normalTitle,
    @JsonKey(name: 'htmlTitle') String? htmlTitle,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'all') required bool all,
  }) = _NotificationResponse;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
}
