import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/response/yoga_routine.dart';
import 'package:flutter_starter/data/repositories/routine_repository/routine_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetRoutineDetailsUc extends UseCase<YogaRoutine, String> {
  final RoutineRepository _repository;

  GetRoutineDetailsUc(this._repository);

  @override
  Future<YogaRoutine> call(String routineId) {
    return _repository.getRoutineById(routineId);
  }
}

