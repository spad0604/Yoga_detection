import 'package:freezed_annotation/freezed_annotation.dart';

part 'practice_session.freezed.dart';
part 'practice_session.g.dart';

@freezed
class PracticeSession with _$PracticeSession {
  const factory PracticeSession({
    required String sessionId,
    required String routineId,
    required String routineName,
    required String userId,
    required SessionStatus status,
    required int currentPoseIndex,
    required int totalPoses,
    String? currentPoseCode,
    String? currentPoseName,
    String? currentPoseDescription,
    String? currentPoseImageUrl,
    int? currentPoseDurationSeconds,
    @Default([]) List<RoutinePoseInfo> allPoses,
    @Default([]) List<PoseSubmissionResult> completedPoses,
    @Default(0.0) double averageScore,
    @Default(0) int totalTimeSpentSeconds,
    required DateTime startedAt,
    DateTime? completedAt,
  }) = _PracticeSession;

  factory PracticeSession.fromJson(Map<String, dynamic> json) => _$PracticeSessionFromJson(json);
}

@freezed
class RoutinePoseInfo with _$RoutinePoseInfo {
  const factory RoutinePoseInfo({
    required String poseCode,
    required String poseName,
    required int orderIndex,
    int? durationSeconds,
    String? imageUrl,
    @Default(false) bool isCompleted,
  }) = _RoutinePoseInfo;

  factory RoutinePoseInfo.fromJson(Map<String, dynamic> json) => _$RoutinePoseInfoFromJson(json);
}

@freezed
class PoseSubmissionResult with _$PoseSubmissionResult {
  const factory PoseSubmissionResult({
    required String poseCode,
    required String poseName,
    String? imageUrl,
    @Default(0.0) double score,
    String? feedback,
    @Default(0) int timeSpentSeconds,
    required DateTime submittedAt,
  }) = _PoseSubmissionResult;

  factory PoseSubmissionResult.fromJson(Map<String, dynamic> json) => _$PoseSubmissionResultFromJson(json);
}

enum SessionStatus {
  @JsonValue('IN_PROGRESS')
  inProgress,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('ABANDONED')
  abandoned,
}
