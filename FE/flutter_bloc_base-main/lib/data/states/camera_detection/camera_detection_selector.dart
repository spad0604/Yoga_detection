import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_bloc.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_state.dart';

class CameraDetectionStatusSelector
    extends BlocSelector<CameraDetectionBloc, CameraDetectionState, CameraDetectionStatus> {
  CameraDetectionStatusSelector({
    required Widget Function(CameraDetectionStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class CameraDetectionStatusListener
    extends BlocListener<CameraDetectionBloc, CameraDetectionState> {
  CameraDetectionStatusListener({
    required Iterable<CameraDetectionStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
