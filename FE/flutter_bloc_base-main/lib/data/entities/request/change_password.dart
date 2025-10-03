import 'package:freezed_annotation/freezed_annotation.dart';
part 'change_password.freezed.dart';
part 'change_password.g.dart';

@freezed
class ChangePasswordRequest with _$ChangePasswordRequest {
  const factory ChangePasswordRequest({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'olaPassword') required String oldPassword,
    @JsonKey(name: 'newPassword') required String newPassword,
  }) = _ChangePasswordRequest;

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);
}
