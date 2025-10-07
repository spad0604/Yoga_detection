import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'forgot_password_event.freezed.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.errorOccurred([BaseException? error]) =
      ForgotPasswordErrorOccurred;

  const factory ForgotPasswordEvent.changePassword({
    required String password,
    required String confirmPassword,
  }) = ChangePasswordRequested;

  const factory ForgotPasswordEvent.setEmail(String email) = SetEmailEvent;

  const factory ForgotPasswordEvent.sendOtp(String email) = SendOtpRequested;

  const factory ForgotPasswordEvent.verifyOtp({
    required String email,
    required String otp,
  }) = VerifyOtpRequested;
}
