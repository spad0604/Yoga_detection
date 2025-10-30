import 'package:freezed_annotation/freezed_annotation.dart';

part 'yoga_group_response.freezed.dart';
part 'yoga_group_response.g.dart';

@freezed
class YogaGroupResponse with _$YogaGroupResponse {
  const factory YogaGroupResponse({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'ownerId') required String ownerId,
    @JsonKey(name: 'ownerName') String? ownerName,
    @JsonKey(name: 'memberCount') @Default(0) int memberCount,
    @JsonKey(name: 'isPrivate') @Default(false) bool isPrivate,
    @JsonKey(name: 'isMember') @Default(false) bool isMember,
    @JsonKey(name: 'userRole') String? userRole,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  }) = _YogaGroupResponse;

  factory YogaGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$YogaGroupResponseFromJson(json);
}
