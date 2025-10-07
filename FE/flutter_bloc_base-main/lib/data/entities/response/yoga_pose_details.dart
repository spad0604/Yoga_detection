import 'package:freezed_annotation/freezed_annotation.dart';
part 'yoga_pose_details.g.dart';
part 'yoga_pose_details.freezed.dart';

@freezed
class YogaPoseDetails with _$YogaPoseDetails {
  const factory YogaPoseDetails(
      {@JsonKey(name: 'code') required String code,
      @JsonKey(name: 'name') required String name,
      @JsonKey(name: 'description') required String description,
      @JsonKey(name: 'total_minutes') required int totalMinutes,
      @JsonKey(name: 'image_url') required String imageUrl,
      @JsonKey(name: 'total_calos') required int totalCalories,
      @JsonKey(name: 'level') required String level}) = _YogaPoseDetails;

  factory YogaPoseDetails.fromJson(Map<String, dynamic> json) => _$YogaPoseDetailsFromJson(json);
}
