// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_yoga_pose_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoseLandmarkDataImpl _$$PoseLandmarkDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PoseLandmarkDataImpl(
      type: json['type'] as String,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
    );

Map<String, dynamic> _$$PoseLandmarkDataImplToJson(
        _$PoseLandmarkDataImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

_$PostYogaPoseModelImpl _$$PostYogaPoseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PostYogaPoseModelImpl(
      poseId: json['poseId'] as String,
      landmarks: (json['landmarks'] as List<dynamic>)
          .map((e) => PoseLandmarkData.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageBase64: json['imageBase64'] as String?,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$PostYogaPoseModelImplToJson(
        _$PostYogaPoseModelImpl instance) =>
    <String, dynamic>{
      'poseId': instance.poseId,
      'landmarks': instance.landmarks,
      'imageBase64': instance.imageBase64,
      'timestamp': instance.timestamp,
    };
