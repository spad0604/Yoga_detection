// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_group_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateGroupRequestImpl _$$CreateGroupRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateGroupRequestImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      isPrivate: json['is_private'] as bool? ?? false,
    );

Map<String, dynamic> _$$CreateGroupRequestImplToJson(
        _$CreateGroupRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'is_private': instance.isPrivate,
    };
