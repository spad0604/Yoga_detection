import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/data/entities/response/post_response.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/comment_response.dart';
import 'package:flutter_starter/data/repositories/social_posts_repository/social_posts_repository.dart';
import 'package:flutter_starter/data/sources/network/network.dart';

@Singleton(as: SocialPostsRepository)
class SocialPostsRepositoryImpl implements SocialPostsRepository {
  final NetworkDataSource _api;
  SocialPostsRepositoryImpl({required NetworkDataSource api}) : _api = api;

  @override
  Future<PostResponse> createPost({String? content, List<String>? imagePaths, String visibility = 'PUBLIC'}) async {
    final List<MultipartFile> files = [];
    if (imagePaths != null) {
      for (final path in imagePaths) {
        if (path.isEmpty) continue;
        final filename = path.split(RegExp(r'[\\/]+')).last;
        String mime = 'image/jpeg';
        final lower = filename.toLowerCase();
        if (lower.endsWith('.png')) mime = 'image/png';
        if (lower.endsWith('.gif')) mime = 'image/gif';
        final parts = mime.split('/');
        files.add(await MultipartFile.fromFile(path, filename: filename, contentType: MediaType(parts[0], parts[1])));
      }
    }

    final map = <String, dynamic>{
      'content': content ?? '',
      'visibility': visibility,
    };
    if (files.isNotEmpty) map['images'] = files;

    final res = await _api.createSocialPost(FormData.fromMap(map));
    if (res.data == null) throw Exception('Empty response');
    return res.data!;
  }

  @override
  Future<PageResponse<PostResponse>> getFeed({int page = 0, int size = 20}) async {
    final res = await _api.getSocialFeed(page, size);
    if (res.data == null) throw Exception('Empty response');
    return res.data!;
  }

  @override
  Future<void> like({required String postId}) async {
    await _api.likeSocialPost(postId);
  }

  @override
  Future<void> unlike({required String postId}) async {
    await _api.unlikeSocialPost(postId);
  }

  @override
  Future<CommentResponse> comment({required String postId, required String content}) async {
    final res = await _api.createSocialComment(postId, {'content': content});
    if (res.data == null) throw Exception('Empty response');
    return res.data!;
  }

  @override
  Future<PageResponse<CommentResponse>> getComments({required String postId, int page = 0, int size = 20}) async {
    final res = await _api.getSocialComments(postId, page, size);
    if (res.data == null) throw Exception('Empty response');
    return res.data!;
  }
}


