import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/presenter/pages/history/history_bloc.dart';
import 'package:flutter_starter/presenter/pages/history/history_state.dart';

class HistoryStatusSelector
    extends BlocSelector<HistoryBloc, HistoryState, HistoryStatus> {
  HistoryStatusSelector({
    required Widget Function(HistoryStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class HistoryStatusListener extends BlocListener<HistoryBloc, HistoryState> {
  HistoryStatusListener({
    required Iterable<HistoryStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
