import 'package:flutter_starter/data/entities/response/notification_response.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/sources/network/base_api_response.dart';

abstract class NotificationRepository {
  Future<BaseApiResponse<PageResponse<NotificationResponse>>> getNotifications({
    required int page,
    required int size,
  });

  Future<BaseApiResponse<NotificationResponse>> getNotificationById(String id);
}
