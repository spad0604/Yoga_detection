import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/request/update_routine_progress_request.dart';
import 'package:flutter_starter/data/states/routine_details/routine_details_event.dart';
import 'package:flutter_starter/data/states/routine_details/routine_details_state.dart';
import 'package:flutter_starter/data/usecases/get_routine_details_uc.dart';
import 'package:flutter_starter/data/usecases/start_routine_uc.dart';
import 'package:flutter_starter/data/usecases/update_routine_progress_uc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RoutineDetailsBloc extends Bloc<RoutineDetailsEvent, RoutineDetailsState> {
  final GetRoutineDetailsUc _getRoutineDetailsUc;
  final StartRoutineUc _startRoutineUc;
  final UpdateRoutineProgressUc _updateRoutineProgressUc;

  RoutineDetailsBloc(
    this._getRoutineDetailsUc,
    this._startRoutineUc,
    this._updateRoutineProgressUc,
  ) : super(const RoutineDetailsState()) {
    on<RoutineDetailsLoadRequested>(_onLoadRequested);
    on<RoutineDetailsStartRoutine>(_onStartRoutine);
    on<RoutineDetailsPoseCompleted>(_onPoseCompleted);
  }

  Future<void> _onLoadRequested(
    RoutineDetailsLoadRequested event,
    Emitter<RoutineDetailsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final routine = await _getRoutineDetailsUc(event.routineId);

      emit(state.copyWith(
        routine: routine,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onStartRoutine(
    RoutineDetailsStartRoutine event,
    Emitter<RoutineDetailsState> emit,
  ) async {
    if (state.routine == null) return;

    emit(state.copyWith(isStarting: true, error: null));

    try {
      final progress = await _startRoutineUc(state.routine!.id);

      emit(state.copyWith(
        progress: progress,
        isStarting: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isStarting: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onPoseCompleted(
    RoutineDetailsPoseCompleted event,
    Emitter<RoutineDetailsState> emit,
  ) async {
    if (state.routine == null) return;

    try {
      final request = UpdateRoutineProgressRequest(
        routineId: state.routine!.id,
        completedPoseCode: event.poseCode,
        poseScore: event.score,
        timeSpentSeconds: event.timeSpent,
      );

      final updatedProgress = await _updateRoutineProgressUc(request);

      emit(state.copyWith(progress: updatedProgress));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}

