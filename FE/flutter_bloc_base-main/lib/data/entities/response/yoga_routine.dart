import 'package:freezed_annotation/freezed_annotation.dart';

part 'yoga_routine.freezed.dart';
part 'yoga_routine.g.dart';

@freezed
class YogaRoutine with _$YogaRoutine {
  const factory YogaRoutine({
    required String id,
    required String name,
    String? description,
    String? level,
    int? durationMinutes,
    int? estimatedCalories,
    String? imageUrl,
    List<String>? tags,
    @Default(false) bool isPremium,
    int? totalPoses,
    List<RoutinePose>? poses,
    UserRoutineProgressInfo? userProgress,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _YogaRoutine;

  factory YogaRoutine.fromJson(Map<String, dynamic> json) =>
      _$YogaRoutineFromJson(json);
}

@freezed
class RoutinePose with _$RoutinePose {
  const factory RoutinePose({
    required String id,
    required String poseCode,
    String? poseName,
    required int orderIndex,
    int? durationSeconds,
    @Default(1) int repetitions,
    @Default(5) int restAfterSeconds,
    String? instructions,
    String? poseImageUrl,
    String? poseDescription,
  }) = _RoutinePose;

  factory RoutinePose.fromJson(Map<String, dynamic> json) =>
      _$RoutinePoseFromJson(json);
}

@freezed
class UserRoutineProgressInfo with _$UserRoutineProgressInfo {
  const factory UserRoutineProgressInfo({
    @Default(0.0) double completionPercentage,
    @Default(false) bool isCompleted,
    @Default(0) int currentPoseIndex,
    DateTime? lastPracticedAt,
    double? averageScore,
  }) = _UserRoutineProgressInfo;

  factory UserRoutineProgressInfo.fromJson(Map<String, dynamic> json) =>
      _$UserRoutineProgressInfoFromJson(json);
}

