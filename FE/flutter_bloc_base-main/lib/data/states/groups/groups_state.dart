import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/data/entities/response/yoga_group_response.dart';

part 'groups_state.freezed.dart';

@freezed
class GroupsState with _$GroupsState {
  const factory GroupsState({
    @Default([]) List<YogaGroupResponse> myGroups,
    @Default([]) List<YogaGroupResponse> publicGroups,
    @Default([]) List<YogaGroupResponse> searchResults,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingPublic,
    @Default(false) bool isSearching,
    String? error,
    String? searchKeyword,
  }) = _GroupsState;
}

