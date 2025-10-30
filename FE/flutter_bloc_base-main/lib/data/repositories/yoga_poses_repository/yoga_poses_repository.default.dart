import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
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
      int page, DateTime startDate, DateTime endDate) {
    try {
      final res = _networkDataSource.getUserYogaPosesByDate(
          page, startDate.toIso8601String(), endDate.toIso8601String());
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
      final String poseCode = model.poseId; // map poseId -> poseCode expected by backend

      // Validate poseCode before uploading
      if (poseCode.isEmpty || poseCode == '-1') {
        throw Exception(
          'Invalid poseCode: "$poseCode". '
          'Make sure to pass a valid pose ID when navigating to the camera screen. '
          'The backend requires a valid poseCode to process the upload.',
        );
      }

      MultipartFile? image;
      if (imagePath.isNotEmpty) {
        final filename = imagePath.split(RegExp(r'[\/]+')).last;
        String mime = 'image/jpeg';
        final lower = filename.toLowerCase();
        if (lower.endsWith('.png')) mime = 'image/png';
        if (lower.endsWith('.gif')) mime = 'image/gif';

        final parts = mime.split('/');
        image = MultipartFile.fromFileSync(
          imagePath,
          filename: filename,
          contentType: MediaType(parts[0], parts[1]),
        );
      }

      // Build request JSON as backend expects inside a multipart field named 'request'
      final Map<String, dynamic> requestMap = {
        'poseCode': poseCode,
        'landmarks': model.landmarks.map((e) => e.toJson()).toList(),
        'timestamp': model.timestamp,
      };

      final String requestJson = jsonEncode(requestMap);

      // Create a multipart part for the JSON request with explicit content-type
      final requestPart = MultipartFile.fromString(
        requestJson,
        filename: 'request.json',
        contentType: MediaType('application', 'json'),
      );

      // Some server implementations expect poseCode as a top-level form field
      // in addition to the JSON 'request' part — include both to satisfy server.
      final formData = FormData.fromMap({
        'request': requestPart,
        'poseCode': poseCode,
        if (image != null) 'image': image,
      });

      // Verbose logging to debug server 500
      print('📋 FormData contents:');
      print('  request JSON length: ${requestJson.length} chars');
      print(
          '  request JSON preview: ${requestJson.substring(0, requestJson.length > 200 ? 200 : requestJson.length)}...');
      if (image != null) {
        print(
            '  image: filename="${image.filename}", contentType=${image.contentType}, length=${image.length}');
      } else {
        print('  image: null');
      }

      final res = _networkDataSource.postYogaPose(formData);
      return res.then((value) {
        if (value.code == 200) {
          return;
        } else {
          throw Exception('Failed to post yoga pose');
        }
      });
    } catch (e, st) {
      // Log detailed info for debugging upload failures
      try {
        print('postYogaPose error: $e');
        if (e is DioException) {
          print('DioException status: ${e.response?.statusCode}');
          print('DioException data: ${e.response?.data}');
          print('DioException headers: ${e.response?.headers}');
        }
      } catch (_) {}
      print(st);
      throw Exception('Failed to post yoga pose: $e');
    }
  }
}
