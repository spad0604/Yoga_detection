import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/data/entities/response/user_routine_progress.dart';
import 'package:flutter_starter/data/entities/response/yoga_routine.dart';

part 'routine_details_state.freezed.dart';

@freezed
class RoutineDetailsState with _$RoutineDetailsState {
  const factory RoutineDetailsState({
    YogaRoutine? routine,
    UserRoutineProgress? progress,
    @Default(false) bool isLoading,
    @Default(false) bool isStarting,
    String? error,
  }) = _RoutineDetailsState;
}

