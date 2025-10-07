import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:flutter_starter/data/repositories/yoga_poses_repository/yoga_poses_repository.dart';

class GetYogaPoseDetailsUc extends UseCase<YogaPoseDetails, String> {
  final YogaPosesRepository _repository;

  GetYogaPoseDetailsUc(this._repository);

  @override
  Future<YogaPoseDetails> call(String params) {
    return _repository.getYogaPoseDetails(params);
  }
}
