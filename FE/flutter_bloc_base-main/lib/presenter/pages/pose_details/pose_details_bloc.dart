import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/pages/pose_details/pose_details_event.dart';
import 'package:flutter_starter/presenter/pages/pose_details/pose_details_state.dart';

@injectable
class PoseDetailsBloc extends Bloc<PoseDetailsEvent, PoseDetailsState> {
  PoseDetailsBloc() : super(const PoseDetailsState()) {
    on<PoseDetailsErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(PoseDetailsErrorOccurred(BaseException.from(error)));

    super.onError(error, stackTrace);
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
