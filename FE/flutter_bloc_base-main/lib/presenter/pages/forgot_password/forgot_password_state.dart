import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'forgot_password_state.freezed.dart';

enum ForgotPasswordStatus {
  initial,
  loading,
  success,
  failure,
  otpSendSuccess,
  otpVerifySuccess,
}

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(ForgotPasswordStatus.initial) ForgotPasswordStatus status,
    String? email,
    BaseException? error,
  }) = _ForgotPasswordState;
}
