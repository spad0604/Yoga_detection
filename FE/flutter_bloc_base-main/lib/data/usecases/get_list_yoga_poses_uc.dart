import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:flutter_starter/data/repositories/yoga_poses_repository/yoga_poses_repository.dart';

class GetListYogaPosesUc extends UseCase<List<YogaPoseDetails>, GetListYogaPosesParams> {
  final YogaPosesRepository _repository;

  GetListYogaPosesUc(this._repository);

  @override
  Future<List<YogaPoseDetails>> call(GetListYogaPosesParams params) {
    return _repository.getYogaPoses(params.page, params.size, params.keyword);
  }
}

class GetListYogaPosesParams {
  final int page;
  final int size;
  final String keyword;

  GetListYogaPosesParams({
    required this.page,
    required this.size,
    required this.keyword,
  });
}
