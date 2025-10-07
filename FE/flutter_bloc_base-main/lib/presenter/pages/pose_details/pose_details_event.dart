import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'pose_details_event.freezed.dart';

@freezed
class PoseDetailsEvent with _$PoseDetailsEvent {
  const factory PoseDetailsEvent.errorOccurred([BaseException? error]) = PoseDetailsErrorOccurred;

  const factory PoseDetailsEvent.getDetails(String code) = PoseDetailsGetDetails;
}
