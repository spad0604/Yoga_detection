import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'search_yoga_pose_state.freezed.dart';

enum SearchYogaPoseStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class SearchYogaPoseState with _$SearchYogaPoseState {
  const factory SearchYogaPoseState({
    @Default(SearchYogaPoseStatus.initial) SearchYogaPoseStatus status,
    @Default([]) List<YogaPoseDetails> yogaPoses,
    BaseException? error,
  }) = _SearchYogaPoseState;
}
