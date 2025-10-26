import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'history_event.freezed.dart';

@freezed
class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.errorOccurred([BaseException? error]) = HistoryErrorOccurred;
  const factory HistoryEvent.loadPosesByDate({
    required DateTime startDate,
    required DateTime endDate,
    @Default(0) int page,
  }) = HistoryLoadPosesByDate;
  const factory HistoryEvent.loadPoseDetail({required String poseId}) = HistoryLoadPoseDetail;
}
