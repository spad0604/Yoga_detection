import 'package:flutter_starter/data/entities/response/notification_response.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/repositories/notification_repository/notification_repository.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'package:flutter_starter/data/sources/network/base_api_response.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/error_code.dart';
import 'package:flutter_starter/core/exception.dart';

@Singleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NetworkDataSource _networkDataSource;

  NotificationRepositoryImpl({required NetworkDataSource networkDataSource})
      : _networkDataSource = networkDataSource;

  @override
  Future<BaseApiResponse<PageResponse<NotificationResponse>>> getNotifications({
    required int page,
    required int size,
  }) async {
    try {
      final res = await _networkDataSource.getNotifications(page, size);

      final code = res.code;
      if (code != null && code != ErrorCode.SUCCESS.code) {
        final match = ErrorCode.values.firstWhere(
          (e) => e.code == code,
          orElse: () => ErrorCode.INTERNAL_SERVER_ERROR,
        );
        throw ServerException(match, data: res);
      }

      return res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseApiResponse<NotificationResponse>> getNotificationById(String id) async {
    try {
      final res = await _networkDataSource.getNotificationById(id);

      final code = res.code;
      if (code != null && code != ErrorCode.SUCCESS.code) {
        final match = ErrorCode.values.firstWhere(
          (e) => e.code == code,
          orElse: () => ErrorCode.INTERNAL_SERVER_ERROR,
        );
        throw ServerException(match, data: res);
      }

      return res;
    } catch (e) {
      rethrow;
    }
  }
}
