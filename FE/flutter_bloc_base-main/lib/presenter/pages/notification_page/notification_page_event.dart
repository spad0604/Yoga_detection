import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_page_event.freezed.dart';

@freezed
class NotificationPageEvent with _$NotificationPageEvent {
  const factory NotificationPageEvent.loadNotifications({
    @Default(0) int page,
    @Default(20) int size,
  }) = LoadNotifications;

  const factory NotificationPageEvent.refreshNotifications() = RefreshNotifications;

  const factory NotificationPageEvent.loadMoreNotifications() = LoadMoreNotifications;

  const factory NotificationPageEvent.markAsRead(int id) = MarkAsRead;
}
