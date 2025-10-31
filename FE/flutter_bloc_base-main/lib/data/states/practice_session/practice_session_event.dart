import 'package:freezed_annotation/freezed_annotation.dart';

part 'practice_session_event.freezed.dart';

@freezed
class PracticeSessionEvent with _$PracticeSessionEvent {
  const factory PracticeSessionEvent.startSession(String routineId) = PracticeSessionStartSession;
  
  const factory PracticeSessionEvent.submitPose({
    required String poseCode,
    required String imagePath,
    int? timeSpentSeconds,
    String? landmarkData,
  }) = PracticeSessionSubmitPose;
  
  const factory PracticeSessionEvent.skipPose() = PracticeSessionSkipPose;
  
  const factory PracticeSessionEvent.completeSession() = PracticeSessionCompleteSession;
  
  const factory PracticeSessionEvent.abandonSession() = PracticeSessionAbandonSession;
}
