// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_routine_progress_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateRoutineProgressRequestImpl _$$UpdateRoutineProgressRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateRoutineProgressRequestImpl(
      routineId: json['routine_id'] as String,
      completedPoseCode: json['completed_pose_code'] as String,
      poseScore: (json['pose_score'] as num?)?.toDouble(),
      timeSpentSeconds: (json['time_spent_seconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UpdateRoutineProgressRequestImplToJson(
        _$UpdateRoutineProgressRequestImpl instance) =>
    <String, dynamic>{
      'routine_id': instance.routineId,
      'completed_pose_code': instance.completedPoseCode,
      'pose_score': instance.poseScore,
      'time_spent_seconds': instance.timeSpentSeconds,
    };
