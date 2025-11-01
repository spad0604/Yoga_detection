import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_response.g.dart';
part 'notification_response.freezed.dart';

@freezed
class NotificationResponse with _$NotificationResponse {
  const factory NotificationResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'all') required bool isAll,
    @JsonKey(name: 'userId') required String userId,
    @JsonKey(name: 'normalTitle') required String normalTitle,
    @JsonKey(name: 'htmlTitle') String? htmlTitle,
    @JsonKey(name: 'normalBody') String? normalBody,
    @JsonKey(name: 'htmlBody') String? htmlBody,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'referenceId') String? referenceId,
    @JsonKey(name: 'isRead') @Default(false) bool isRead,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
  }) = _NotificationResponse;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
}
