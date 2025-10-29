import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/user_routine_progress.dart';
import 'package:flutter_starter/data/repositories/routine_repository/routine_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetInProgressRoutinesUc extends UseCase<PageResponse<UserRoutineProgress>, PaginationParams> {
  final RoutineRepository _repository;

  GetInProgressRoutinesUc(this._repository);

  @override
  Future<PageResponse<UserRoutineProgress>> call(PaginationParams params) {
    return _repository.getInProgressRoutines(params.page, params.size);
  }
}

@singleton
class GetCompletedRoutinesUc extends UseCase<PageResponse<UserRoutineProgress>, PaginationParams> {
  final RoutineRepository _repository;

  GetCompletedRoutinesUc(this._repository);

  @override
  Future<PageResponse<UserRoutineProgress>> call(PaginationParams params) {
    return _repository.getCompletedRoutines(params.page, params.size);
  }
}

class PaginationParams {
  final int page;
  final int size;

  PaginationParams({
    required this.page,
    required this.size,
  });
}

