import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:flutter_starter/data/repositories/yoga_poses_repository/yoga_poses_repository.dart';
import 'package:flutter_starter/data/sources/network/network.dart';

class YogaPosesRepositoryImpl implements YogaPosesRepository {
  final NetworkDataSource _networkDataSource;

  YogaPosesRepositoryImpl({
    required NetworkDataSource networkDataSource,
  }) : _networkDataSource = networkDataSource;

  @override
  Future<YogaPoseDetails> getYogaPoseDetails(String code) {
    try {
      return _networkDataSource.getYogaPoseDetails(code).then((response) {
        if (response.code == 200 && response.data != null) {
          return response.data!;
        } else {
          throw Exception('Failed to load yoga pose details');
        }
      });
    } catch (e) {
      throw Exception('Failed to load yoga pose details: $e');
    }
  }

  @override
  Future<List<YogaPoseDetails>> getYogaPoses(int page, int size, String keyword) async {
    try {
      return await _networkDataSource.getYogaPoses(page, size, keyword).then((response) {
        if (response.code == 200 && response.data != null) {
          return response.data!.items ?? [];
        } else {
          throw Exception('Failed to load yoga poses');
        }
      });
    } catch (e) {
      throw Exception('Failed to load yoga poses: $e');
    }
  }
}
