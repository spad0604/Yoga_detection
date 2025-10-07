import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/pages/search_yoga_pose/search_yoga_pose_event.dart';
import 'package:flutter_starter/presenter/pages/search_yoga_pose/search_yoga_pose_state.dart';

@injectable
class SearchYogaPoseBloc extends Bloc<SearchYogaPoseEvent, SearchYogaPoseState> {
  SearchYogaPoseBloc() : super(const SearchYogaPoseState()) {
    on<SearchYogaPoseErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SearchYogaPoseErrorOccurred(BaseException.from(error)));

    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    SearchYogaPoseErrorOccurred event,
    Emitter<SearchYogaPoseState> emit,
  ) {
    emit(state.copyWith(
      status: SearchYogaPoseStatus.failure,
      error: event.error,
    ));
  }
}
