// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pose_history_attempts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoseHistoryAttemptsImpl _$$PoseHistoryAttemptsImplFromJson(
        Map<String, dynamic> json) =>
    _$PoseHistoryAttemptsImpl(
      id: json['id'] as String,
      poseCode: json['poseCode'] as String,
      poseName: json['poseName'] as String,
      imageUrl: json['imageUrl'] as String?,
      score: (json['score'] as num).toDouble(),
      feedback: json['feedback'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PoseHistoryAttemptsImplToJson(
        _$PoseHistoryAttemptsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poseCode': instance.poseCode,
      'poseName': instance.poseName,
      'imageUrl': instance.imageUrl,
      'score': instance.score,
      'feedback': instance.feedback,
      'createdAt': instance.createdAt.toIso8601String(),
    };
