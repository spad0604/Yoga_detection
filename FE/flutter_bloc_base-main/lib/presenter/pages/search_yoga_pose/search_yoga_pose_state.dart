import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'search_yoga_pose_state.freezed.dart';

enum SearchYogaPoseStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

@freezed
class SearchYogaPoseState with _$SearchYogaPoseState {
  const factory SearchYogaPoseState({
    @Default(SearchYogaPoseStatus.initial) SearchYogaPoseStatus status,
    @Default([]) List<YogaPoseDetails> yogaPoses,
    @Default(0) int currentPage,
    @Default(false) bool hasReachedMax,
    BaseException? error,
  }) = _SearchYogaPoseState;
}
