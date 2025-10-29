// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YogaGroupResponseImpl _$$YogaGroupResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$YogaGroupResponseImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      ownerId: json['owner_id'] as String,
      ownerName: json['owner_name'] as String?,
      memberCount: (json['member_count'] as num?)?.toInt() ?? 0,
      isPrivate: json['is_private'] as bool? ?? false,
      isMember: json['is_member'] as bool? ?? false,
      userRole: json['user_role'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$YogaGroupResponseImplToJson(
        _$YogaGroupResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'owner_id': instance.ownerId,
      'owner_name': instance.ownerName,
      'member_count': instance.memberCount,
      'is_private': instance.isPrivate,
      'is_member': instance.isMember,
      'user_role': instance.userRole,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
