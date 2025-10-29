// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserActivityResponseImpl _$$UserActivityResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserActivityResponseImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      username: json['username'] as String,
      userAvatarUrl: json['user_avatar_url'] as String?,
      activityType: json['activity_type'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$UserActivityResponseImplToJson(
        _$UserActivityResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'username': instance.username,
      'user_avatar_url': instance.userAvatarUrl,
      'activity_type': instance.activityType,
      'title': instance.title,
      'description': instance.description,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
    };
