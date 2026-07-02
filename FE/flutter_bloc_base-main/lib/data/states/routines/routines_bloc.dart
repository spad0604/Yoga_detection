import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/routines/routines_event.dart';
import 'package:flutter_starter/data/states/routines/routines_state.dart';
import 'package:flutter_starter/data/usecases/get_all_routines_uc.dart';
import 'package:flutter_starter/data/usecases/get_user_routines_progress_uc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RoutinesBloc extends Bloc<RoutinesEvent, RoutinesState> {
  final GetAllRoutinesUc _getAllRoutinesUc;
  final GetInProgressRoutinesUc _getInProgressRoutinesUc;
  final GetCompletedRoutinesUc _getCompletedRoutinesUc;

  RoutinesBloc(
    this._getAllRoutinesUc,
    this._getInProgressRoutinesUc,
    this._getCompletedRoutinesUc,
  ) : super(const RoutinesState()) {
    on<RoutinesLoadRequested>(_onLoadRequested);
    on<RoutinesLoadMoreRequested>(_onLoadMoreRequested);
    on<RoutinesRefreshRequested>(_onRefreshRequested);
    on<RoutinesLoadInProgressRequested>(_onLoadInProgressRequested);
    on<RoutinesLoadCompletedRequested>(_onLoadCompletedRequested);
  }

  Future<void> _onLoadRequested(
    RoutinesLoadRequested event,
    Emitter<RoutinesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final result = await _getAllRoutinesUc(
        GetAllRoutinesParams(page: 0, size: 20),
      );

      emit(state.copyWith(
        routines: result.items,
        isLoading: false,
        hasMore: result.hasNext,
        currentPage: 0,
      ));

      // Also load progress routines
      add(const RoutinesLoadInProgressRequested());
      add(const RoutinesLoadCompletedRequested());
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onLoadMoreRequested(
    RoutinesLoadMoreRequested event,
    Emitter<RoutinesState> emit,
  ) async {
    if (state.isLoading || state.isLoadingMore || !state.hasMore) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true, error: null));

    try {
      final nextPage = state.currentPage + 1;
      final result = await _getAllRoutinesUc(
        GetAllRoutinesParams(page: nextPage, size: 20),
      );

      emit(state.copyWith(
        routines: [...state.routines, ...result.items],
        isLoadingMore: false,
        hasMore: result.hasNext,
        currentPage: result.page,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoadingMore: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onRefreshRequested(
    RoutinesRefreshRequested event,
    Emitter<RoutinesState> emit,
  ) async {
    emit(state.copyWith(currentPage: 0));
    add(const RoutinesLoadRequested());
  }

  Future<void> _onLoadInProgressRequested(
    RoutinesLoadInProgressRequested event,
    Emitter<RoutinesState> emit,
  ) async {
    try {
      final result = await _getInProgressRoutinesUc(
        PaginationParams(page: 0, size: 20),
      );

      emit(state.copyWith(inProgressRoutines: result.items));
    } catch (e) {
      // Silent fail for progress loading
    }
  }

  Future<void> _onLoadCompletedRequested(
    RoutinesLoadCompletedRequested event,
    Emitter<RoutinesState> emit,
  ) async {
    try {
      final result = await _getCompletedRoutinesUc(
        PaginationParams(page: 0, size: 20),
      );

      emit(state.copyWith(completedRoutines: result.items));
    } catch (e) {
      // Silent fail for completed loading
    }
  }
}
