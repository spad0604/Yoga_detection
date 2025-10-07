import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'search_yoga_pose_event.freezed.dart';

@freezed
class SearchYogaPoseEvent with _$SearchYogaPoseEvent {
  const factory SearchYogaPoseEvent.errorOccurred([BaseException? error]) = SearchYogaPoseErrorOccurred;
}
