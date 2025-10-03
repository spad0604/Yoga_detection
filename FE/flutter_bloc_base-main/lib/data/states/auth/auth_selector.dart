import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:flutter_starter/data/states/auth/auth_bloc.dart';
import 'package:flutter_starter/data/states/auth/auth_state.dart';

class CurrentAccountSelector extends BlocSelector<AuthBloc, AuthState, RegisterResponse?> {
  CurrentAccountSelector({
    required Widget Function(RegisterResponse?) builder,
  }) : super(
          selector: (state) => state.account,
          builder: (_, account) => builder(account),
        );
}
