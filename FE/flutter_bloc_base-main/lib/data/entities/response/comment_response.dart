import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_response.freezed.dart';
part 'comment_response.g.dart';

@freezed
class CommentResponse with _$CommentResponse {
  const factory CommentResponse({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'postId') required String postId,
    @JsonKey(name: 'userId') required String userId,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'createdAt') String? createdAt,
  }) = _CommentResponse;

  factory CommentResponse.fromJson(Map<String, dynamic> json) => _$CommentResponseFromJson(json);
}