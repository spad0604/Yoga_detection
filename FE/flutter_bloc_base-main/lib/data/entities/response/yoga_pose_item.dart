import 'package:freezed_annotation/freezed_annotation.dart';

part 'yoga_pose_item.freezed.dart';
part 'yoga_pose_item.g.dart';

@freezed
class YogaPoseItem with _$YogaPoseItem {
  const factory YogaPoseItem({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'minutes') required int minutes,
    @JsonKey(name: 'calos') required int calos,
  }) = _YogaPoseItem;

  factory YogaPoseItem.fromJson(Map<String, dynamic> json) => _$YogaPoseItemFromJson(json);
}
