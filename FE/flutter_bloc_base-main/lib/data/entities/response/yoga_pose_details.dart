import 'package:freezed_annotation/freezed_annotation.dart';
part 'yoga_pose_details.g.dart';
part 'yoga_pose_details.freezed.dart';

// Top-level helper for JsonKey.readValue. Prefer 'id', fallback to 'code'.
Object? _readId(Map<dynamic, dynamic> json, String key) {
  final v = json['id'] ?? json['code'];
  return v?.toString(); // in case server returns numeric ids
}

// Prefer 'tutorialVideoUrl', fallback to 'videoUrl' or 'youtubeUrl'.
Object? _readVideoUrl(Map<dynamic, dynamic> json, String key) {
  return json['tutorialVideoUrl'] ?? json['videoUrl'] ?? json['youtubeUrl'];
}

Object? _readMinutes(Map<dynamic, dynamic> json, String key) {
  return json['minutes'] ?? json['totalMinutes'];
}

Object? _readCalories(Map<dynamic, dynamic> json, String key) {
  return json['calos'] ?? json['totalCalos'];
}

@freezed
class YogaPoseDetails with _$YogaPoseDetails {
  const factory YogaPoseDetails({
    @JsonKey(readValue: _readId) required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(readValue: _readMinutes) int? totalMinutes,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(readValue: _readCalories) int? totalCalories,
    @JsonKey(name: 'level') String? level,
    @JsonKey(readValue: _readVideoUrl) String? tutorialVideoUrl,
  }) = _YogaPoseDetails;

  factory YogaPoseDetails.fromJson(Map<String, dynamic> json) =>
      _$YogaPoseDetailsFromJson(json);
}
