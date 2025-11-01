// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationResponseImpl _$$NotificationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationResponseImpl(
      id: (json['id'] as num).toInt(),
      isAll: json['all'] as bool,
      userId: json['userId'] as String,
      normalTitle: json['normalTitle'] as String,
      htmlTitle: json['htmlTitle'] as String?,
      normalBody: json['normalBody'] as String?,
      htmlBody: json['htmlBody'] as String?,
      imageUrl: json['imageUrl'] as String?,
      type: json['type'] as String?,
      referenceId: json['referenceId'] as String?,
      isRead: json['isRead'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$NotificationResponseImplToJson(
        _$NotificationResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'all': instance.isAll,
      'userId': instance.userId,
      'normalTitle': instance.normalTitle,
      'htmlTitle': instance.htmlTitle,
      'normalBody': instance.normalBody,
      'htmlBody': instance.htmlBody,
      'imageUrl': instance.imageUrl,
      'type': instance.type,
      'referenceId': instance.referenceId,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt.toIso8601String(),
    };
