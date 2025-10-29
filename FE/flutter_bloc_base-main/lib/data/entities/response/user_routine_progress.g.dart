// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_routine_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRoutineProgressImpl _$$UserRoutineProgressImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRoutineProgressImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      routineId: json['routine_id'] as String,
      routineName: json['routine_name'] as String?,
      routineImageUrl: json['routine_image_url'] as String?,
      completedPoses: (json['completed_poses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      totalPoses: (json['total_poses'] as num).toInt(),
      currentPoseIndex: (json['current_pose_index'] as num?)?.toInt() ?? 0,
      isCompleted: json['is_completed'] as bool? ?? false,
      completionPercentage:
          (json['completion_percentage'] as num?)?.toDouble() ?? 0.0,
      totalTimeSpentSeconds:
          (json['total_time_spent_seconds'] as num?)?.toInt() ?? 0,
      averageScore: (json['average_score'] as num?)?.toDouble(),
      lastPracticedAt: json['last_practiced_at'] == null
          ? null
          : DateTime.parse(json['last_practiced_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$UserRoutineProgressImplToJson(
        _$UserRoutineProgressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'routine_id': instance.routineId,
      'routine_name': instance.routineName,
      'routine_image_url': instance.routineImageUrl,
      'completed_poses': instance.completedPoses,
      'total_poses': instance.totalPoses,
      'current_pose_index': instance.currentPoseIndex,
      'is_completed': instance.isCompleted,
      'completion_percentage': instance.completionPercentage,
      'total_time_spent_seconds': instance.totalTimeSpentSeconds,
      'average_score': instance.averageScore,
      'last_practiced_at': instance.lastPracticedAt?.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$UserRoutineStatisticsImpl _$$UserRoutineStatisticsImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRoutineStatisticsImpl(
      totalCompletedRoutines:
          (json['total_completed_routines'] as num?)?.toInt() ?? 0,
      averageScore: (json['average_score'] as num?)?.toDouble() ?? 0.0,
      totalTimeSpentMinutes:
          (json['total_time_spent_minutes'] as num?)?.toInt() ?? 0,
      inProgressRoutines: (json['in_progress_routines'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserRoutineStatisticsImplToJson(
        _$UserRoutineStatisticsImpl instance) =>
    <String, dynamic>{
      'total_completed_routines': instance.totalCompletedRoutines,
      'average_score': instance.averageScore,
      'total_time_spent_minutes': instance.totalTimeSpentMinutes,
      'in_progress_routines': instance.inProgressRoutines,
    };
