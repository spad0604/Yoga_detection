// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_yoga_pose_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserYogaPoseModelImpl _$$UserYogaPoseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserYogaPoseModelImpl(
      id: json['id'] as String,
      poseCode: json['poseCode'] as String,
      imageUrl: json['imageUrl'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      feedback: json['feedback'] as String?,
      createAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$UserYogaPoseModelImplToJson(
        _$UserYogaPoseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poseCode': instance.poseCode,
      'imageUrl': instance.imageUrl,
      'score': instance.score,
      'feedback': instance.feedback,
      'createdAt': instance.createAt.toIso8601String(),
    };
