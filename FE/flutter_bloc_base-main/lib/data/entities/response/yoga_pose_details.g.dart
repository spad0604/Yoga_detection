// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_pose_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YogaPoseDetailsImpl _$$YogaPoseDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$YogaPoseDetailsImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      totalMinutes: (json['total_minutes'] as num).toInt(),
      imageUrl: json['image_url'] as String,
      totalCalories: (json['total_calos'] as num).toInt(),
      level: json['level'] as String,
    );

Map<String, dynamic> _$$YogaPoseDetailsImplToJson(
        _$YogaPoseDetailsImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'total_minutes': instance.totalMinutes,
      'image_url': instance.imageUrl,
      'total_calos': instance.totalCalories,
      'level': instance.level,
    };
