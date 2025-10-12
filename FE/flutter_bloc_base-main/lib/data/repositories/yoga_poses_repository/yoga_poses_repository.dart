import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';

abstract class YogaPosesRepository {
  Future<PageResponse<YogaPoseDetails>> getYogaPoses(int page, int size, String keyword);

  Future<YogaPoseDetails> getYogaPoseDetails(String code);
}
