import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/usecases/get_yoga_poses_details.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/pages/pose_details/pose_details_event.dart';
import 'package:flutter_starter/presenter/pages/pose_details/pose_details_state.dart';

@injectable
class PoseDetailsBloc extends Bloc<PoseDetailsEvent, PoseDetailsState> {
  final GetYogaPoseDetailsUc _getYogaPoseDetails;

  PoseDetailsBloc({
    required GetYogaPoseDetailsUc getYogaPoseDetails,
  })  : _getYogaPoseDetails = getYogaPoseDetails,
        super(const PoseDetailsState()) {
    on<PoseDetailsErrorOccurred>(_onErrorOccurred);

    on<PoseDetailsGetDetails>(_onStarted);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(PoseDetailsErrorOccurred(BaseException.from(error)));

    super.onError(error, stackTrace);
  }

  FutureOr<void> _onStarted(
    PoseDetailsGetDetails event,
    Emitter<PoseDetailsState> emit,
  ) {
    emit(state.copyWith(status: PoseDetailsStatus.loading));

    _getYogaPoseDetails(event.code).then((yogaPoseDetails) {
      emit(state.copyWith(
        status: PoseDetailsStatus.success,
        yogaPoseDetails: yogaPoseDetails,
      ));
    }).catchError((error) {
      emit(state.copyWith(
        status: PoseDetailsStatus.failure,
        error: BaseException.from(error),
      ));
    });
  }

  FutureOr<void> _onErrorOccurred(
    PoseDetailsErrorOccurred event,
    Emitter<PoseDetailsState> emit,
  ) {
    emit(state.copyWith(
      status: PoseDetailsStatus.failure,
      error: event.error,
    ));
  }
}
