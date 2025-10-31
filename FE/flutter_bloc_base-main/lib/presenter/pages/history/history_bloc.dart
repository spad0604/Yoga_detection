import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/data/repositories/practice_session_repository/practice_session_repository.dart';
import 'package:flutter_starter/data/repositories/yoga_poses_repository/yoga_poses_repository.dart';
import 'package:flutter_starter/presenter/pages/history/history_event.dart';
import 'package:flutter_starter/presenter/pages/history/history_state.dart';

@injectable
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final PracticeSessionRepository _sessionRepository;
  final YogaPosesRepository _posesRepository;

  HistoryBloc(this._sessionRepository, this._posesRepository) : super(const HistoryState()) {
    on<HistoryErrorOccurred>(_onErrorOccurred);
    on<HistoryLoadPosesByDate>(_onLoadPosesByDate);
    on<HistoryLoadPoseDetail>(_onLoadPoseDetail);
  }

  Future<void> _onLoadPosesByDate(
    HistoryLoadPosesByDate event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      emit(state.copyWith(status: HistoryStatus.loading));

      // Format dates to ISO 8601 strings
      final startDateStr = event.startDate.toIso8601String();
      final endDateStr = event.endDate.toIso8601String();

      // Load both sessions and individual poses in parallel
      final sessionsResult = await _sessionRepository.getPracticeSessionHistory(
        startDate: startDateStr,
        endDate: endDateStr,
      );
      
      final posesResponse = await _posesRepository.getUserYogaPosesByDate(
        event.page,
        event.startDate,
        event.endDate,
      );

      emit(state.copyWith(
        status: HistoryStatus.success,
        sessions: sessionsResult,
        poses: posesResponse.items,
        currentPage: event.page,
        hasMore: posesResponse.hasNext,
      ));
    } catch (e) {
      add(HistoryErrorOccurred(BaseException.from(e)));
    }
  }

  Future<void> _onLoadPoseDetail(
    HistoryLoadPoseDetail event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      emit(state.copyWith(status: HistoryStatus.loading));

      final pose = await _posesRepository.getUserYogaPoseById(event.poseId);

      emit(state.copyWith(
        status: HistoryStatus.success,
        selectedPose: pose,
      ));
    } catch (e) {
      add(HistoryErrorOccurred(BaseException.from(e)));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(HistoryErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    HistoryErrorOccurred event,
    Emitter<HistoryState> emit,
  ) {
    emit(state.copyWith(
      status: HistoryStatus.failure,
      error: event.error,
    ));
  }
}
