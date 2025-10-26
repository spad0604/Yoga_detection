import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/request/post_yoga_pose_model.dart';
import 'package:flutter_starter/data/repositories/yoga_poses_repository/yoga_poses_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class PostYogaPoseUC extends UseCase<void, PostYogaPoseParams> {
  final YogaPosesRepository _yogaPosesRepository;

  PostYogaPoseUC({required YogaPosesRepository yogaPosesRepository})
      : _yogaPosesRepository = yogaPosesRepository;

  @override
  Future<void> call(PostYogaPoseParams params) async {
    await _yogaPosesRepository.postYogaPose(params.model, params.imagePath);
  }
}

class PostYogaPoseParams {
  final String imagePath;
  final PostYogaPoseModel model;

  PostYogaPoseParams({
    required this.imagePath,
    required this.model,
  });
}
