import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_event.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_state.dart';

@injectable
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<HomePageErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(HomePageErrorOccurred(BaseException.from(error)));

    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    HomePageErrorOccurred event,
    Emitter<HomePageState> emit,
  ) {
    emit(state.copyWith(
      status: HomePageStatus.failure,
      error: event.error,
    ));
  }
}
