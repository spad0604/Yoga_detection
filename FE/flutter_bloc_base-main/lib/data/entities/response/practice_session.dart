import 'package:freezed_annotation/freezed_annotation.dart';

part 'practice_session.freezed.dart';
part 'practice_session.g.dart';

@freezed
class PracticeSession with _$PracticeSession {
  const factory PracticeSession({
    @JsonKey(name: 'sessionId') required String sessionId,
    @JsonKey(name: 'routineId') required String routineId,
    @JsonKey(name: 'routineName') required String routineName,
    @JsonKey(name: 'userId') required String userId,
    @JsonKey(name: 'status') required SessionStatus status,
    @JsonKey(name: 'currentPoseIndex') required int currentPoseIndex,
    @JsonKey(name: 'totalPoses') required int totalPoses,
    @JsonKey(name: 'currentPoseCode') String? currentPoseCode,
    @JsonKey(name: 'currentPoseName') String? currentPoseName,
    @JsonKey(name: 'currentPoseDescription') String? currentPoseDescription,
    @JsonKey(name: 'currentPoseImageUrl') String? currentPoseImageUrl,
    @JsonKey(name: 'currentPoseDurationSeconds') int? currentPoseDurationSeconds,
    @JsonKey(name: 'allPoses') @Default([]) List<RoutinePoseInfo> allPoses,
    @JsonKey(name: 'completedPoses') @Default([]) List<PoseSubmissionResult> completedPoses,
    @JsonKey(name: 'averageScore') @Default(0.0) double averageScore,
    @JsonKey(name: 'totalTimeSpentSeconds') @Default(0) int totalTimeSpentSeconds,
    @JsonKey(name: 'startedAt') DateTime? startedAt,
    @JsonKey(name: 'completedAt') DateTime? completedAt,
  }) = _PracticeSession;

  factory PracticeSession.fromJson(Map<String, dynamic> json) => _$PracticeSessionFromJson(json);
}

@freezed
class RoutinePoseInfo with _$RoutinePoseInfo {
  const factory RoutinePoseInfo({
    @JsonKey(name: 'poseCode') required String poseCode,
    @JsonKey(name: 'poseName') required String poseName,
    @JsonKey(name: 'orderIndex') required int orderIndex,
    @JsonKey(name: 'durationSeconds') int? durationSeconds,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'isCompleted') @Default(false) bool isCompleted,
  }) = _RoutinePoseInfo;

  factory RoutinePoseInfo.fromJson(Map<String, dynamic> json) => _$RoutinePoseInfoFromJson(json);
}

@freezed
class PoseSubmissionResult with _$PoseSubmissionResult {
  const factory PoseSubmissionResult({
    @JsonKey(name: 'poseCode') required String poseCode,
    @JsonKey(name: 'poseName') required String poseName,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'score') @Default(0.0) double score,
    @JsonKey(name: 'feedback') String? feedback,
    @JsonKey(name: 'timeSpentSeconds') @Default(0) int timeSpentSeconds,
    @JsonKey(name: 'submittedAt') DateTime? submittedAt,
  }) = _PoseSubmissionResult;

  factory PoseSubmissionResult.fromJson(Map<String, dynamic> json) =>
      _$PoseSubmissionResultFromJson(json);
}

enum SessionStatus {
  @JsonValue('IN_PROGRESS')
  inProgress,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('ABANDONED')
  abandoned,
}
