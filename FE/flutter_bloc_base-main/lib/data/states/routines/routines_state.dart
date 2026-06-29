import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/data/entities/response/user_routine_progress.dart';
import 'package:flutter_starter/data/entities/response/yoga_routine.dart';

part 'routines_state.freezed.dart';

@freezed
class RoutinesState with _$RoutinesState {
  const factory RoutinesState({
    @Default([]) List<YogaRoutine> routines,
    @Default([]) List<UserRoutineProgress> inProgressRoutines,
    @Default([]) List<UserRoutineProgress> completedRoutines,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    String? error,
    @Default(0) int currentPage,
    @Default(false) bool hasMore,
  }) = _RoutinesState;
}
