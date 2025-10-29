import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_body_progress_request.freezed.dart';
part 'update_body_progress_request.g.dart';

@freezed
class UpdateBodyProgressRequest with _$UpdateBodyProgressRequest {
  const factory UpdateBodyProgressRequest({
    // Basic measurements
    double? weightKg,
    double? heightCm,
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
    DateTime? recordedAt,
  }) = _UpdateBodyProgressRequest;

  factory UpdateBodyProgressRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateBodyProgressRequestFromJson(json);
}

