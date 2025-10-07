import 'package:freezed_annotation/freezed_annotation.dart';
part 'request_change_password.freezed.dart';
part 'request_change_password.g.dart';

@freezed
class RequestChangePassword with _$RequestChangePassword {
  const factory RequestChangePassword({
    @JsonKey(name: 'email') required String email,
  }) = _RequestChangePassword;

  factory RequestChangePassword.fromJson(Map<String, dynamic> json) =>
      _$RequestChangePasswordFromJson(json);
}
