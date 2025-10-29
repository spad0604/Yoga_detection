import 'package:flutter_starter/data/entities/request/update_routine_progress_request.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/user_routine_progress.dart';
import 'package:flutter_starter/data/entities/response/yoga_routine.dart';
import 'package:flutter_starter/data/repositories/routine_repository/routine_repository.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: RoutineRepository)
class RoutineRepositoryImpl implements RoutineRepository {
  final NetworkDataSource _networkDataSource;

  RoutineRepositoryImpl({
    required NetworkDataSource networkDataSource,
  }) : _networkDataSource = networkDataSource;

  @override
  Future<PageResponse<YogaRoutine>> getAllRoutines(int page, int size) async {
    try {
      final res = await _networkDataSource.getAllRoutines(page, size);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load routines');
      }
    } catch (e) {
      throw Exception('Failed to load routines: $e');
    }
  }

  @override
  Future<YogaRoutine> getRoutineById(String id) async {
    try {
      final res = await _networkDataSource.getRoutineById(id);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load routine details');
      }
    } catch (e) {
      throw Exception('Failed to load routine details: $e');
    }
  }

  @override
  Future<PageResponse<YogaRoutine>> getRoutinesByLevel(String level, int page, int size) async {
    try {
      final res = await _networkDataSource.getRoutinesByLevel(level, page, size);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load routines by level');
      }
    } catch (e) {
      throw Exception('Failed to load routines by level: $e');
    }
  }

  @override
  Future<PageResponse<YogaRoutine>> searchRoutines(String keyword, int page, int size) async {
    try {
      final res = await _networkDataSource.searchRoutines(keyword, page, size);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to search routines');
      }
    } catch (e) {
      throw Exception('Failed to search routines: $e');
    }
  }

  @override
  Future<PageResponse<YogaRoutine>> filterRoutines({
    String? level,
    bool? isPremium,
    required int page,
    required int size,
  }) async {
    try {
      final res = await _networkDataSource.filterRoutines(
        level: level,
        isPremium: isPremium,
        page: page,
        size: size,
      );
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to filter routines');
      }
    } catch (e) {
      throw Exception('Failed to filter routines: $e');
    }
  }

  @override
  Future<UserRoutineProgress> startOrContinueRoutine(String routineId) async {
    try {
      final res = await _networkDataSource.startOrContinueRoutine(routineId);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to start routine');
      }
    } catch (e) {
      throw Exception('Failed to start routine: $e');
    }
  }

  @override
  Future<UserRoutineProgress> updateProgress(UpdateRoutineProgressRequest request) async {
    try {
      final res = await _networkDataSource.updateRoutineProgress(request);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to update progress');
      }
    } catch (e) {
      throw Exception('Failed to update progress: $e');
    }
  }

  @override
  Future<UserRoutineProgress> getProgress(String routineId) async {
    try {
      final res = await _networkDataSource.getRoutineProgress(routineId);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to get progress');
      }
    } catch (e) {
      throw Exception('Failed to get progress: $e');
    }
  }

  @override
  Future<PageResponse<UserRoutineProgress>> getInProgressRoutines(int page, int size) async {
    try {
      final res = await _networkDataSource.getInProgressRoutines(page, size);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load in-progress routines');
      }
    } catch (e) {
      throw Exception('Failed to load in-progress routines: $e');
    }
  }

  @override
  Future<PageResponse<UserRoutineProgress>> getCompletedRoutines(int page, int size) async {
    try {
      final res = await _networkDataSource.getCompletedRoutines(page, size);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load completed routines');
      }
    } catch (e) {
      throw Exception('Failed to load completed routines: $e');
    }
  }

  @override
  Future<void> resetProgress(String routineId) async {
    try {
      final res = await _networkDataSource.resetRoutineProgress(routineId);
      if (res.code != 200) {
        throw Exception('Failed to reset progress');
      }
    } catch (e) {
      throw Exception('Failed to reset progress: $e');
    }
  }

  @override
  Future<UserRoutineStatistics> getUserStatistics() async {
    try {
      final res = await _networkDataSource.getUserRoutineStatistics();
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to get statistics');
      }
    } catch (e) {
      throw Exception('Failed to get statistics: $e');
    }
  }
}

