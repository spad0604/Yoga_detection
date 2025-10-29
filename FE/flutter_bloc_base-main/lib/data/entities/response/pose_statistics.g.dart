// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pose_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoseStatisticsImpl _$$PoseStatisticsImplFromJson(Map<String, dynamic> json) =>
    _$PoseStatisticsImpl(
      poseCode: json['poseCode'] as String,
      poseName: json['poseName'] as String,
      totalAttempts: (json['totalAttempts'] as num).toInt(),
      averageScore: (json['averageScore'] as num).toDouble(),
      highestScore: (json['highestScore'] as num).toDouble(),
    );

Map<String, dynamic> _$$PoseStatisticsImplToJson(
        _$PoseStatisticsImpl instance) =>
    <String, dynamic>{
      'poseCode': instance.poseCode,
      'poseName': instance.poseName,
      'totalAttempts': instance.totalAttempts,
      'averageScore': instance.averageScore,
      'highestScore': instance.highestScore,
    };
