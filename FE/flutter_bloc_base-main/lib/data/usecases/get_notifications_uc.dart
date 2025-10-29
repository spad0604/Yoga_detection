import 'dart:async';

import 'package:flutter_starter/data/entities/response/notification_response.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/repositories/notification_repository/notification_repository.dart';

typedef GetNotificationsParams = ({int page, int size});

@singleton
class GetNotificationsUseCase
    extends UseCase<PageResponse<NotificationResponse>, GetNotificationsParams> {
  final NotificationRepository _notificationRepository;

  const GetNotificationsUseCase({
    required NotificationRepository notificationRepository,
  }) : _notificationRepository = notificationRepository;

  @override
  FutureOr<PageResponse<NotificationResponse>> call(GetNotificationsParams params) async {
    final res = await _notificationRepository.getNotifications(
      page: params.page,
      size: params.size,
    );

    if (res.data == null) {
      throw Exception('Failed to load notifications');
    }

    return res.data!;
  }
}
