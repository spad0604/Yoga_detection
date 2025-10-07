import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'pose_details_state.freezed.dart';

enum PoseDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class PoseDetailsState with _$PoseDetailsState {
  const factory PoseDetailsState({
    @Default(PoseDetailsStatus.initial) PoseDetailsStatus status,
    YogaPoseDetails? yogaPoseDetails,
    BaseException? error,
  }) = _PoseDetailsState;
}
