// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendResponseImpl _$$FriendResponseImplFromJson(Map<String, dynamic> json) =>
    _$FriendResponseImpl(
      friendshipId: json['friendshipId'] as String,
      userId: json['userId'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      status: json['status'] as String?,
      friendsSince: json['friendsSince'] == null
          ? null
          : DateTime.parse(json['friendsSince'] as String),
      totalPosesCompleted: (json['totalPosesCompleted'] as num?)?.toInt(),
      totalRoutinesCompleted: (json['totalRoutinesCompleted'] as num?)?.toInt(),
      averageScore: (json['averageScore'] as num?)?.toDouble(),
      currentStreak: (json['currentStreak'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FriendResponseImplToJson(
        _$FriendResponseImpl instance) =>
    <String, dynamic>{
      'friendshipId': instance.friendshipId,
      'userId': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'status': instance.status,
      'friendsSince': instance.friendsSince?.toIso8601String(),
      'totalPosesCompleted': instance.totalPosesCompleted,
      'totalRoutinesCompleted': instance.totalRoutinesCompleted,
      'averageScore': instance.averageScore,
      'currentStreak': instance.currentStreak,
    };
