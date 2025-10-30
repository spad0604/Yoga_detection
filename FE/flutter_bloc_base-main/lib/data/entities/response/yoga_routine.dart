import 'package:freezed_annotation/freezed_annotation.dart';

part 'yoga_routine.freezed.dart';
part 'yoga_routine.g.dart';

@freezed
class YogaRoutine with _$YogaRoutine {
  const factory YogaRoutine({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'level') String? level,
    @JsonKey(name: 'durationMinutes') int? durationMinutes,
    @JsonKey(name: 'estimatedCalories') int? estimatedCalories,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'tags') List<String>? tags,
    @JsonKey(name: 'isPremium') @Default(false) bool isPremium,
    @JsonKey(name: 'totalPoses') int? totalPoses,
    @JsonKey(name: 'poses') List<RoutinePose>? poses,
    @JsonKey(name: 'userProgress') UserRoutineProgressInfo? userProgress,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  }) = _YogaRoutine;

  factory YogaRoutine.fromJson(Map<String, dynamic> json) => _$YogaRoutineFromJson(json);
}

@freezed
class RoutinePose with _$RoutinePose {
  const factory RoutinePose({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'poseCode') required String poseCode,
    @JsonKey(name: 'poseName') String? poseName,
    @JsonKey(name: 'orderIndex') required int orderIndex,
    @JsonKey(name: 'durationSeconds') int? durationSeconds,
    @JsonKey(name: 'repetitions') @Default(1) int repetitions,
    @JsonKey(name: 'restAfterSeconds') @Default(5) int restAfterSeconds,
    String? instructions,
    String? poseImageUrl,
    String? poseDescription,
  }) = _RoutinePose;

  factory RoutinePose.fromJson(Map<String, dynamic> json) => _$RoutinePoseFromJson(json);
}

@freezed
class UserRoutineProgressInfo with _$UserRoutineProgressInfo {
  const factory UserRoutineProgressInfo({
    @JsonKey(name: 'completionPercentage') @Default(0.0) double completionPercentage,
    @JsonKey(name: 'isCompleted') @Default(false) bool isCompleted,
    @JsonKey(name: 'currentPoseIndex') @Default(0) int currentPoseIndex,
    @JsonKey(name: 'lastPracticedAt') DateTime? lastPracticedAt,
    @JsonKey(name: 'averageScore') double? averageScore,
  }) = _UserRoutineProgressInfo;

  factory UserRoutineProgressInfo.fromJson(Map<String, dynamic> json) =>
      _$UserRoutineProgressInfoFromJson(json);
}
