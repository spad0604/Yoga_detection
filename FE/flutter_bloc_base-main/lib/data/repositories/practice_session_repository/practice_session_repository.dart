import 'dart:io';
import 'package:flutter_starter/data/entities/response/practice_session.dart';

abstract class PracticeSessionRepository {
  Future<PracticeSession> startSession(String routineId);
  
  Future<PracticeSession> getSession(String sessionId);
  
  Future<PracticeSession> submitPose({
    required String sessionId,
    required String poseCode,
    required File imageFile,
    int? timeSpentSeconds,
    String? landmarkData,
  });
  
  Future<PracticeSession> skipPose(String sessionId);
  
  Future<PracticeSession> completeSession(String sessionId);
  
  Future<void> abandonSession(String sessionId);
  
  Future<List<PracticeSession>> getPracticeSessionHistory({
    String? startDate,
    String? endDate,
  });
  
  Future<PracticeSession> getPracticeSession(String sessionId);
}
