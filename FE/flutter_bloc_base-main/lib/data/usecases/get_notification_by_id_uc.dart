import 'dart:async';

import 'package:flutter_starter/data/entities/response/notification_response.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/repositories/notification_repository/notification_repository.dart';

@singleton
class GetNotificationByIdUseCase extends UseCase<NotificationResponse, int> {
  final NotificationRepository _notificationRepository;

  const GetNotificationByIdUseCase({
    required NotificationRepository notificationRepository,
  }) : _notificationRepository = notificationRepository;

  @override
  FutureOr<NotificationResponse> call(int notificationId) async {
    final res = await _notificationRepository.getNotificationById(notificationId);

    if (res.data == null) {
      throw Exception('Notification not found');
    }

    return res.data!;
  }
}
