import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/request/change_password.dart';
import 'package:flutter_starter/data/usecases/change_password_uc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_event.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_state.dart';

@injectable
class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ChangePasswordUseCase _changePassword;

  ForgotPasswordBloc({required ChangePasswordUseCase changePassword})
      : _changePassword = changePassword,
        super(const ForgotPasswordState()) {
    on<ForgotPasswordErrorOccurred>(_onErrorOccurred);

    on<ChangePasswordRequested>(_onChangePasswordRequested);

    on<SetEmailEvent>((event, emit) => setEmail(event, emit));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ForgotPasswordErrorOccurred(BaseException.from(error)));

    super.onError(error, stackTrace);
  }

  void setEmail(SetEmailEvent event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _onChangePasswordRequested(
    ChangePasswordRequested event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));

    await _changePassword(
      ChangePasswordRequest(
        email: state.email!,
        newPassword: event.password,
        oldPassword: event.confirmPassword,
      ),
    );

    emit(state.copyWith(status: ForgotPasswordStatus.success));
  }

  FutureOr<void> _onErrorOccurred(
    ForgotPasswordErrorOccurred event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(
      status: ForgotPasswordStatus.failure,
      error: event.error,
    ));
  }
}
