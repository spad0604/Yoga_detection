import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/request/create_body_progress_request.dart';
import 'package:flutter_starter/data/entities/response/body_progress_response.dart';
import 'package:flutter_starter/data/repositories/body_progress_repository/body_progress_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class CreateBodyProgressUc extends UseCase<BodyProgressResponse, CreateBodyProgressRequest> {
  final BodyProgressRepository _repository;

  CreateBodyProgressUc(this._repository);

  @override
  Future<BodyProgressResponse> call(CreateBodyProgressRequest params) {
    return _repository.createBodyProgress(params);
  }
}

