import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/friends/friends_event.dart';
import 'package:flutter_starter/data/states/friends/friends_state.dart';
import 'package:flutter_starter/data/repositories/social_repository/social_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  final SocialRepository _socialRepository;

  FriendsBloc(this._socialRepository) : super(const FriendsState()) {
    on<FriendsLoadFriends>(_onLoadFriends);
    on<FriendsLoadPendingRequests>(_onLoadPendingRequests);
    on<FriendsRefreshFriends>(_onRefreshFriends);
    on<FriendsRefreshPendingRequests>(_onRefreshPendingRequests);
    on<FriendsSendFriendRequest>(_onSendFriendRequest);
    on<FriendsAcceptRequest>(_onAcceptRequest);
    on<FriendsRejectRequest>(_onRejectRequest);
    on<FriendsRemoveFriend>(_onRemoveFriend);
  }

  Future<void> _onLoadFriends(
    FriendsLoadFriends event,
    Emitter<FriendsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final result = await _socialRepository.getFriends(0, 50);
      emit(state.copyWith(
        friends: result.items,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onLoadPendingRequests(
    FriendsLoadPendingRequests event,
    Emitter<FriendsState> emit,
  ) async {
    emit(state.copyWith(isLoadingPending: true, error: null));

    try {
      final result = await _socialRepository.getPendingFriendRequests(0, 50);
      emit(state.copyWith(
        pendingRequests: result.items,
        isLoadingPending: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoadingPending: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onRefreshFriends(
    FriendsRefreshFriends event,
    Emitter<FriendsState> emit,
  ) async {
    add(const FriendsLoadFriends());
  }

  Future<void> _onRefreshPendingRequests(
    FriendsRefreshPendingRequests event,
    Emitter<FriendsState> emit,
  ) async {
    add(const FriendsLoadPendingRequests());
  }

  Future<void> _onSendFriendRequest(
    FriendsSendFriendRequest event,
    Emitter<FriendsState> emit,
  ) async {
    try {
      await _socialRepository.sendFriendRequest(event.email);
      // Refresh pending requests
      add(const FriendsLoadPendingRequests());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onAcceptRequest(
    FriendsAcceptRequest event,
    Emitter<FriendsState> emit,
  ) async {
    try {
      await _socialRepository.acceptFriendRequest(event.friendshipId);
      // Refresh both lists
      add(const FriendsLoadFriends());
      add(const FriendsLoadPendingRequests());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onRejectRequest(
    FriendsRejectRequest event,
    Emitter<FriendsState> emit,
  ) async {
    try {
      await _socialRepository.rejectFriendRequest(event.friendshipId);
      // Remove from pending list locally
      emit(state.copyWith(
        pendingRequests: state.pendingRequests
            .where((f) => f.friendshipId != event.friendshipId)
            .toList(),
      ));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onRemoveFriend(
    FriendsRemoveFriend event,
    Emitter<FriendsState> emit,
  ) async {
    try {
      await _socialRepository.removeFriend(event.friendshipId);
      // Remove from friends list locally
      emit(state.copyWith(
        friends: state.friends
            .where((f) => f.friendshipId != event.friendshipId)
            .toList(),
      ));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}

