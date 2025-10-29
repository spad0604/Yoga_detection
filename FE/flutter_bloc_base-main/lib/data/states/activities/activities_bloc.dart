import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/activities/activities_event.dart';
import 'package:flutter_starter/data/states/activities/activities_state.dart';
import 'package:flutter_starter/data/repositories/social_repository/social_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {
  final SocialRepository _socialRepository;

  ActivitiesBloc(this._socialRepository) : super(const ActivitiesState()) {
    on<ActivitiesLoadFriendActivities>(_onLoadFriendActivities);
    on<ActivitiesLoadMyActivities>(_onLoadMyActivities);
    on<ActivitiesRefreshFriendActivities>(_onRefreshFriendActivities);
    on<ActivitiesRefreshMyActivities>(_onRefreshMyActivities);
  }

  Future<void> _onLoadFriendActivities(
    ActivitiesLoadFriendActivities event,
    Emitter<ActivitiesState> emit,
  ) async {
    emit(state.copyWith(isLoadingFriends: true, error: null));

    try {
      final result = await _socialRepository.getFriendActivities(0, 50);
      emit(state.copyWith(
        friendActivities: result.items,
        isLoadingFriends: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoadingFriends: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onLoadMyActivities(
    ActivitiesLoadMyActivities event,
    Emitter<ActivitiesState> emit,
  ) async {
    emit(state.copyWith(isLoadingMe: true, error: null));

    try {
      final result = await _socialRepository.getMyActivities(0, 50);
      emit(state.copyWith(
        myActivities: result.items,
        isLoadingMe: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoadingMe: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onRefreshFriendActivities(
    ActivitiesRefreshFriendActivities event,
    Emitter<ActivitiesState> emit,
  ) async {
    add(const ActivitiesLoadFriendActivities());
  }

  Future<void> _onRefreshMyActivities(
    ActivitiesRefreshMyActivities event,
    Emitter<ActivitiesState> emit,
  ) async {
    add(const ActivitiesLoadMyActivities());
  }
}

