// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendResponseImpl _$$FriendResponseImplFromJson(Map<String, dynamic> json) =>
    _$FriendResponseImpl(
      friendshipId: json['friendship_id'] as String,
      userId: json['user_id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatar_url'] as String?,
      status: json['status'] as String,
      friendsSince: json['friends_since'] == null
          ? null
          : DateTime.parse(json['friends_since'] as String),
      totalPosesCompleted: (json['total_poses_completed'] as num?)?.toInt(),
      totalRoutinesCompleted:
          (json['total_routines_completed'] as num?)?.toInt(),
      averageScore: (json['average_score'] as num?)?.toDouble(),
      currentStreak: (json['current_streak'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FriendResponseImplToJson(
        _$FriendResponseImpl instance) =>
    <String, dynamic>{
      'friendship_id': instance.friendshipId,
      'user_id': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
      'status': instance.status,
      'friends_since': instance.friendsSince?.toIso8601String(),
      'total_poses_completed': instance.totalPosesCompleted,
      'total_routines_completed': instance.totalRoutinesCompleted,
      'average_score': instance.averageScore,
      'current_streak': instance.currentStreak,
    };
