// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentResponseImpl _$$CommentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentResponseImpl(
      id: json['id'] as String,
      postId: json['postId'] as String,
      userId: json['userId'] as String,
      username: json['username'] as String?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$CommentResponseImplToJson(
        _$CommentResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'userId': instance.userId,
      'username': instance.username,
      'content': instance.content,
      'createdAt': instance.createdAt,
    };
