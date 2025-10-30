// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatePostRequestImpl _$$CreatePostRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatePostRequestImpl(
      content: json['content'] as String,
      imageUrls: json['imageUrls'] as String?,
    );

Map<String, dynamic> _$$CreatePostRequestImplToJson(
        _$CreatePostRequestImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'imageUrls': instance.imageUrls,
    };
