import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/data/entities/response/user_yoga_pose_model.dart';

part 'history_state.freezed.dart';

enum HistoryStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default(HistoryStatus.initial) HistoryStatus status,
    @Default([]) List<UserYogaPoseModel> poses,
    @Default(0) int currentPage,
    @Default(false) bool hasMore,
    UserYogaPoseModel? selectedPose,
    BaseException? error,
  }) = _HistoryState;
}
