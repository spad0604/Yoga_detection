import 'package:bloc/bloc.dart';
import 'package:flutter_starter/data/entities/response/post_response.dart';
import 'package:flutter_starter/data/repositories/social_posts_repository/social_posts_repository.dart';
import 'package:flutter_starter/data/states/social_feed/social_feed_event.dart';
import 'package:flutter_starter/data/states/social_feed/social_feed_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SocialFeedBloc extends Bloc<SocialFeedEvent, SocialFeedState> {
  final SocialPostsRepository _repository;
  SocialFeedBloc(this._repository) : super(const SocialFeedState.initial()) {
    on<SocialFeedEvent>((event, emit) => event.map(
          fetchFeed: (e) => _onFetchFeed(e, emit),
          createPost: (e) => _onCreatePost(e, emit),
          likePost: (e) => _onLikePost(e, emit),
          unlikePost: (e) => _onUnlikePost(e, emit),
          addComment: (e) => _onAddComment(e, emit),
          fetchComments: (e) => _onFetchComments(e, emit),
        ));
  }

  Future<void> _onFetchFeed(dynamic e, Emitter<SocialFeedState> emit) async {
    emit(const SocialFeedState.loading());
    try {
      final page = await _repository.getFeed(page: e.page, size: e.size);
      emit(SocialFeedState.loaded(feed: page.items));
    } catch (err) {
      emit(SocialFeedState.error(err.toString()));
    }
  }

  Future<void> _onCreatePost(dynamic e, Emitter<SocialFeedState> emit) async {
    try {
      final post = await _repository.createPost(content: e.content, imagePaths: e.imagePaths, visibility: e.visibility);
      final feed = state.maybeWhen(loaded: (feed) => feed, orElse: () => <PostResponse>[]);
      emit(SocialFeedState.loaded(feed: [post, ...feed]));
    } catch (err) {
      emit(SocialFeedState.error(err.toString()));
    }
  }

  Future<void> _onLikePost(dynamic e, Emitter<SocialFeedState> emit) async {
    try {
      await _repository.like(postId: e.postId);
      add(const SocialFeedEvent.fetchFeed());
    } catch (err) {
      emit(SocialFeedState.error(err.toString()));
    }
  }

  Future<void> _onUnlikePost(dynamic e, Emitter<SocialFeedState> emit) async {
    try {
      await _repository.unlike(postId: e.postId);
      add(const SocialFeedEvent.fetchFeed());
    } catch (err) {
      emit(SocialFeedState.error(err.toString()));
    }
  }

  Future<void> _onAddComment(dynamic e, Emitter<SocialFeedState> emit) async {
    try {
      await _repository.comment(postId: e.postId, content: e.content);
      add(const SocialFeedEvent.fetchFeed());
    } catch (err) {
      emit(SocialFeedState.error(err.toString()));
    }
  }

  Future<void> _onFetchComments(dynamic e, Emitter<SocialFeedState> emit) async {
    try {
      await _repository.getComments(postId: e.postId, page: e.page, size: e.size);
    } catch (err) {
      emit(SocialFeedState.error(err.toString()));
    }
  }
}


