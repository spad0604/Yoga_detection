import 'package:flutter_starter/data/entities/response/post_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_feed_state.freezed.dart';

@freezed
class SocialFeedState with _$SocialFeedState {
  const factory SocialFeedState.initial() = _Initial;
  const factory SocialFeedState.loading() = _Loading;
  const factory SocialFeedState.loaded({required List<PostResponse> feed}) = _Loaded;
  const factory SocialFeedState.error(String message) = _Error;
}


