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
      imageUrl: json['imageUrl'] as String?,
      ownerId: json['ownerId'] as String,
      ownerName: json['ownerName'] as String?,
      memberCount: (json['memberCount'] as num?)?.toInt() ?? 0,
      isPrivate: json['isPrivate'] as bool? ?? false,
      isMember: json['isMember'] as bool? ?? false,
      userRole: json['userRole'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$YogaGroupResponseImplToJson(
        _$YogaGroupResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'ownerId': instance.ownerId,
      'ownerName': instance.ownerName,
      'memberCount': instance.memberCount,
      'isPrivate': instance.isPrivate,
      'isMember': instance.isMember,
      'userRole': instance.userRole,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
