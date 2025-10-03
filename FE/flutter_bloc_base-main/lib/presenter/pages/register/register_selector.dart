import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/presenter/pages/register/register_bloc.dart';
import 'package:flutter_starter/presenter/pages/register/register_state.dart';

class RegisterStatusSelector
    extends BlocSelector<RegisterBloc, RegisterState, RegisterStatus> {
  RegisterStatusSelector({
    required Widget Function(RegisterStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class RegisterStatusListener extends BlocListener<RegisterBloc, RegisterState> {
  RegisterStatusListener({
    required Iterable<RegisterStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
