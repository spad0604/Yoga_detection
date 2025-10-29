import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/request/update_routine_progress_request.dart';
import 'package:flutter_starter/data/entities/response/user_routine_progress.dart';
import 'package:flutter_starter/data/repositories/routine_repository/routine_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class UpdateRoutineProgressUc extends UseCase<UserRoutineProgress, UpdateRoutineProgressRequest> {
  final RoutineRepository _repository;

  UpdateRoutineProgressUc(this._repository);

  @override
  Future<UserRoutineProgress> call(UpdateRoutineProgressRequest request) {
    return _repository.updateProgress(request);
  }
}

