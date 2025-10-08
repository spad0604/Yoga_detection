import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/data/usecases/login.dart';
import 'package:flutter_starter/presenter/pages/login/login_event.dart';
import 'package:flutter_starter/presenter/pages/login/login_state.dart';
import 'package:flutter_starter/services/oauth_token_manager/oauth_token_manager.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _login;

  final OauthTokenManager _oauthTokenManager;

  LoginBloc({required LoginUseCase login, required OauthTokenManager oauthTokenManager})
      : _login = login,
        _oauthTokenManager = oauthTokenManager,
        super(const LoginState()) {
    on<LoginErrorOccurred>(_onErrorOccurred);
    on<LoginEmailChanged>(_onEmailChanged, transformer: droppable());
    on<LoginPasswordChanged>(_onPasswordChanged, transformer: droppable());
    on<LoginStarted>(_onLoginStarted, transformer: droppable());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(LoginErrorOccurred(BaseException.from(error)));

    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    LoginErrorOccurred event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      status: LoginStatus.failure,
      error: event.error,
    ));
  }

  FutureOr<void> _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    // clear email error on change
    emit(state.copyWith(
      email: event.email,
      emailError: null,
      error: null,
    ));
  }

  FutureOr<void> _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    // clear password error on change
    emit(state.copyWith(
      password: event.password,
      passwordError: null,
      error: null,
    ));
  }

  FutureOr _onLoginStarted(
    LoginStarted event,
    Emitter<LoginState> emit,
  ) async {
    // validate email
    final email = state.email.trim();
    final password = state.password;

    // simple email regex
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}");
    if (!emailRegex.hasMatch(email)) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        emailError: 'Invalid email format',
        error: ValidationException('Invalid email address'),
      ));
      return;
    }

    // password: at least one uppercase and one special char
    final upperRegex = RegExp(r"[A-Z]");
    // match any non-alphanumeric char (special)
    final specialRegex = RegExp(r"[^A-Za-z0-9]");

    if (!upperRegex.hasMatch(password) || !specialRegex.hasMatch(password)) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        passwordError: 'Password must contain at least one uppercase and one special character',
        error: ValidationException('Password requirements not met'),
      ));
      return;
    }

    emit(state.copyWith(
      status: LoginStatus.submitting,
    ));

    try {
      final account = await _login((
        email: email,
        password: password,
      ));

      _oauthTokenManager.saveAccessToken(account?.accessToken ?? '');
      _oauthTokenManager.saveRefreshToken(account?.refreshToken ?? '');
      emit(state.copyWith(
        status: LoginStatus.success,
        account: account,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        error: BaseException.from(e),
      ));
    }
  }
}
