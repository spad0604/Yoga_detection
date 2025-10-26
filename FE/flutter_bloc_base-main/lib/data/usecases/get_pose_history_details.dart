import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/response/user_yoga_pose_model.dart';
import 'package:flutter_starter/data/repositories/yoga_poses_repository/yoga_poses_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetPoseHistoryDetails extends UseCase<UserYogaPoseModel, String> {
  final YogaPosesRepository _yogaPosesRepository;

  GetPoseHistoryDetails({required YogaPosesRepository yogaPosesRepository})
      : _yogaPosesRepository = yogaPosesRepository;

  @override
  Future<UserYogaPoseModel> call(String params) async {
    final res = await _yogaPosesRepository.getUserYogaPoseById(params);
    return res;
  }
}
