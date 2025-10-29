import 'package:freezed_annotation/freezed_annotation.dart';

part 'yoga_group_response.freezed.dart';
part 'yoga_group_response.g.dart';

@freezed
class YogaGroupResponse with _$YogaGroupResponse {
  const factory YogaGroupResponse({
    required String id,
    required String name,
    String? description,
    String? imageUrl,
    required String ownerId,
    String? ownerName,
    @Default(0) int memberCount,
    @Default(false) bool isPrivate,
    @Default(false) bool isMember,
    String? userRole,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _YogaGroupResponse;

  factory YogaGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$YogaGroupResponseFromJson(json);
}

