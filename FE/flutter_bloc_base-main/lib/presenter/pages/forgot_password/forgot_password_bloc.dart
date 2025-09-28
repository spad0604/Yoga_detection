import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_event.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_state.dart';

@injectable
class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(const ForgotPasswordState()) {
    on<ForgotPasswordErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ForgotPasswordErrorOccurred(BaseException.from(error)));

    super.onError(error, stackTrace);
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
