import 'package:flutter_starter/data/entities/response/comment_response.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/post_response.dart';

abstract class GroupPostsRepository {
  Future<PostResponse> createPost(
      {required String groupId, String? content, List<String>? imagePaths});
  Future<PageResponse<PostResponse>> getFeed(
      {required String groupId, int page = 0, int size = 20});
  Future<void> like({required String groupId, required String postId});
  Future<void> unlike({required String groupId, required String postId});
  Future<CommentResponse> comment(
      {required String groupId, required String postId, required String content});
  Future<PageResponse<CommentResponse>> getComments(
      {required String groupId, required String postId, int page = 0, int size = 20});
}
