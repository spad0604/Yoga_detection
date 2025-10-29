import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/data/entities/request/create_body_progress_request.dart';

part 'my_body_event.freezed.dart';

@freezed
class MyBodyEvent with _$MyBodyEvent {
  const factory MyBodyEvent.loadRequested() = MyBodyLoadRequested;
  const factory MyBodyEvent.refreshRequested() = MyBodyRefreshRequested;
  const factory MyBodyEvent.createRequested(CreateBodyProgressRequest request) = MyBodyCreateRequested;
  const factory MyBodyEvent.loadLatestRequested() = MyBodyLoadLatestRequested;
}

