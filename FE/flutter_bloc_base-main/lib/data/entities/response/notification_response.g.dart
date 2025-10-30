// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationResponseImpl _$$NotificationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationResponseImpl(
      id: (json['id'] as num).toInt(),
      userId: json['userId'] as String,
      normalTitle: json['normalTitle'] as String,
      htmlTitle: json['htmlTitle'] as String?,
      imageUrl: json['imageUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      all: json['all'] as bool,
    );

Map<String, dynamic> _$$NotificationResponseImplToJson(
        _$NotificationResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'normalTitle': instance.normalTitle,
      'htmlTitle': instance.htmlTitle,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'all': instance.all,
    };
