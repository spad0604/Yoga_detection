import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_bloc.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_state.dart';

class AccountPageStatusSelector
    extends BlocSelector<AccountPageBloc, AccountPageState, AccountPageStatus> {
  AccountPageStatusSelector({
    required Widget Function(AccountPageStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class AccountPageStatusListener extends BlocListener<AccountPageBloc, AccountPageState> {
  AccountPageStatusListener({
    required Iterable<AccountPageStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
