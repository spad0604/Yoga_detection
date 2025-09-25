import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_event.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_state.dart';

@injectable
class CameraDetectionBloc extends Bloc<CameraDetectionEvent, CameraDetectionState> {
  CameraDetectionBloc() : super(const CameraDetectionState()) {
    on<CameraDetectionErrorOccurred>(_onErrorOccurred);
    on<CameraDetectionStart>(_onStart);
    on<CameraDetectionStop>(_onStop);
    on<CameraDetectionPosesUpdated>(_onPosesUpdated);
    on<CameraDetectionInitialize>(_onInitialize);
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
    ));
  }
}
