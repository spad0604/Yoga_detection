import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_routine_progress.freezed.dart';
part 'user_routine_progress.g.dart';

@freezed
class UserRoutineProgress with _$UserRoutineProgress {
  const factory UserRoutineProgress({
    required String id,
    required String userId,
    required String routineId,
    String? routineName,
    String? routineImageUrl,
    @Default([]) List<String> completedPoses,
    required int totalPoses,
    @Default(0) int currentPoseIndex,
    @Default(false) bool isCompleted,
    @Default(0.0) double completionPercentage,
    @Default(0) int totalTimeSpentSeconds,
    double? averageScore,
    DateTime? lastPracticedAt,
    DateTime? completedAt,
    DateTime? createdAt,
  }) = _UserRoutineProgress;

  factory UserRoutineProgress.fromJson(Map<String, dynamic> json) =>
      _$UserRoutineProgressFromJson(json);
}

@freezed
class UserRoutineStatistics with _$UserRoutineStatistics {
  const factory UserRoutineStatistics({
    @Default(0) int totalCompletedRoutines,
    @Default(0.0) double averageScore,
    @Default(0) int totalTimeSpentMinutes,
    @Default(0) int inProgressRoutines,
  }) = _UserRoutineStatistics;

  factory UserRoutineStatistics.fromJson(Map<String, dynamic> json) =>
      _$UserRoutineStatisticsFromJson(json);
}

