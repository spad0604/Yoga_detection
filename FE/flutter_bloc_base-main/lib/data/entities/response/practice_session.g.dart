// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practice_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PracticeSessionImpl _$$PracticeSessionImplFromJson(
        Map<String, dynamic> json) =>
    _$PracticeSessionImpl(
      sessionId: json['sessionId'] as String,
      routineId: json['routineId'] as String,
      routineName: json['routineName'] as String,
      userId: json['userId'] as String,
      status: $enumDecode(_$SessionStatusEnumMap, json['status']),
      currentPoseIndex: (json['currentPoseIndex'] as num).toInt(),
      totalPoses: (json['totalPoses'] as num).toInt(),
      currentPoseCode: json['currentPoseCode'] as String?,
      currentPoseName: json['currentPoseName'] as String?,
      currentPoseDescription: json['currentPoseDescription'] as String?,
      currentPoseImageUrl: json['currentPoseImageUrl'] as String?,
      currentPoseDurationSeconds:
          (json['currentPoseDurationSeconds'] as num?)?.toInt(),
      allPoses: (json['allPoses'] as List<dynamic>?)
              ?.map((e) => RoutinePoseInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      completedPoses: (json['completedPoses'] as List<dynamic>?)
              ?.map((e) =>
                  PoseSubmissionResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      averageScore: (json['averageScore'] as num?)?.toDouble() ?? 0.0,
      totalTimeSpentSeconds:
          (json['totalTimeSpentSeconds'] as num?)?.toInt() ?? 0,
      startedAt: DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$PracticeSessionImplToJson(
        _$PracticeSessionImpl instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'routineId': instance.routineId,
      'routineName': instance.routineName,
      'userId': instance.userId,
      'status': _$SessionStatusEnumMap[instance.status]!,
      'currentPoseIndex': instance.currentPoseIndex,
      'totalPoses': instance.totalPoses,
      'currentPoseCode': instance.currentPoseCode,
      'currentPoseName': instance.currentPoseName,
      'currentPoseDescription': instance.currentPoseDescription,
      'currentPoseImageUrl': instance.currentPoseImageUrl,
      'currentPoseDurationSeconds': instance.currentPoseDurationSeconds,
      'allPoses': instance.allPoses,
      'completedPoses': instance.completedPoses,
      'averageScore': instance.averageScore,
      'totalTimeSpentSeconds': instance.totalTimeSpentSeconds,
      'startedAt': instance.startedAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
    };

const _$SessionStatusEnumMap = {
  SessionStatus.inProgress: 'IN_PROGRESS',
  SessionStatus.completed: 'COMPLETED',
  SessionStatus.abandoned: 'ABANDONED',
};

_$RoutinePoseInfoImpl _$$RoutinePoseInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$RoutinePoseInfoImpl(
      poseCode: json['poseCode'] as String,
      poseName: json['poseName'] as String,
      orderIndex: (json['orderIndex'] as num).toInt(),
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$RoutinePoseInfoImplToJson(
        _$RoutinePoseInfoImpl instance) =>
    <String, dynamic>{
      'poseCode': instance.poseCode,
      'poseName': instance.poseName,
      'orderIndex': instance.orderIndex,
      'durationSeconds': instance.durationSeconds,
      'imageUrl': instance.imageUrl,
      'isCompleted': instance.isCompleted,
    };

_$PoseSubmissionResultImpl _$$PoseSubmissionResultImplFromJson(
        Map<String, dynamic> json) =>
    _$PoseSubmissionResultImpl(
      poseCode: json['poseCode'] as String,
      poseName: json['poseName'] as String,
      imageUrl: json['imageUrl'] as String?,
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
      feedback: json['feedback'] as String?,
      timeSpentSeconds: (json['timeSpentSeconds'] as num?)?.toInt() ?? 0,
      submittedAt: DateTime.parse(json['submittedAt'] as String),
    );

Map<String, dynamic> _$$PoseSubmissionResultImplToJson(
        _$PoseSubmissionResultImpl instance) =>
    <String, dynamic>{
      'poseCode': instance.poseCode,
      'poseName': instance.poseName,
      'imageUrl': instance.imageUrl,
      'score': instance.score,
      'feedback': instance.feedback,
      'timeSpentSeconds': instance.timeSpentSeconds,
      'submittedAt': instance.submittedAt.toIso8601String(),
    };
