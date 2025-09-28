import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'register_state.freezed.dart';

enum RegisterStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(RegisterStatus.initial) RegisterStatus status,
    BaseException? error,
    String? firstNameError,
    String? lastNameError,
    String? emailError,
    String? phoneError,
    String? passwordError,
    String? confirmPasswordError,
    String? birthDateError,
  }) = _RegisterState;
}
