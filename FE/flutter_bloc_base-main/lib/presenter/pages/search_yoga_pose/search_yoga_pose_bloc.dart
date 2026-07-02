import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/usecases/get_list_yoga_poses_uc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/pages/search_yoga_pose/search_yoga_pose_event.dart';
import 'package:flutter_starter/presenter/pages/search_yoga_pose/search_yoga_pose_state.dart';

@injectable
class SearchYogaPoseBloc
    extends Bloc<SearchYogaPoseEvent, SearchYogaPoseState> {
  final GetListYogaPosesUc _getListYogaPoses;
  bool _isFetching = false;

  SearchYogaPoseBloc({
    required GetListYogaPosesUc getListYogaPoses,
  })  : _getListYogaPoses = getListYogaPoses,
        super(const SearchYogaPoseState()) {
    on<SearchYogaPoseErrorOccurred>(_onErrorOccurred);

    on<SearchYogaPoseStarted>(_onFetchStarted);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SearchYogaPoseErrorOccurred(BaseException.from(error)));

    super.onError(error, stackTrace);
  }

  Future<void> _onFetchStarted(
    SearchYogaPoseStarted event,
    Emitter<SearchYogaPoseState> emit,
  ) async {
    if (_isFetching) return;
    if (event.params.page > 0 && state.hasReachedMax) return;
    _isFetching = true;

    final isFirstPage = event.params.page == 0;
    if (isFirstPage) {
      emit(state.copyWith(
        status: SearchYogaPoseStatus.loading,
        yogaPoses: const [],
        currentPage: 0,
        hasReachedMax: false,
      ));
    } else {
      emit(state.copyWith(status: SearchYogaPoseStatus.loadingMore));
    }

    try {
      final yogaPoses = await _getListYogaPoses.call(event.params);
      final combined = isFirstPage
          ? yogaPoses.items
          : [...state.yogaPoses, ...yogaPoses.items];

      emit(state.copyWith(
        status: SearchYogaPoseStatus.success,
        yogaPoses: combined,
        currentPage: yogaPoses.page,
        hasReachedMax: yogaPoses.items.isEmpty || !yogaPoses.hasNext,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: SearchYogaPoseStatus.failure,
        error: BaseException.from(error),
      ));
    } finally {
      _isFetching = false;
    }
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
