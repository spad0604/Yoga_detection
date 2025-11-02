import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response.g.dart';
part 'register_response.freezed.dart';

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    @JsonKey(name: 'userId') required String? userId,
    @JsonKey(name: "userRole") required String? userRole,
    @JsonKey(name: 'accessToken') required String? accessToken,
    @JsonKey(name: 'refreshToken') required String? refreshToken,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);
}
