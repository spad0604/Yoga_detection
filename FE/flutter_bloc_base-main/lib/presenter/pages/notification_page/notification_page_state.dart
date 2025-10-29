import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/data/entities/response/notification_response.dart';

part 'notification_page_state.freezed.dart';

@freezed
class NotificationPageState with _$NotificationPageState {
  const factory NotificationPageState({
    @Default([]) List<NotificationResponse> notifications,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    @Default(0) int currentPage,
    @Default(true) bool hasMore,
    @Default(0) int totalElements,
  }) = _NotificationPageState;
}
