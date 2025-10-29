import 'package:flutter_starter/data/entities/request/create_body_progress_request.dart';
import 'package:flutter_starter/data/entities/request/update_body_progress_request.dart';
import 'package:flutter_starter/data/entities/response/body_progress_response.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/repositories/body_progress_repository/body_progress_repository.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@Singleton(as: BodyProgressRepository)
class BodyProgressRepositoryImpl implements BodyProgressRepository {
  final NetworkDataSource _networkDataSource;

  BodyProgressRepositoryImpl({
    required NetworkDataSource networkDataSource,
  }) : _networkDataSource = networkDataSource;

  @override
  Future<BodyProgressResponse> createBodyProgress(CreateBodyProgressRequest request) async {
    try {
      final res = await _networkDataSource.createBodyProgress(request);
      if (res.code == 200 || res.code == 201) {
        if (res.data != null) {
          return res.data!;
        }
        throw Exception('Failed to create body progress: No data returned');
      } else {
        throw Exception('Failed to create body progress');
      }
    } catch (e) {
      throw Exception('Failed to create body progress: $e');
    }
  }

  @override
  Future<BodyProgressResponse> updateBodyProgress(String id, UpdateBodyProgressRequest request) async {
    try {
      final res = await _networkDataSource.updateBodyProgress(id, request);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to update body progress');
      }
    } catch (e) {
      throw Exception('Failed to update body progress: $e');
    }
  }

  @override
  Future<void> deleteBodyProgress(String id) async {
    try {
      final res = await _networkDataSource.deleteBodyProgress(id);
      if (res.code != 200 && res.code != 204) {
        throw Exception('Failed to delete body progress');
      }
    } catch (e) {
      throw Exception('Failed to delete body progress: $e');
    }
  }

  @override
  Future<BodyProgressResponse> getBodyProgressById(String id) async {
    try {
      final res = await _networkDataSource.getBodyProgressById(id);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to get body progress');
      }
    } catch (e) {
      throw Exception('Failed to get body progress: $e');
    }
  }

  @override
  Future<PageResponse<BodyProgressResponse>> getUserBodyProgress(int page, int size) async {
    try {
      final res = await _networkDataSource.getUserBodyProgress(page, size);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load body progress');
      }
    } catch (e) {
      throw Exception('Failed to load body progress: $e');
    }
  }

  @override
  Future<List<BodyProgressResponse>> getAllUserBodyProgress() async {
    try {
      final res = await _networkDataSource.getAllUserBodyProgress();
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to load all body progress');
      }
    } catch (e) {
      throw Exception('Failed to load all body progress: $e');
    }
  }

  @override
  Future<BodyProgressResponse> getLatestBodyProgress() async {
    try {
      final res = await _networkDataSource.getLatestBodyProgress();
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to get latest body progress');
      }
    } catch (e) {
      throw Exception('Failed to get latest body progress: $e');
    }
  }

  @override
  Future<List<BodyProgressResponse>> getBodyProgressByDateRange(DateTime startDate, DateTime endDate) async {
    try {
      // Format dates as ISO 8601 strings
      final dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
      final startDateStr = dateFormat.format(startDate);
      final endDateStr = dateFormat.format(endDate);
      
      final res = await _networkDataSource.getBodyProgressByDateRange(startDateStr, endDateStr);
      if (res.code == 200 && res.data != null) {
        return res.data!;
      } else {
        throw Exception('Failed to get body progress by date range');
      }
    } catch (e) {
      throw Exception('Failed to get body progress by date range: $e');
    }
  }
}

