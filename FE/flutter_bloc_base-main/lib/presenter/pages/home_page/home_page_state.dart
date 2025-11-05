import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'home_page_state.freezed.dart';

enum HomePageStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(HomePageStatus.initial) HomePageStatus status,
    PageResponse<YogaPoseDetails>? yogaPoses,
    @Default('') String chooseYogaPose,
    BaseException? error,
    @Default(1) int currentPage,
    @Default(false) bool hasReachedMax,
  }) = _HomePageState;
}
