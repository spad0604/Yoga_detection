import 'package:flutter_starter/data/entities/request/post_yoga_pose_model.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/user_yoga_pose_model.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';

abstract class YogaPosesRepository {
  Future<PageResponse<YogaPoseDetails>> getYogaPoses(int page, int size, String keyword);

  Future<YogaPoseDetails> getYogaPoseDetails(String code);

  Future<UserYogaPoseModel> getUserYogaPoseById(String id);

  Future<PageResponse<UserYogaPoseModel>> getUserYogaPosesByDate(
      int page, String startDate, String endDate);

  Future<void> postYogaPose(PostYogaPoseModel model, String imagePath);
}
