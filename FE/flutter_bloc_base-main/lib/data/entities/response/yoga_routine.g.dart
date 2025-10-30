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
      durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
      estimatedCalories: (json['estimatedCalories'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isPremium: json['isPremium'] as bool? ?? false,
      totalPoses: (json['totalPoses'] as num?)?.toInt(),
      poses: (json['poses'] as List<dynamic>?)
          ?.map((e) => RoutinePose.fromJson(e as Map<String, dynamic>))
          .toList(),
      userProgress: json['userProgress'] == null
          ? null
          : UserRoutineProgressInfo.fromJson(
              json['userProgress'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$YogaRoutineImplToJson(_$YogaRoutineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'level': instance.level,
      'durationMinutes': instance.durationMinutes,
      'estimatedCalories': instance.estimatedCalories,
      'imageUrl': instance.imageUrl,
      'tags': instance.tags,
      'isPremium': instance.isPremium,
      'totalPoses': instance.totalPoses,
      'poses': instance.poses,
      'userProgress': instance.userProgress,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$RoutinePoseImpl _$$RoutinePoseImplFromJson(Map<String, dynamic> json) =>
    _$RoutinePoseImpl(
      id: json['id'] as String,
      poseCode: json['poseCode'] as String,
      poseName: json['poseName'] as String?,
      orderIndex: (json['orderIndex'] as num).toInt(),
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
      repetitions: (json['repetitions'] as num?)?.toInt() ?? 1,
      restAfterSeconds: (json['restAfterSeconds'] as num?)?.toInt() ?? 5,
      instructions: json['instructions'] as String?,
      poseImageUrl: json['pose_image_url'] as String?,
      poseDescription: json['pose_description'] as String?,
    );

Map<String, dynamic> _$$RoutinePoseImplToJson(_$RoutinePoseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poseCode': instance.poseCode,
      'poseName': instance.poseName,
      'orderIndex': instance.orderIndex,
      'durationSeconds': instance.durationSeconds,
      'repetitions': instance.repetitions,
      'restAfterSeconds': instance.restAfterSeconds,
      'instructions': instance.instructions,
      'pose_image_url': instance.poseImageUrl,
      'pose_description': instance.poseDescription,
    };

_$UserRoutineProgressInfoImpl _$$UserRoutineProgressInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRoutineProgressInfoImpl(
      completionPercentage:
          (json['completionPercentage'] as num?)?.toDouble() ?? 0.0,
      isCompleted: json['isCompleted'] as bool? ?? false,
      currentPoseIndex: (json['currentPoseIndex'] as num?)?.toInt() ?? 0,
      lastPracticedAt: json['lastPracticedAt'] == null
          ? null
          : DateTime.parse(json['lastPracticedAt'] as String),
      averageScore: (json['averageScore'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$UserRoutineProgressInfoImplToJson(
        _$UserRoutineProgressInfoImpl instance) =>
    <String, dynamic>{
      'completionPercentage': instance.completionPercentage,
      'isCompleted': instance.isCompleted,
      'currentPoseIndex': instance.currentPoseIndex,
      'lastPracticedAt': instance.lastPracticedAt?.toIso8601String(),
      'averageScore': instance.averageScore,
    };
