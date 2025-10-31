import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/data/entities/response/practice_session.dart';

part 'practice_session_state.freezed.dart';

@freezed
class PracticeSessionState with _$PracticeSessionState {
  const factory PracticeSessionState({
    PracticeSession? session,
    @Default(false) bool isLoading,
    @Default(false) bool isSubmitting,
    String? error,
    PoseSubmissionResult? lastSubmission,
  }) = _PracticeSessionState;
}
