import 'package:freezed_annotation/freezed_annotation.dart';

part 'routine_details_event.freezed.dart';

@freezed
class RoutineDetailsEvent with _$RoutineDetailsEvent {
  const factory RoutineDetailsEvent.loadRequested(String routineId) = RoutineDetailsLoadRequested;
  const factory RoutineDetailsEvent.startRoutine() = RoutineDetailsStartRoutine;
  const factory RoutineDetailsEvent.poseCompleted({
    required String poseCode,
    required double score,
    required int timeSpent,
  }) = RoutineDetailsPoseCompleted;
}

