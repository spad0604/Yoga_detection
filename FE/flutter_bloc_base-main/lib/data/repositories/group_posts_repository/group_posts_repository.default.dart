import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter_starter/data/entities/response/comment_response.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/post_response.dart';
import 'package:flutter_starter/data/repositories/group_posts_repository/group_posts_repository.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: GroupPostsRepository)
class GroupPostsRepositoryImpl implements GroupPostsRepository {
  final NetworkDataSource _api;

  GroupPostsRepositoryImpl({required NetworkDataSource api}) : _api = api;

  @override
  Future<PostResponse> createPost(
      {required String groupId, String? content, List<String>? imagePaths}) async {
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
        final file = MultipartFile.fromFileSync(
          path,
          filename: filename,
          contentType: MediaType(parts[0], parts[1]),
        );
        files.add(file);
      }
    }

    final Map<String, dynamic> map = {
      'content': content ?? '',
    };

    if (files.isNotEmpty) {
      map['images'] = files;
    }

    final formData = FormData.fromMap(map);

    final res = await _api.createGroupPost(groupId, formData);
    if (res.data == null) throw Exception('Empty response');
    return res.data!;
  }

  @override
  Future<PageResponse<PostResponse>> getFeed(
      {required String groupId, int page = 0, int size = 20}) async {
    final res = await _api.getGroupFeed(groupId, page, size);
    if (res.data == null) throw Exception('Empty response');
    return res.data!;
  }

  @override
  Future<void> like({required String groupId, required String postId}) async {
    await _api.likeGroupPost(groupId, postId);
  }

  @override
  Future<void> unlike({required String groupId, required String postId}) async {
    await _api.unlikeGroupPost(groupId, postId);
  }

  @override
  Future<CommentResponse> comment(
      {required String groupId, required String postId, required String content}) async {
    final res = await _api.createComment(groupId, postId, {
      'content': content,
    });
    if (res.data == null) throw Exception('Empty response');
    return res.data!;
  }

  @override
  Future<PageResponse<CommentResponse>> getComments(
      {required String groupId, required String postId, int page = 0, int size = 20}) async {
    final res = await _api.getCommentsOfPost(groupId, postId, page, size);
    if (res.data == null) throw Exception('Empty response');
    return res.data!;
  }
}
