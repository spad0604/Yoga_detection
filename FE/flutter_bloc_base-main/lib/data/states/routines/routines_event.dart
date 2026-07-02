import 'package:freezed_annotation/freezed_annotation.dart';

part 'routines_event.freezed.dart';

@freezed
class RoutinesEvent with _$RoutinesEvent {
  const factory RoutinesEvent.loadRequested() = RoutinesLoadRequested;
  const factory RoutinesEvent.loadMoreRequested() = RoutinesLoadMoreRequested;
  const factory RoutinesEvent.refreshRequested() = RoutinesRefreshRequested;
  const factory RoutinesEvent.loadInProgressRequested() =
      RoutinesLoadInProgressRequested;
  const factory RoutinesEvent.loadCompletedRequested() =
      RoutinesLoadCompletedRequested;
  const factory RoutinesEvent.searchChanged(String keyword) =
      RoutinesSearchChanged;
  const factory RoutinesEvent.filterChanged({String? level, bool? isPremium}) =
      RoutinesFilterChanged;
}
