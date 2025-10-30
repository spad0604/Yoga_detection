import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/data/entities/response/post_response.dart';

part 'group_feed_state.freezed.dart';

@freezed
class GroupFeedState with _$GroupFeedState {
  const factory GroupFeedState.initial() = _Initial;
  const factory GroupFeedState.loading() = _Loading;
  const factory GroupFeedState.loaded({required List<PostResponse> feed}) = _Loaded;
  const factory GroupFeedState.error(String message) = _Error;
}
