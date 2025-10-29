import 'package:freezed_annotation/freezed_annotation.dart';

part 'body_progress_response.freezed.dart';
part 'body_progress_response.g.dart';

@freezed
class BodyProgressResponse with _$BodyProgressResponse {
  const factory BodyProgressResponse({
    required String id,
    required String userId,
    // Basic measurements
    double? weightKg,
    double? heightCm,
    double? bmi,
    // Body composition
    double? bodyFatPercentage,
    double? muscleMassKg,
    double? bodyWaterPercentage,
    // Body measurements (circumferences)
    double? chestCm,
    double? waistCm,
    double? hipCm,
    double? armCm,
    double? thighCm,
    // Additional info
    String? notes,
    String? photoUrl,
    required DateTime recordedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _BodyProgressResponse;

  factory BodyProgressResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyProgressResponseFromJson(json);
}

