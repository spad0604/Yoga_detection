import 'package:flutter_starter/data/entities/response/post_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'social_feed_event.dart' show socialFeedScopePublic;

part 'social_feed_state.freezed.dart';

@freezed
class SocialFeedState with _$SocialFeedState {
  const factory SocialFeedState.initial({@Default(socialFeedScopePublic) String scope}) = _Initial;
  const factory SocialFeedState.loading({required String scope}) = _Loading;
  const factory SocialFeedState.loaded({required String scope, required List<PostResponse> feed}) = _Loaded;
  const factory SocialFeedState.error({required String scope, required String message}) = _Error;
}

