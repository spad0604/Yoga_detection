import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

part 'camera_detection_state.freezed.dart';

enum CameraDetectionStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class CameraDetectionState with _$CameraDetectionState {
  const factory CameraDetectionState({
    @Default(CameraDetectionStatus.initial) CameraDetectionStatus status,
    BaseException? error,
    @Default([]) List<Pose> poseList,
  }) = _CameraDetectionState;
}
