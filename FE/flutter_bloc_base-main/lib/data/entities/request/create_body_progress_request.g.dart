// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_body_progress_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateBodyProgressRequestImpl _$$CreateBodyProgressRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateBodyProgressRequestImpl(
      weightKg: (json['weight_kg'] as num?)?.toDouble(),
      heightCm: (json['height_cm'] as num?)?.toDouble(),
      bodyFatPercentage: (json['body_fat_percentage'] as num?)?.toDouble(),
      muscleMassKg: (json['muscle_mass_kg'] as num?)?.toDouble(),
      bodyWaterPercentage: (json['body_water_percentage'] as num?)?.toDouble(),
      chestCm: (json['chest_cm'] as num?)?.toDouble(),
      waistCm: (json['waist_cm'] as num?)?.toDouble(),
      hipCm: (json['hip_cm'] as num?)?.toDouble(),
      armCm: (json['arm_cm'] as num?)?.toDouble(),
      thighCm: (json['thigh_cm'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      photoUrl: json['photo_url'] as String?,
      recordedAt: json['recorded_at'] == null
          ? null
          : DateTime.parse(json['recorded_at'] as String),
    );

Map<String, dynamic> _$$CreateBodyProgressRequestImplToJson(
        _$CreateBodyProgressRequestImpl instance) =>
    <String, dynamic>{
      'weight_kg': instance.weightKg,
      'height_cm': instance.heightCm,
      'body_fat_percentage': instance.bodyFatPercentage,
      'muscle_mass_kg': instance.muscleMassKg,
      'body_water_percentage': instance.bodyWaterPercentage,
      'chest_cm': instance.chestCm,
      'waist_cm': instance.waistCm,
      'hip_cm': instance.hipCm,
      'arm_cm': instance.armCm,
      'thigh_cm': instance.thighCm,
      'notes': instance.notes,
      'photo_url': instance.photoUrl,
      'recorded_at': instance.recordedAt?.toIso8601String(),
    };
