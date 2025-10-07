import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
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
    @Default([]) List<YogaPoseDetails> yogaPoses,
    @Default('') String chooseYogaPose,
    BaseException? error,
  }) = _HomePageState;
}
