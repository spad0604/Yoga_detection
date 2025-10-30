// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostResponseImpl _$$PostResponseImplFromJson(Map<String, dynamic> json) =>
    _$PostResponseImpl(
      id: json['id'] as String,
      groupId: json['groupId'] as String,
      authorId: json['authorId'] as String,
      authorName: json['authorName'] as String?,
      content: json['content'] as String?,
      imageUrls: json['imageUrls'] as String?,
      likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
      commentCount: (json['commentCount'] as num?)?.toInt() ?? 0,
      likedByMe: json['likedByMe'] as bool? ?? false,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$PostResponseImplToJson(_$PostResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupId': instance.groupId,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'content': instance.content,
      'imageUrls': instance.imageUrls,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'likedByMe': instance.likedByMe,
      'createdAt': instance.createdAt,
    };
