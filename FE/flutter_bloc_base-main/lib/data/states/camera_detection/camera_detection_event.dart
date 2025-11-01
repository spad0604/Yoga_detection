import 'dart:typed_data';
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

  // Capture events
  const factory CameraDetectionEvent.startCountdown() = CameraDetectionStartCountdown;
  const factory CameraDetectionEvent.countdownTick(int remaining) = CameraDetectionCountdownTick;
  const factory CameraDetectionEvent.captureImage({
    required String imagePath,
    required Uint8List imageBytes,
    required List<Pose> poses,
  }) = CameraDetectionCaptureImage;

  // Upload event
  const factory CameraDetectionEvent.uploadPose({
    required String poseId,
    required String imagePath,
    required Uint8List imageBytes,
    required List<Pose> poses,
  }) = CameraDetectionUploadPose;
  const factory CameraDetectionEvent.uploadSuccess() = CameraDetectionUploadSuccess;

  const factory CameraDetectionEvent.errorOccurred([BaseException? error]) =
      CameraDetectionErrorOccurred;

  // Reset to live mode
  const factory CameraDetectionEvent.resetToLive() = CameraDetectionResetToLive;
}
