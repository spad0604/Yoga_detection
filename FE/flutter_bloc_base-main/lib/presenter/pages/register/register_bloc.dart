import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/usecases/register.dart';
import 'package:flutter_starter/services/oauth_token_manager/oauth_token_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/pages/register/register_event.dart';
import 'package:flutter_starter/presenter/pages/register/register_state.dart';
import 'package:flutter_starter/data/entities/request/register_params.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _register;

  final OauthTokenManager _oauthTokenManager;

  RegisterBloc({required RegisterUseCase register, required OauthTokenManager oauthTokenManager})
      : _register = register,
        _oauthTokenManager = oauthTokenManager,
        super(const RegisterState()) {
    on<RegisterErrorOccurred>(_onErrorOccurred);
    on<RegisterStarted>(_onRegisterStarted);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(RegisterErrorOccurred(BaseException.from(error)));

    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    RegisterErrorOccurred event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      status: RegisterStatus.failure,
      error: event.error,
    ));
  }

  FutureOr<void> _onRegisterStarted(
    RegisterStarted event,
    Emitter<RegisterState> emit,
  ) async {
    // Validate fields
    String? firstNameErr;
    String? lastNameErr;
    String? emailErr;
    String? phoneErr;
    String? passwordErr;
    String? confirmPasswordErr;
    String? birthDateErr;

    if (event.firstName.trim().isEmpty) firstNameErr = 'First name is required';
    if (event.lastName.trim().isEmpty) lastNameErr = 'Last name is required';

    final emailRegex = RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}");
    if (!emailRegex.hasMatch(event.email.trim())) emailErr = 'Invalid email address';

    if (event.phone.trim().isEmpty) phoneErr = 'Phone number is required';

    final upper = RegExp(r"[A-Z]");
    final special = RegExp(r"[^A-Za-z0-9]");
    if (!upper.hasMatch(event.password) || !special.hasMatch(event.password)) {
      passwordErr = 'Password must have an uppercase letter and a special character';
    }

    if (event.password != event.confirmPassword) {
      confirmPasswordErr = 'Confirm password does not match';
    }

    // birthDate should be yyyy-MM-dd
    try {
      final parts = event.birthDate.split('-');
      if (parts.length != 3) throw Exception();
      final y = int.parse(parts[0]);
      final m = int.parse(parts[1]);
      final d = int.parse(parts[2]);
      DateTime(y, m, d);
    } catch (_) {
      birthDateErr = 'Birth date must be yyyy-MM-dd';
    }

    final hasError = firstNameErr != null ||
        lastNameErr != null ||
        emailErr != null ||
        phoneErr != null ||
        passwordErr != null ||
        confirmPasswordErr != null ||
        birthDateErr != null;

    if (hasError) {
      emit(state.copyWith(
        status: RegisterStatus.failure,
        firstNameError: firstNameErr,
        lastNameError: lastNameErr,
        emailError: emailErr,
        phoneError: phoneErr,
        passwordError: passwordErr,
        confirmPasswordError: confirmPasswordErr,
        birthDateError: birthDateErr,
      ));
      return;
    }

    emit(state.copyWith(status: RegisterStatus.loading));

    try {
      final response = await _register.call(
        RegisterParams(
          email: event.email,
          password: event.password,
          firstName: event.firstName,
          lastName: event.lastName,
          birthDate: event.birthDate,
        ),
      );

      _oauthTokenManager.saveAccessToken(response.accessToken);
      _oauthTokenManager.saveRefreshToken(response.refreshToken);

      emit(state.copyWith(status: RegisterStatus.success));
    } catch (e) {
      emit(state.copyWith(status: RegisterStatus.failure, error: BaseException.from(e)));
    }
  }
}
