import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/presenter/pages/pose_details/pose_details_bloc.dart';
import 'package:flutter_starter/presenter/pages/pose_details/pose_details_state.dart';

class PoseDetailsStatusSelector
    extends BlocSelector<PoseDetailsBloc, PoseDetailsState, PoseDetailsStatus> {
  PoseDetailsStatusSelector({
    required Widget Function(PoseDetailsStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class PoseDetailsStatusListener extends BlocListener<PoseDetailsBloc, PoseDetailsState> {
  PoseDetailsStatusListener({
    required Iterable<PoseDetailsStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
