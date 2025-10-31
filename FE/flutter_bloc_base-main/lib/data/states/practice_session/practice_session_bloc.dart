import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/response/practice_session.dart';
import 'package:flutter_starter/data/repositories/practice_session_repository/practice_session_repository.dart';
import 'package:flutter_starter/data/states/practice_session/practice_session_event.dart';
import 'package:flutter_starter/data/states/practice_session/practice_session_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class PracticeSessionBloc extends Bloc<PracticeSessionEvent, PracticeSessionState> {
  final PracticeSessionRepository _repository;

  PracticeSessionBloc({
    required PracticeSessionRepository repository,
  })  : _repository = repository,
        super(const PracticeSessionState()) {
    on<PracticeSessionStartSession>(_onStartSession);
    on<PracticeSessionSubmitPose>(_onSubmitPose);
    on<PracticeSessionSkipPose>(_onSkipPose);
    on<PracticeSessionCompleteSession>(_onCompleteSession);
    on<PracticeSessionAbandonSession>(_onAbandonSession);
  }

  Future<void> _onStartSession(
    PracticeSessionStartSession event,
    Emitter<PracticeSessionState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final session = await _repository.startSession(event.routineId);
      
      emit(state.copyWith(
        session: session,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onSubmitPose(
    PracticeSessionSubmitPose event,
    Emitter<PracticeSessionState> emit,
  ) async {
    if (state.session == null) return;

    emit(state.copyWith(isSubmitting: true, error: null, lastSubmission: null));

    try {
      final session = await _repository.submitPose(
        sessionId: state.session!.sessionId,
        poseCode: event.poseCode,
        imageFile: File(event.imagePath),
        timeSpentSeconds: event.timeSpentSeconds,
        landmarkData: event.landmarkData,
      );
      
      // Get the last submission (the one just submitted)
      PoseSubmissionResult? lastSubmission;
      if (session.completedPoses.isNotEmpty) {
        lastSubmission = session.completedPoses.last;
      }
      
      emit(state.copyWith(
        session: session,
        isSubmitting: false,
        lastSubmission: lastSubmission,
      ));
    } catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onSkipPose(
    PracticeSessionSkipPose event,
    Emitter<PracticeSessionState> emit,
  ) async {
    if (state.session == null) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final session = await _repository.skipPose(state.session!.sessionId);
      
      emit(state.copyWith(
        session: session,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onCompleteSession(
    PracticeSessionCompleteSession event,
    Emitter<PracticeSessionState> emit,
  ) async {
    if (state.session == null) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final session = await _repository.completeSession(state.session!.sessionId);
      
      emit(state.copyWith(
        session: session,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onAbandonSession(
    PracticeSessionAbandonSession event,
    Emitter<PracticeSessionState> emit,
  ) async {
    if (state.session == null) return;

    try {
      await _repository.abandonSession(state.session!.sessionId);
      
      emit(state.copyWith(session: null));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
