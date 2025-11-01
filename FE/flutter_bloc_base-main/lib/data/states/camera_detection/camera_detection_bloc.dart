import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/data/entities/request/post_yoga_pose_model.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_event.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_state.dart';
import 'package:flutter_starter/data/usecases/post_yoga_pose_uc.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:path_provider/path_provider.dart';

@injectable
class CameraDetectionBloc extends Bloc<CameraDetectionEvent, CameraDetectionState> {
  final PostYogaPoseUC _postYogaPoseUC;
  Timer? _countdownTimer;

  CameraDetectionBloc(this._postYogaPoseUC) : super(const CameraDetectionState()) {
    on<CameraDetectionErrorOccurred>(_onErrorOccurred);
    on<CameraDetectionStart>(_onStart);
    on<CameraDetectionStop>(_onStop);
    on<CameraDetectionPosesUpdated>(_onPosesUpdated);
    on<CameraDetectionInitialize>(_onInitialize);

    // Capture events
    on<CameraDetectionStartCountdown>(_onStartCountdown);
    on<CameraDetectionCountdownTick>(_onCountdownTick);
    on<CameraDetectionCaptureImage>(_onCaptureImage);

    // Upload event
    on<CameraDetectionUploadPose>(_onUploadPose);
    on<CameraDetectionUploadSuccess>(_onUploadSuccess);

    // Reset
    on<CameraDetectionResetToLive>(_onResetToLive);
  }

  FutureOr<void> _onInitialize(
    CameraDetectionInitialize event,
    Emitter<CameraDetectionState> emit,
  ) {
    emit(state.copyWith(
      status: CameraDetectionStatus.initial,
      error: null,
    ));
  }

  FutureOr<void> _onStart(
    CameraDetectionStart event,
    Emitter<CameraDetectionState> emit,
  ) {
    emit(state.copyWith(
      status: CameraDetectionStatus.loading,
      error: null,
    ));
  }

  FutureOr<void> _onStop(
    CameraDetectionStop event,
    Emitter<CameraDetectionState> emit,
  ) {
    emit(state.copyWith(
      status: CameraDetectionStatus.initial,
      error: null,
      poseList: [],
    ));
  }

  FutureOr<void> _onPosesUpdated(
    CameraDetectionPosesUpdated event,
    Emitter<CameraDetectionState> emit,
  ) {
    emit(state.copyWith(
      status: CameraDetectionStatus.success,
      error: null,
      poseList: event.poses,
    ));
  }

  Future<void> _onStartCountdown(
    CameraDetectionStartCountdown event,
    Emitter<CameraDetectionState> emit,
  ) async {
    emit(state.copyWith(isCountingDown: true, countdown: 5));

    // Countdown from 5 to 1
    for (int i = 5; i > 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      add(CameraDetectionEvent.countdownTick(i - 1));
    }
  }

  FutureOr<void> _onCountdownTick(
    CameraDetectionCountdownTick event,
    Emitter<CameraDetectionState> emit,
  ) {
    emit(state.copyWith(countdown: event.remaining));
  }

  FutureOr<void> _onCaptureImage(
    CameraDetectionCaptureImage event,
    Emitter<CameraDetectionState> emit,
  ) {
    emit(state.copyWith(
      isCountingDown: false,
      countdown: 0,
      showResult: true,
      capturedImagePath: event.imagePath,
      capturedPoses: event.poses,
    ));
  }

  Future<void> _onUploadPose(
    CameraDetectionUploadPose event,
    Emitter<CameraDetectionState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CameraDetectionStatus.uploading));

      // Save image to temp file
      final dir = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final imagePath = '${dir.path}${Platform.pathSeparator}pose_image_$timestamp.jpg';
      await File(imagePath).writeAsBytes(event.imageBytes);

      // Convert poses to landmarks
      final landmarks = _convertPosesToLandmarks(event.poses);

      // Create model
      final model = PostYogaPoseModel(
        poseId: event.poseId,
        landmarks: landmarks,
        timestamp: DateTime.now().toIso8601String(),
      );

      // Upload
      await _postYogaPoseUC(PostYogaPoseParams(
        imagePath: imagePath,
        model: model,
      ));

      // Clean up temp file
      try {
        await File(imagePath).delete();
      } catch (_) {}

      add(const CameraDetectionEvent.uploadSuccess());
    } catch (e) {
      add(CameraDetectionEvent.errorOccurred(BaseException.from(e)));
    }
  }

  List<PoseLandmarkData> _convertPosesToLandmarks(List<Pose> poses) {
    if (poses.isEmpty) return [];

    final pose = poses.first;
    final allTypes = PoseLandmarkType.values;

    return allTypes.map((type) {
      final typeName = type.toString().split('.').last;
      final lm = pose.landmarks[type];
      return PoseLandmarkData(
        type: typeName,
        x: lm?.x ?? -1,
        y: lm?.y ?? -1,
        z: lm?.z ?? -1,
      );
    }).toList();
  }

  FutureOr<void> _onUploadSuccess(
    CameraDetectionUploadSuccess event,
    Emitter<CameraDetectionState> emit,
  ) {
    emit(state.copyWith(status: CameraDetectionStatus.uploaded));
  }

  FutureOr<void> _onResetToLive(
    CameraDetectionResetToLive event,
    Emitter<CameraDetectionState> emit,
  ) {
    emit(state.copyWith(
      showResult: false,
      capturedImagePath: null,
      capturedPoses: [],
    ));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(CameraDetectionErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    CameraDetectionErrorOccurred event,
    Emitter<CameraDetectionState> emit,
  ) {
    emit(state.copyWith(
      status: CameraDetectionStatus.failure,
      error: event.error,
      isCountingDown: false,
    ));
  }

  @override
  Future<void> close() {
    _countdownTimer?.cancel();
    return super.close();
  }
}
