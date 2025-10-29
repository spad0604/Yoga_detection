// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_routine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YogaRoutineImpl _$$YogaRoutineImplFromJson(Map<String, dynamic> json) =>
    _$YogaRoutineImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      level: json['level'] as String?,
      durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
      estimatedCalories: (json['estimated_calories'] as num?)?.toInt(),
      imageUrl: json['image_url'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isPremium: json['is_premium'] as bool? ?? false,
      totalPoses: (json['total_poses'] as num?)?.toInt(),
      poses: (json['poses'] as List<dynamic>?)
          ?.map((e) => RoutinePose.fromJson(e as Map<String, dynamic>))
          .toList(),
      userProgress: json['user_progress'] == null
          ? null
          : UserRoutineProgressInfo.fromJson(
              json['user_progress'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$YogaRoutineImplToJson(_$YogaRoutineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'level': instance.level,
      'duration_minutes': instance.durationMinutes,
      'estimated_calories': instance.estimatedCalories,
      'image_url': instance.imageUrl,
      'tags': instance.tags,
      'is_premium': instance.isPremium,
      'total_poses': instance.totalPoses,
      'poses': instance.poses,
      'user_progress': instance.userProgress,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$RoutinePoseImpl _$$RoutinePoseImplFromJson(Map<String, dynamic> json) =>
    _$RoutinePoseImpl(
      id: json['id'] as String,
      poseCode: json['pose_code'] as String,
      poseName: json['pose_name'] as String?,
      orderIndex: (json['order_index'] as num).toInt(),
      durationSeconds: (json['duration_seconds'] as num?)?.toInt(),
      repetitions: (json['repetitions'] as num?)?.toInt() ?? 1,
      restAfterSeconds: (json['rest_after_seconds'] as num?)?.toInt() ?? 5,
      instructions: json['instructions'] as String?,
      poseImageUrl: json['pose_image_url'] as String?,
      poseDescription: json['pose_description'] as String?,
    );

Map<String, dynamic> _$$RoutinePoseImplToJson(_$RoutinePoseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pose_code': instance.poseCode,
      'pose_name': instance.poseName,
      'order_index': instance.orderIndex,
      'duration_seconds': instance.durationSeconds,
      'repetitions': instance.repetitions,
      'rest_after_seconds': instance.restAfterSeconds,
      'instructions': instance.instructions,
      'pose_image_url': instance.poseImageUrl,
      'pose_description': instance.poseDescription,
    };

_$UserRoutineProgressInfoImpl _$$UserRoutineProgressInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRoutineProgressInfoImpl(
      completionPercentage:
          (json['completion_percentage'] as num?)?.toDouble() ?? 0.0,
      isCompleted: json['is_completed'] as bool? ?? false,
      currentPoseIndex: (json['current_pose_index'] as num?)?.toInt() ?? 0,
      lastPracticedAt: json['last_practiced_at'] == null
          ? null
          : DateTime.parse(json['last_practiced_at'] as String),
      averageScore: (json['average_score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$UserRoutineProgressInfoImplToJson(
        _$UserRoutineProgressInfoImpl instance) =>
    <String, dynamic>{
      'completion_percentage': instance.completionPercentage,
      'is_completed': instance.isCompleted,
      'current_pose_index': instance.currentPoseIndex,
      'last_practiced_at': instance.lastPracticedAt?.toIso8601String(),
      'average_score': instance.averageScore,
    };
