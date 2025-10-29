import 'package:freezed_annotation/freezed_annotation.dart';

part 'activities_event.freezed.dart';

@freezed
class ActivitiesEvent with _$ActivitiesEvent {
  const factory ActivitiesEvent.loadFriendActivities() = ActivitiesLoadFriendActivities;
  const factory ActivitiesEvent.loadMyActivities() = ActivitiesLoadMyActivities;
  const factory ActivitiesEvent.refreshFriendActivities() = ActivitiesRefreshFriendActivities;
  const factory ActivitiesEvent.refreshMyActivities() = ActivitiesRefreshMyActivities;
}

