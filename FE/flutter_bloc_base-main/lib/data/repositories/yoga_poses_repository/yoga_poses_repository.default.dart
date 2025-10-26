import 'package:dio/dio.dart';
import 'package:flutter_starter/data/entities/request/post_yoga_pose_model.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/user_yoga_pose_model.dart';
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

  @override
  Future<UserYogaPoseModel> getUserYogaPoseById(String id) {
    try {
      final res = _networkDataSource.getUserYogaPoseById(id);
      return res.then((value) {
        if (value.code == 200 && value.data != null) {
          return value.data!;
        } else {
          throw Exception('Failed to load user yoga pose by id');
        }
      });
    } catch (e) {
      throw Exception('Failed to load user yoga pose by id: $e');
    }
  }

  @override
  Future<PageResponse<UserYogaPoseModel>> getUserYogaPosesByDate(
      int page, String startDate, String endDate) {
    try {
      final res = _networkDataSource.getUserYogaPosesByDate(page, startDate, endDate);
      return res.then((value) {
        if (value.code == 200 && value.data != null) {
          return value.data!;
        } else {
          throw Exception('Failed to load user yoga poses by date');
        }
      });
    } catch (e) {
      throw Exception('Failed to load user yoga poses by date: $e');
    }
  }

  @override
  Future<void> postYogaPose(PostYogaPoseModel model, String imagePath) {
    try {
      final res = _networkDataSource.postYogaPose(
          model, MultipartFile.fromFileSync(imagePath, filename: imagePath.split('/').last));
      return res.then((value) {
        if (value.code == 200) {
          return;
        } else {
          throw Exception('Failed to post yoga pose');
        }
      });
    } catch (e) {
      throw Exception('Failed to post yoga pose: $e');
    }
  }
}
