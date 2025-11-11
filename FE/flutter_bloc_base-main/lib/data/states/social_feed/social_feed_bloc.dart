import 'package:bloc/bloc.dart';
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

  String _currentScope = socialFeedScopePublic;
  String get currentScope => _currentScope;

  Future<void> _onFetchFeed(SocialFeedFetchFeed e, Emitter<SocialFeedState> emit) async {
    _currentScope = e.scope;
    emit(SocialFeedState.loading(scope: e.scope));
    try {
      final page = await _repository.getFeed(page: e.page, size: e.size, scope: e.scope);
      emit(SocialFeedState.loaded(scope: e.scope, feed: page.items));
    } catch (err) {
      emit(SocialFeedState.error(scope: e.scope, message: err.toString()));
    }
  }

  Future<void> _onCreatePost(SocialFeedCreatePost e, Emitter<SocialFeedState> emit) async {
    try {
      await _repository.createPost(content: e.content, imagePaths: e.imagePaths, visibility: e.visibility);
      add(SocialFeedEvent.fetchFeed(scope: _currentScope));
    } catch (err) {
      emit(SocialFeedState.error(scope: _currentScope, message: err.toString()));
    }
  }

  Future<void> _onLikePost(SocialFeedLikePost e, Emitter<SocialFeedState> emit) async {
    try {
      await _repository.like(postId: e.postId);
      add(SocialFeedEvent.fetchFeed(scope: _currentScope));
    } catch (err) {
      emit(SocialFeedState.error(scope: _currentScope, message: err.toString()));
    }
  }

  Future<void> _onUnlikePost(SocialFeedUnlikePost e, Emitter<SocialFeedState> emit) async {
    try {
      await _repository.unlike(postId: e.postId);
      add(SocialFeedEvent.fetchFeed(scope: _currentScope));
    } catch (err) {
      emit(SocialFeedState.error(scope: _currentScope, message: err.toString()));
    }
  }

  Future<void> _onAddComment(SocialFeedAddComment e, Emitter<SocialFeedState> emit) async {
    try {
      await _repository.comment(postId: e.postId, content: e.content);
      add(SocialFeedEvent.fetchFeed(scope: _currentScope));
    } catch (err) {
      emit(SocialFeedState.error(scope: _currentScope, message: err.toString()));
    }
  }

  Future<void> _onFetchComments(SocialFeedFetchComments e, Emitter<SocialFeedState> emit) async {
    try {
      await _repository.getComments(postId: e.postId, page: e.page, size: e.size);
    } catch (err) {
      emit(SocialFeedState.error(scope: _currentScope, message: err.toString()));
    }
  }
}

