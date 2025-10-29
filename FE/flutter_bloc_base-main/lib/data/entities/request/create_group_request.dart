import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_group_request.freezed.dart';
part 'create_group_request.g.dart';

@freezed
class CreateGroupRequest with _$CreateGroupRequest {
  const factory CreateGroupRequest({
    required String name,
    String? description,
    String? imageUrl,
    @Default(false) bool isPrivate,
  }) = _CreateGroupRequest;

  factory CreateGroupRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupRequestFromJson(json);
}

