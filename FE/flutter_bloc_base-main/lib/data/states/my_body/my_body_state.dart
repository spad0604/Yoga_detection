import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/data/entities/response/body_progress_response.dart';

part 'my_body_state.freezed.dart';

@freezed
class MyBodyState with _$MyBodyState {
  const factory MyBodyState({
    @Default([]) List<BodyProgressResponse> bodyProgressList,
    BodyProgressResponse? latestProgress,
    @Default(false) bool isLoading,
    @Default(false) bool isCreating,
    String? error,
  }) = _MyBodyState;
}

