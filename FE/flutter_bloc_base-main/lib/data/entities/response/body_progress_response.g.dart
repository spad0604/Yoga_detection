// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_progress_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BodyProgressResponseImpl _$$BodyProgressResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BodyProgressResponseImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      weightKg: (json['weightKg'] as num?)?.toDouble(),
      heightCm: (json['heightCm'] as num?)?.toDouble(),
      bmi: (json['bmi'] as num?)?.toDouble(),
      bodyFatPercentage: (json['bodyFatPercentage'] as num?)?.toDouble(),
      muscleMassKg: (json['muscleMassKg'] as num?)?.toDouble(),
      bodyWaterPercentage: (json['bodyWaterPercentage'] as num?)?.toDouble(),
      chestCm: (json['chestCm'] as num?)?.toDouble(),
      waistCm: (json['waistCm'] as num?)?.toDouble(),
      hipCm: (json['hipCm'] as num?)?.toDouble(),
      armCm: (json['armCm'] as num?)?.toDouble(),
      thighCm: (json['thighCm'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      photoUrl: json['photoUrl'] as String?,
      recordedAt: DateTime.parse(json['recordedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BodyProgressResponseImplToJson(
        _$BodyProgressResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'weightKg': instance.weightKg,
      'heightCm': instance.heightCm,
      'bmi': instance.bmi,
      'bodyFatPercentage': instance.bodyFatPercentage,
      'muscleMassKg': instance.muscleMassKg,
      'bodyWaterPercentage': instance.bodyWaterPercentage,
      'chestCm': instance.chestCm,
      'waistCm': instance.waistCm,
      'hipCm': instance.hipCm,
      'armCm': instance.armCm,
      'thighCm': instance.thighCm,
      'notes': instance.notes,
      'photoUrl': instance.photoUrl,
      'recordedAt': instance.recordedAt.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
