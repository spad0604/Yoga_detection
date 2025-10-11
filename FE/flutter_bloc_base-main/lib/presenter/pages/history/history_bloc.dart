import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/pages/history/history_event.dart';
import 'package:flutter_starter/presenter/pages/history/history_state.dart';

@injectable
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(const HistoryState()) {
    on<HistoryErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(HistoryErrorOccurred(BaseException.from(error)));

    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    HistoryErrorOccurred event,
    Emitter<HistoryState> emit,
  ) {
    emit(state.copyWith(
      status: HistoryStatus.failure,
      error: event.error,
    ));
  }
}
