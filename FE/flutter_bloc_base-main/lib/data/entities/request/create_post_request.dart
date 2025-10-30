import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_post_request.freezed.dart';
part 'create_post_request.g.dart';

@freezed
class CreatePostRequest with _$CreatePostRequest {
  const factory CreatePostRequest({
    @JsonKey(name: 'content') required String content,
    @JsonKey(name: 'imageUrls') String? imageUrls,
  }) = _CreatePostRequest;

  factory CreatePostRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePostRequestFromJson(json);
}
