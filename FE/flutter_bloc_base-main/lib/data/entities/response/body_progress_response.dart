import 'package:freezed_annotation/freezed_annotation.dart';

part 'body_progress_response.freezed.dart';
part 'body_progress_response.g.dart';

@freezed
class BodyProgressResponse with _$BodyProgressResponse {
  const factory BodyProgressResponse({
    required String id,
    @JsonKey(name: 'userId') required String userId,
    // Basic measurements
    @JsonKey(name: 'weightKg') double? weightKg,
    @JsonKey(name: 'heightCm') double? heightCm,
    double? bmi,
    // Body composition
    @JsonKey(name: 'bodyFatPercentage') double? bodyFatPercentage,
    @JsonKey(name: 'muscleMassKg') double? muscleMassKg,
    @JsonKey(name: 'bodyWaterPercentage') double? bodyWaterPercentage,
    // Body measurements (circumferences)
    @JsonKey(name: 'chestCm') double? chestCm,
    @JsonKey(name: 'waistCm') double? waistCm,
    @JsonKey(name: 'hipCm') double? hipCm,
    @JsonKey(name: 'armCm') double? armCm,
    @JsonKey(name: 'thighCm') double? thighCm,
    // Additional info
    String? notes,
    @JsonKey(name: 'photoUrl') String? photoUrl,
    @JsonKey(name: 'recordedAt') required DateTime recordedAt,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  }) = _BodyProgressResponse;

  factory BodyProgressResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyProgressResponseFromJson(json);
}
