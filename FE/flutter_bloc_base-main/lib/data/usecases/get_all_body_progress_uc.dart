import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/response/body_progress_response.dart';
import 'package:flutter_starter/data/repositories/body_progress_repository/body_progress_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetAllBodyProgressUc extends UseCase<List<BodyProgressResponse>, NoParams?> {
  final BodyProgressRepository _repository;

  GetAllBodyProgressUc(this._repository);

  @override
  Future<List<BodyProgressResponse>> call([NoParams? params]) {
    return _repository.getAllUserBodyProgress();
  }
}

