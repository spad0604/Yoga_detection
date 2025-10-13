// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoga_pose_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YogaPoseItemImpl _$$YogaPoseItemImplFromJson(Map<String, dynamic> json) =>
    _$YogaPoseItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String?,
      minutes: (json['minutes'] as num).toInt(),
      calos: (json['calos'] as num).toInt(),
    );

Map<String, dynamic> _$$YogaPoseItemImplToJson(_$YogaPoseItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'minutes': instance.minutes,
      'calos': instance.calos,
    };
