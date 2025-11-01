import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_login_params.freezed.dart';
part 'google_login_params.g.dart';

@freezed
class GoogleLoginParams with _$GoogleLoginParams {
  const factory GoogleLoginParams({
    @JsonKey(name: 'idToken') required String idToken,
    @JsonKey(name: 'fcmToken') String? fcmToken,
  }) = _GoogleLoginParams;

  factory GoogleLoginParams.fromJson(Map<String, Object?> json) =>
      _$GoogleLoginParamsFromJson(json);
}
