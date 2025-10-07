import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/usecases/get_list_yoga_poses_uc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_event.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_state.dart';

@injectable
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetListYogaPosesUc _getListYogaPoses;

  HomePageBloc({
    required GetListYogaPosesUc getListYogaPoses,
  })  : _getListYogaPoses = getListYogaPoses,
        super(const HomePageState()) {
    on<HomePageErrorOccurred>(_onErrorOccurred);
    on<HomePageStarted>((event, emit) {
      return _onStarted(event, emit);
    });
    on<HomePageFetchYogaPoses>((event, emit) {
      emit(state.copyWith(chooseYogaPose: event.code));
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(HomePageErrorOccurred(BaseException.from(error)));

    super.onError(error, stackTrace);
  }

  FutureOr<void> _onStarted(
    HomePageStarted event,
    Emitter<HomePageState> emit,
  ) {
    emit(state.copyWith(status: HomePageStatus.loading));

    _getListYogaPoses(GetListYogaPosesParams(page: 1, size: 10, keyword: '')).then((yogaPoses) {
      emit(state.copyWith(
        status: HomePageStatus.success,
        yogaPoses: yogaPoses,
      ));
    }).catchError((error) {
      emit(state.copyWith(
        status: HomePageStatus.failure,
        error: BaseException.from(error),
      ));
    });
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
