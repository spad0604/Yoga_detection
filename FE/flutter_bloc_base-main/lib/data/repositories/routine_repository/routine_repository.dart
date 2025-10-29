import 'package:flutter_starter/data/entities/request/update_routine_progress_request.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/user_routine_progress.dart';
import 'package:flutter_starter/data/entities/response/yoga_routine.dart';

abstract class RoutineRepository {
  // Routine endpoints
  Future<PageResponse<YogaRoutine>> getAllRoutines(int page, int size);
  
  Future<YogaRoutine> getRoutineById(String id);
  
  Future<PageResponse<YogaRoutine>> getRoutinesByLevel(String level, int page, int size);
  
  Future<PageResponse<YogaRoutine>> searchRoutines(String keyword, int page, int size);
  
  Future<PageResponse<YogaRoutine>> filterRoutines({
    String? level,
    bool? isPremium,
    required int page,
    required int size,
  });

  // Progress endpoints
  Future<UserRoutineProgress> startOrContinueRoutine(String routineId);
  
  Future<UserRoutineProgress> updateProgress(UpdateRoutineProgressRequest request);
  
  Future<UserRoutineProgress> getProgress(String routineId);
  
  Future<PageResponse<UserRoutineProgress>> getInProgressRoutines(int page, int size);
  
  Future<PageResponse<UserRoutineProgress>> getCompletedRoutines(int page, int size);
  
  Future<void> resetProgress(String routineId);
  
  Future<UserRoutineStatistics> getUserStatistics();
}

