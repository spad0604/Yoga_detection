import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/groups/groups_event.dart';
import 'package:flutter_starter/data/states/groups/groups_state.dart';
import 'package:flutter_starter/data/repositories/social_repository/social_repository.dart';
import 'package:flutter_starter/data/entities/request/create_group_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final SocialRepository _socialRepository;

  GroupsBloc(this._socialRepository) : super(const GroupsState()) {
    on<GroupsLoadMyGroups>(_onLoadMyGroups);
    on<GroupsLoadPublicGroups>(_onLoadPublicGroups);
    on<GroupsRefreshMyGroups>(_onRefreshMyGroups);
    on<GroupsRefreshPublicGroups>(_onRefreshPublicGroups);
    on<GroupsSearchGroups>(_onSearchGroups);
    on<GroupsCreateGroup>(_onCreateGroup);
    on<GroupsJoinGroup>(_onJoinGroup);
    on<GroupsLeaveGroup>(_onLeaveGroup);
  }

  Future<void> _onLoadMyGroups(
    GroupsLoadMyGroups event,
    Emitter<GroupsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final result = await _socialRepository.getMyGroups(0, 50);
      emit(state.copyWith(
        myGroups: result.items,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onLoadPublicGroups(
    GroupsLoadPublicGroups event,
    Emitter<GroupsState> emit,
  ) async {
    emit(state.copyWith(isLoadingPublic: true, error: null));

    try {
      final result = await _socialRepository.getPublicGroups(0, 50);
      emit(state.copyWith(
        publicGroups: result.items,
        isLoadingPublic: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoadingPublic: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onRefreshMyGroups(
    GroupsRefreshMyGroups event,
    Emitter<GroupsState> emit,
  ) async {
    add(const GroupsLoadMyGroups());
  }

  Future<void> _onRefreshPublicGroups(
    GroupsRefreshPublicGroups event,
    Emitter<GroupsState> emit,
  ) async {
    add(const GroupsLoadPublicGroups());
  }

  Future<void> _onSearchGroups(
    GroupsSearchGroups event,
    Emitter<GroupsState> emit,
  ) async {
    if (event.keyword.isEmpty) {
      emit(state.copyWith(searchResults: [], searchKeyword: null));
      return;
    }

    emit(state.copyWith(isSearching: true, searchKeyword: event.keyword));

    try {
      final result = await _socialRepository.searchGroups(event.keyword, 0, 50);
      emit(state.copyWith(
        searchResults: result.items,
        isSearching: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isSearching: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onCreateGroup(
    GroupsCreateGroup event,
    Emitter<GroupsState> emit,
  ) async {
    try {
      final request = CreateGroupRequest(
        name: event.name,
        description: event.description,
        imageUrl: event.imageUrl,
        isPrivate: event.isPrivate,
      );

      await _socialRepository.createGroup(request);
      // Refresh my groups
      add(const GroupsLoadMyGroups());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onJoinGroup(
    GroupsJoinGroup event,
    Emitter<GroupsState> emit,
  ) async {
    try {
      await _socialRepository.joinGroup(event.groupId);
      // Refresh both lists
      add(const GroupsLoadMyGroups());
      add(const GroupsLoadPublicGroups());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onLeaveGroup(
    GroupsLeaveGroup event,
    Emitter<GroupsState> emit,
  ) async {
    try {
      await _socialRepository.leaveGroup(event.groupId);
      // Refresh my groups
      add(const GroupsLoadMyGroups());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}

