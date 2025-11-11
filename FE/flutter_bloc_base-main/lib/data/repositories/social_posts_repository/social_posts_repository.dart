import 'package:flutter_starter/data/entities/response/comment_response.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/post_response.dart';

abstract class SocialPostsRepository {
  Future<PostResponse> createPost({String? content, List<String>? imagePaths, String visibility = 'PUBLIC'});
  Future<PageResponse<PostResponse>> getFeed({int page = 0, int size = 20, String scope = 'PUBLIC'});
  Future<void> like({required String postId});
  Future<void> unlike({required String postId});
  Future<CommentResponse> comment({required String postId, required String content});
  Future<PageResponse<CommentResponse>> getComments({required String postId, int page = 0, int size = 20});
}


