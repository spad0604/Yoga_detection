import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:flutter_starter/data/usecases/get_list_yoga_poses_uc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_event.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_state.dart';

@singleton
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetListYogaPosesUc _getListYogaPoses;

  HomePageBloc({
    required GetListYogaPosesUc getListYogaPoses,
  })  : _getListYogaPoses = getListYogaPoses,
        super(const HomePageState()) {
    on<HomePageErrorOccurred>(_onErrorOccurred);
    on<HomePageStarted>((event, emit) async {
      return await _onStarted(event, emit);
    });
    on<HomePageFetchYogaPoses>((event, emit) {
      emit(state.copyWith(chooseYogaPose: event.code));
    });
    on<HomePageLoadMore>((event, emit) async {
      return await _onLoadMore(event, emit);
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onStarted(
    HomePageStarted event,
    Emitter<HomePageState> emit,
  ) async {
    emit(state.copyWith(
      status: HomePageStatus.loading,
      currentPage: 0,
      hasReachedMax: false,
    ));
    try {
      final yogaPoses = await _getListYogaPoses(
        GetListYogaPosesParams(page: 0, size: 10, keyword: ''),
      );
      emit(state.copyWith(
        status: HomePageStatus.success,
        yogaPoses: yogaPoses,
        currentPage: 0,
        hasReachedMax: yogaPoses.items == null || yogaPoses.items!.isEmpty || !yogaPoses.hasNext,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: HomePageStatus.failure,
        error: BaseException.from(error),
      ));
    }
  }

  FutureOr<void> _onLoadMore(
    HomePageLoadMore event,
    Emitter<HomePageState> emit,
  ) async {
    if (state.hasReachedMax || state.status == HomePageStatus.loadingMore) {
      return;
    }

    emit(state.copyWith(status: HomePageStatus.loadingMore));

    try {
      final nextPage = state.currentPage + 1;
      final newYogaPoses = await _getListYogaPoses(
        GetListYogaPosesParams(page: nextPage, size: 10, keyword: ''),
      );

      final currentItems = state.yogaPoses?.items ?? [];
      final newItems = newYogaPoses.items ?? [];
      final allItems = [...currentItems, ...newItems];

      final updatedPageResponse = PageResponse<YogaPoseDetails>(
        items: allItems,
        page: newYogaPoses.page,
        pageSize: newYogaPoses.pageSize,
        totalElements: newYogaPoses.totalElements,
        totalPages: newYogaPoses.totalPages,
        hasNext: newYogaPoses.hasNext,
        hasPrevious: newYogaPoses.hasPrevious,
      );

      emit(state.copyWith(
        status: HomePageStatus.success,
        yogaPoses: updatedPageResponse,
        currentPage: nextPage,
        hasReachedMax: newItems.isEmpty || !newYogaPoses.hasNext,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: HomePageStatus.failure,
        error: BaseException.from(error),
      ));
    }
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
