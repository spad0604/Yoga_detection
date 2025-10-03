import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_bloc.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password_state.dart';

class ForgotPasswordStatusSelector
    extends BlocSelector<ForgotPasswordBloc, ForgotPasswordState, ForgotPasswordStatus> {
  ForgotPasswordStatusSelector({
    required Widget Function(ForgotPasswordStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class ForgotPasswordStatusListener extends BlocListener<ForgotPasswordBloc, ForgotPasswordState> {
  ForgotPasswordStatusListener({
    required Iterable<ForgotPasswordStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
