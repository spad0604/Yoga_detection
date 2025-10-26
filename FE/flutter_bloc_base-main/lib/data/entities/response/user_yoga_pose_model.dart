import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_yoga_pose_model.freezed.dart';
part 'user_yoga_pose_model.g.dart';

@freezed
class UserYogaPoseModel with _$UserYogaPoseModel {
  const factory UserYogaPoseModel({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "poseCode") required String poseCode,
    @JsonKey(name: "imageUrl") String? imageUrl,
    @JsonKey(name: "score") required double score,
    @JsonKey(name: "feedback") required String feedback,
    @JsonKey(name: "createAt") required DateTime createAt,
  }) = _UserYogaPoseModel;

  factory UserYogaPoseModel.fromJson(Map<String, dynamic> json) =>
      _$UserYogaPoseModelFromJson(json);
}
