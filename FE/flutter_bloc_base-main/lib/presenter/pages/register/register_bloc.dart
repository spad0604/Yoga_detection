import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/pages/register/register_event.dart';
import 'package:flutter_starter/presenter/pages/register/register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterErrorOccurred>(_onErrorOccurred);
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
}
