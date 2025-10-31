import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_response.freezed.dart';
part 'post_response.g.dart';

@freezed
class PostResponse with _$PostResponse {
  const factory PostResponse({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'groupId') String? groupId,
    @JsonKey(name: 'authorId') required String authorId,
    @JsonKey(name: 'authorName') String? authorName,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'imageUrls') String? imageUrls,
    @JsonKey(name: 'likeCount') @Default(0) int likeCount,
    @JsonKey(name: 'commentCount') @Default(0) int commentCount,
    @JsonKey(name: 'likedByMe') @Default(false) bool likedByMe,
    @JsonKey(name: 'createdAt') String? createdAt,
  }) = _PostResponse;

  factory PostResponse.fromJson(Map<String, dynamic> json) => _$PostResponseFromJson(json);
}
