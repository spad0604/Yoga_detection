import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

part 'camera_detection_event.freezed.dart';

@freezed
class CameraDetectionEvent with _$CameraDetectionEvent {
  const factory CameraDetectionEvent.initialize() = CameraDetectionInitialize;
  const factory CameraDetectionEvent.start() = CameraDetectionStart;
  const factory CameraDetectionEvent.stop() = CameraDetectionStop;
  const factory CameraDetectionEvent.posesUpdated(List<Pose> poses) = CameraDetectionPosesUpdated;
  const factory CameraDetectionEvent.errorOccurred([BaseException? error]) =
      CameraDetectionErrorOccurred;
}
