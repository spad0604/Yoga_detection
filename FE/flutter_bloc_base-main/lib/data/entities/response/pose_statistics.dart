import 'package:freezed_annotation/freezed_annotation.dart';

part 'pose_statistics.freezed.dart';
part 'pose_statistics.g.dart';

@freezed
class PoseStatistics with _$PoseStatistics {
  const factory PoseStatistics({
    @JsonKey(name: 'poseCode') required String poseCode,
    @JsonKey(name: 'poseName') required String poseName,
    @JsonKey(name: 'totalAttempts') required int totalAttempts,
    @JsonKey(name: 'averageScore') required double averageScore,
    @JsonKey(name: 'highestScore') required double highestScore,
  }) = _PoseStatistics;

  factory PoseStatistics.fromJson(Map<String, dynamic> json) => _$PoseStatisticsFromJson(json);
}
