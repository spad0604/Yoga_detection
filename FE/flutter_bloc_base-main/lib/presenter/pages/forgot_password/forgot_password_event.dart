import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'forgot_password_event.freezed.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.errorOccurred([BaseException? error]) = ForgotPasswordErrorOccurred;
}
