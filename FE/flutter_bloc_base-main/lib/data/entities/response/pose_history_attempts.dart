import 'package:freezed_annotation/freezed_annotation.dart';

part 'pose_history_attempts.g.dart';
part 'pose_history_attempts.freezed.dart';

@freezed
class PoseHistoryAttempts with _$PoseHistoryAttempts {
  //  "id": "string",
  // "poseCode": "string",
  // "poseName": "string",
  // "imageUrl": "string",
  // "score": 0.1,
  // "feedback": "string",
  // "createdAt": "2025-10-28T15:21:49.094Z"
  const factory PoseHistoryAttempts({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'poseCode') required String poseCode,
    @JsonKey(name: 'poseName') required String poseName,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'score') required double score,
    @JsonKey(name: 'feedback') String? feedback,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
  }) = _PoseHistoryAttempts;
  factory PoseHistoryAttempts.fromJson(Map<String, dynamic> json) =>
      _$PoseHistoryAttemptsFromJson(json);
}
