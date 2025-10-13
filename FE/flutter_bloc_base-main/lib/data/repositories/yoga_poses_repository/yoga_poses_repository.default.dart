import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:flutter_starter/data/repositories/yoga_poses_repository/yoga_poses_repository.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: YogaPosesRepository)
class YogaPosesRepositoryImpl implements YogaPosesRepository {
  final NetworkDataSource _networkDataSource;

  YogaPosesRepositoryImpl({
    required NetworkDataSource networkDataSource,
  }) : _networkDataSource = networkDataSource;

  @override
  Future<YogaPoseDetails> getYogaPoseDetails(String code) async {
    try {
      final res = await _networkDataSource.getYogaPoseDetails(code);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load yoga pose details');
      }
    } catch (e) {
      throw Exception('Failed to load yoga pose details: $e');
    }
  }

  @override
  Future<PageResponse<YogaPoseDetails>> getYogaPoses(int page, int size, String keyword) async {
    try {
      final res = await _networkDataSource.getYogaPoses(page, size, keyword);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load yoga poses');
      }
    } catch (e) {
      throw Exception('Failed to load yoga poses: $e');
    }
  }
}
