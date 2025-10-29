import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_body_progress_request.freezed.dart';
part 'create_body_progress_request.g.dart';

@freezed
class CreateBodyProgressRequest with _$CreateBodyProgressRequest {
  const factory CreateBodyProgressRequest({
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
  }) = _CreateBodyProgressRequest;

  factory CreateBodyProgressRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBodyProgressRequestFromJson(json);
}

