import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

part 'camera_detection_state.freezed.dart';

enum CameraDetectionStatus {
  initial,
  loading,
  success,
  failure,
  uploading,
  uploaded,
}

@freezed
class CameraDetectionState with _$CameraDetectionState {
  const factory CameraDetectionState({
    @Default(CameraDetectionStatus.initial) CameraDetectionStatus status,
    BaseException? error,
    @Default([]) List<Pose> poseList,

    // Socket state
    @Default(false) bool socketConnected,

    // Countdown state
    @Default(false) bool isCountingDown,
    @Default(0) int countdown,

    // Capture state
    @Default(false) bool showResult,
    String? capturedImagePath,
    @Default([]) List<Pose> capturedPoses,

    // Pose result from server
    Map<String, dynamic>? poseResult,
  }) = _CameraDetectionState;
}
