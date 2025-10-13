import 'package:freezed_annotation/freezed_annotation.dart';
part 'yoga_pose_details.g.dart';
part 'yoga_pose_details.freezed.dart';

// Top-level helper for JsonKey.readValue. Prefer 'id', fallback to 'code'.
Object? _readId(Map<dynamic, dynamic> json, String key) {
  final v = json['id'] ?? json['code'];
  return v?.toString(); // in case server returns numeric ids
}

@freezed
class YogaPoseDetails with _$YogaPoseDetails {
  const factory YogaPoseDetails({
    @JsonKey(readValue: _readId) required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'minutes') int? totalMinutes,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'calos') int? totalCalories,
    @JsonKey(name: 'level') String? level,
  }) = _YogaPoseDetails;

  factory YogaPoseDetails.fromJson(Map<String, dynamic> json) => _$YogaPoseDetailsFromJson(json);
}
