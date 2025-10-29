import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/data/entities/response/user_activity_response.dart';

part 'activities_state.freezed.dart';

@freezed
class ActivitiesState with _$ActivitiesState {
  const factory ActivitiesState({
    @Default([]) List<UserActivityResponse> friendActivities,
    @Default([]) List<UserActivityResponse> myActivities,
    @Default(false) bool isLoadingFriends,
    @Default(false) bool isLoadingMe,
    String? error,
  }) = _ActivitiesState;
}

