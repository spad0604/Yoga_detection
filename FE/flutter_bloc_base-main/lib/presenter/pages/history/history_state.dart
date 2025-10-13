import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

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
    BaseException? error,
  }) = _HistoryState;
}
