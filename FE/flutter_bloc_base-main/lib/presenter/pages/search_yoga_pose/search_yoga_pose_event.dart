import 'package:flutter_starter/data/usecases/get_list_yoga_poses_uc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'search_yoga_pose_event.freezed.dart';

@freezed
class SearchYogaPoseEvent with _$SearchYogaPoseEvent {
  const factory SearchYogaPoseEvent.errorOccurred([BaseException? error]) =
      SearchYogaPoseErrorOccurred;

  const factory SearchYogaPoseEvent.started(GetListYogaPosesParams params) = SearchYogaPoseStarted;
}
