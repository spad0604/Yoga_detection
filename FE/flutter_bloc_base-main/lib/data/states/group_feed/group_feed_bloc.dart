import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/group_feed/group_feed_event.dart';
import 'package:flutter_starter/data/states/group_feed/group_feed_state.dart';
import 'package:flutter_starter/data/repositories/group_posts_repository/group_posts_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GroupFeedBloc extends Bloc<GroupFeedEvent, GroupFeedState> {
  final GroupPostsRepository _repository;
  GroupFeedBloc(this._repository) : super(const GroupFeedState.initial()) {
    on<GroupFeedEvent>((event, emit) => event.map(
          fetchFeed: (e) => _onFetchFeed(e, emit),
          createPost: (e) => _onCreatePost(e, emit),
          likePost: (e) => _onLikePost(e, emit),
          unlikePost: (e) => _onUnlikePost(e, emit),
          addComment: (e) => _onAddComment(e, emit),
          fetchComments: (e) => _onFetchComments(e, emit),
        ));
  }

  Future<void> _onFetchFeed(dynamic e, Emitter<GroupFeedState> emit) async {
    emit(const GroupFeedState.loading());
    try {
      final page = await _repository.getFeed(
          groupId: e.groupId, page: e.page, size: e.size);
      emit(GroupFeedState.loaded(feed: page.items));
    } catch (err) {
      emit(GroupFeedState.error(err.toString()));
    }
  }

  Future<void> _onCreatePost(dynamic e, Emitter<GroupFeedState> emit) async {
    try {
      await _repository.createPost(
          groupId: e.groupId, content: e.content, imagePaths: e.imagePaths);
      add(GroupFeedEvent.fetchFeed(groupId: e.groupId));
    } catch (err) {
      emit(GroupFeedState.error(err.toString()));
    }
  }

  Future<void> _onLikePost(dynamic e, Emitter<GroupFeedState> emit) async {
    try {
      await _repository.like(groupId: e.groupId, postId: e.postId);
      add(GroupFeedEvent.fetchFeed(groupId: e.groupId));
    } catch (err) {
      emit(GroupFeedState.error(err.toString()));
    }
  }

  Future<void> _onUnlikePost(dynamic e, Emitter<GroupFeedState> emit) async {
    try {
      await _repository.unlike(groupId: e.groupId, postId: e.postId);
      add(GroupFeedEvent.fetchFeed(groupId: e.groupId));
    } catch (err) {
      emit(GroupFeedState.error(err.toString()));
    }
  }

  Future<void> _onAddComment(dynamic e, Emitter<GroupFeedState> emit) async {
    try {
      await _repository.comment(
          groupId: e.groupId, postId: e.postId, content: e.content);
      add(GroupFeedEvent.fetchFeed(groupId: e.groupId));
    } catch (err) {
      emit(GroupFeedState.error(err.toString()));
    }
  }

  Future<void> _onFetchComments(dynamic e, Emitter<GroupFeedState> emit) async {
    try {
      await _repository.getComments(groupId: e.groupId, postId: e.postId);
      // Optionally handle comments state here if needed
    } catch (err) {
      emit(GroupFeedState.error(err.toString()));
    }
  }
}
