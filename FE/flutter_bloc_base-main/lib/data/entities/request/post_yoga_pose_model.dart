import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_yoga_pose_model.freezed.dart';
part 'post_yoga_pose_model.g.dart';

@freezed
class PoseLandmarkData with _$PoseLandmarkData {
  const factory PoseLandmarkData({
    required String type,
    required double x,
    required double y,
    required double z,
  }) = _PoseLandmarkData;

  factory PoseLandmarkData.fromJson(Map<String, dynamic> json) => _$PoseLandmarkDataFromJson(json);
}

@freezed
class PostYogaPoseModel with _$PostYogaPoseModel {
  const factory PostYogaPoseModel({
    @JsonKey(name: "poseId") required String poseId,
    @JsonKey(name: "landmarks") required List<PoseLandmarkData> landmarks,
    @JsonKey(name: "imageBase64") String? imageBase64,
    @JsonKey(name: "timestamp") required String timestamp,
  }) = _PostYogaPoseModel;

  factory PostYogaPoseModel.fromJson(Map<String, dynamic> json) =>
      _$PostYogaPoseModelFromJson(json);
}
