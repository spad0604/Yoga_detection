import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'home_page_state.freezed.dart';

enum HomePageStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(HomePageStatus.initial) HomePageStatus status,
    BaseException? error,
  }) = _HomePageState;
}
