// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_pose_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YogaPoseDetailsImpl _$$YogaPoseDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$YogaPoseDetailsImpl(
      id: _readId(json, 'id') as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      totalMinutes: (json['minutes'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
      totalCalories: (json['calos'] as num?)?.toInt(),
      level: json['level'] as String?,
    );

Map<String, dynamic> _$$YogaPoseDetailsImplToJson(
        _$YogaPoseDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'minutes': instance.totalMinutes,
      'imageUrl': instance.imageUrl,
      'calos': instance.totalCalories,
      'level': instance.level,
    };
