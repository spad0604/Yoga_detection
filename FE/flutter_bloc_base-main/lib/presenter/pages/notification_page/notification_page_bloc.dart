import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/data/usecases/get_notifications_uc.dart';
import 'package:flutter_starter/data/usecases/get_notification_by_id_uc.dart';
import 'package:flutter_starter/data/entities/response/notification_response.dart';
import 'notification_page_event.dart';
import 'notification_page_state.dart';

@injectable
class NotificationPageBloc extends Bloc<NotificationPageEvent, NotificationPageState> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  final GetNotificationByIdUseCase _getNotificationByIdUseCase;

  NotificationPageBloc(
    this._getNotificationsUseCase,
    this._getNotificationByIdUseCase,
  ) : super(const NotificationPageState()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<RefreshNotifications>(_onRefreshNotifications);
    on<LoadMoreNotifications>(_onLoadMoreNotifications);
    on<MarkAsRead>(_onMarkAsRead);
  }

  Future<void> _onLoadNotifications(
    LoadNotifications event,
    Emitter<NotificationPageState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false));

    try {
      final pageResponse = await _getNotificationsUseCase((
        page: event.page,
        size: event.size,
      ));

      emit(state.copyWith(
        notifications: pageResponse.items,
        isLoading: false,
        currentPage: pageResponse.page,
        hasMore: pageResponse.hasNext,
        totalElements: pageResponse.totalElements,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onRefreshNotifications(
    RefreshNotifications event,
    Emitter<NotificationPageState> emit,
  ) async {
    emit(state.copyWith(currentPage: 0));
    add(const NotificationPageEvent.loadNotifications(page: 0));
  }

  Future<void> _onLoadMoreNotifications(
    LoadMoreNotifications event,
    Emitter<NotificationPageState> emit,
  ) async {
    if (state.isLoadingMore || !state.hasMore) return;

    emit(state.copyWith(isLoadingMore: true));

    try {
      final nextPage = state.currentPage + 1;
      final pageResponse = await _getNotificationsUseCase((
        page: nextPage,
        size: 20,
      ));

      final updatedNotifications = [...state.notifications, ...pageResponse.items];
      emit(state.copyWith(
        notifications: updatedNotifications,
        isLoadingMore: false,
        currentPage: pageResponse.page,
        hasMore: pageResponse.hasNext,
        totalElements: pageResponse.totalElements,
      ));
    } catch (e) {
      emit(state.copyWith(isLoadingMore: false));
    }
  }

  Future<void> _onMarkAsRead(
    MarkAsRead event,
    Emitter<NotificationPageState> emit,
  ) async {
    try {
      await _getNotificationByIdUseCase(event.id);
      // Optionally update the notification in the list as read
    } catch (e) {
      // Handle error silently or show a snackbar
    }
  }
}
