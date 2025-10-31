import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_feed_event.freezed.dart';

@freezed
class SocialFeedEvent with _$SocialFeedEvent {
  const factory SocialFeedEvent.fetchFeed({@Default(0) int page, @Default(20) int size}) = SocialFeedFetchFeed;
  const factory SocialFeedEvent.createPost({String? content, @Default(<String>[]) List<String> imagePaths, @Default('PUBLIC') String visibility}) = SocialFeedCreatePost;
  const factory SocialFeedEvent.likePost({required String postId}) = SocialFeedLikePost;
  const factory SocialFeedEvent.unlikePost({required String postId}) = SocialFeedUnlikePost;
  const factory SocialFeedEvent.addComment({required String postId, required String content}) = SocialFeedAddComment;
  const factory SocialFeedEvent.fetchComments({required String postId, @Default(0) int page, @Default(20) int size}) = SocialFeedFetchComments;
}


