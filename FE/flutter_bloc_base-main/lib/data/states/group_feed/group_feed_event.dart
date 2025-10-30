import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_feed_event.freezed.dart';

@freezed
class GroupFeedEvent with _$GroupFeedEvent {
  const factory GroupFeedEvent.fetchFeed(
      {required String groupId, @Default(0) int page, @Default(20) int size}) = FetchFeed;
  const factory GroupFeedEvent.createPost({required String groupId, required String content, List<String>? imagePaths}) =
      CreatePost;
  const factory GroupFeedEvent.likePost({required String groupId, required String postId}) =
      LikePost;
  const factory GroupFeedEvent.unlikePost({required String groupId, required String postId}) =
      UnlikePost;
  const factory GroupFeedEvent.addComment(
      {required String groupId, required String postId, required String content}) = AddComment;
  const factory GroupFeedEvent.fetchComments(
      {required String groupId,
      required String postId,
      @Default(0) int page,
      @Default(20) int size}) = FetchComments;
}
