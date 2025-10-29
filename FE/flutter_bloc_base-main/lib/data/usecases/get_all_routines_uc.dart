import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/yoga_routine.dart';
import 'package:flutter_starter/data/repositories/routine_repository/routine_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetAllRoutinesUc extends UseCase<PageResponse<YogaRoutine>, GetAllRoutinesParams> {
  final RoutineRepository _repository;

  GetAllRoutinesUc(this._repository);

  @override
  Future<PageResponse<YogaRoutine>> call(GetAllRoutinesParams params) {
    return _repository.getAllRoutines(params.page, params.size);
  }
}

class GetAllRoutinesParams {
  final int page;
  final int size;

  GetAllRoutinesParams({
    required this.page,
    required this.size,
  });
}

