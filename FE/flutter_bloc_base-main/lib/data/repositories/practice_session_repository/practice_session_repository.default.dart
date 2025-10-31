import 'dart:io';
import 'package:flutter_starter/data/entities/response/practice_session.dart';
import 'package:flutter_starter/data/repositories/practice_session_repository/practice_session_repository.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PracticeSessionRepository)
class PracticeSessionRepositoryImpl implements PracticeSessionRepository {
  final NetworkDataSource _networkDataSource;

  PracticeSessionRepositoryImpl({
    required NetworkDataSource networkDataSource,
  }) : _networkDataSource = networkDataSource;

  @override
  Future<PracticeSession> startSession(String routineId) async {
    try {
      final res = await _networkDataSource.startPracticeSession(routineId);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to start practice session');
      }
    } catch (e) {
      throw Exception('Failed to start practice session: $e');
    }
  }

  @override
  Future<PracticeSession> getSession(String sessionId) async {
    try {
      final res = await _networkDataSource.getPracticeSession(sessionId);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to get practice session');
      }
    } catch (e) {
      throw Exception('Failed to get practice session: $e');
    }
  }

  @override
  Future<PracticeSession> submitPose({
    required String sessionId,
    required String poseCode,
    required File imageFile,
    int? timeSpentSeconds,
    String? landmarkData,
  }) async {
    try {
      final res = await _networkDataSource.submitPoseInSession(
        sessionId: sessionId,
        poseCode: poseCode,
        imageFile: imageFile,
        timeSpentSeconds: timeSpentSeconds,
        landmarkData: landmarkData,
      );
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to submit pose');
      }
    } catch (e) {
      throw Exception('Failed to submit pose: $e');
    }
  }

  @override
  Future<PracticeSession> skipPose(String sessionId) async {
    try {
      final res = await _networkDataSource.skipPoseInSession(sessionId);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to skip pose');
      }
    } catch (e) {
      throw Exception('Failed to skip pose: $e');
    }
  }

  @override
  Future<PracticeSession> completeSession(String sessionId) async {
    try {
      final res = await _networkDataSource.completePracticeSession(sessionId);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to complete session');
      }
    } catch (e) {
      throw Exception('Failed to complete session: $e');
    }
  }

  @override
  Future<void> abandonSession(String sessionId) async {
    try {
      final res = await _networkDataSource.abandonPracticeSession(sessionId);
      if (res.code != 200) {
        throw Exception('Failed to abandon session');
      }
    } catch (e) {
      throw Exception('Failed to abandon session: $e');
    }
  }

  @override
  Future<List<PracticeSession>> getPracticeSessionHistory({
    String? startDate,
    String? endDate,
  }) async {
    try {
      final res = await _networkDataSource.getPracticeSessionHistory(
        startDate: startDate,
        endDate: endDate,
      );
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to get practice session history');
      }
    } catch (e) {
      throw Exception('Failed to get practice session history: $e');
    }
  }

  @override
  Future<PracticeSession> getPracticeSession(String sessionId) async {
    return getSession(sessionId);
  }
}
