// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_progress_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BodyProgressResponseImpl _$$BodyProgressResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BodyProgressResponseImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      weightKg: (json['weight_kg'] as num?)?.toDouble(),
      heightCm: (json['height_cm'] as num?)?.toDouble(),
      bmi: (json['bmi'] as num?)?.toDouble(),
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
      recordedAt: DateTime.parse(json['recorded_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$BodyProgressResponseImplToJson(
        _$BodyProgressResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'weight_kg': instance.weightKg,
      'height_cm': instance.heightCm,
      'bmi': instance.bmi,
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
      'recorded_at': instance.recordedAt.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
