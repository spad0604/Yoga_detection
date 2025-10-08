import 'package:freezed_annotation/freezed_annotation.dart';
part 'verify_otp.g.dart';
part 'verify_otp.freezed.dart';


@freezed
class VerifyOtpResponse with _$VerifyOtpResponse {
  const factory VerifyOtpResponse({
    @JsonKey(name: 'token') required String? token,
  }) = _VerifyOtpResponse;

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) => _$VerifyOtpResponseFromJson(json);
}
