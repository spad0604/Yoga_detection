import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/response/user_routine_progress.dart';
import 'package:flutter_starter/data/repositories/routine_repository/routine_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class StartRoutineUc extends UseCase<UserRoutineProgress, String> {
  final RoutineRepository _repository;

  StartRoutineUc(this._repository);

  @override
  Future<UserRoutineProgress> call(String routineId) {
    return _repository.startOrContinueRoutine(routineId);
  }
}

