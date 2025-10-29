import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_routine_progress_request.freezed.dart';
part 'update_routine_progress_request.g.dart';

@freezed
class UpdateRoutineProgressRequest with _$UpdateRoutineProgressRequest {
  const factory UpdateRoutineProgressRequest({
    required String routineId,
    required String completedPoseCode,
    double? poseScore,
    int? timeSpentSeconds,
  }) = _UpdateRoutineProgressRequest;

  factory UpdateRoutineProgressRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateRoutineProgressRequestFromJson(json);
}

