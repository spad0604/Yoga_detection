import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/my_body/my_body_event.dart';
import 'package:flutter_starter/data/states/my_body/my_body_state.dart';
import 'package:flutter_starter/data/usecases/create_body_progress_uc.dart';
import 'package:flutter_starter/data/usecases/get_all_body_progress_uc.dart';
import 'package:flutter_starter/data/usecases/get_latest_body_progress_uc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MyBodyBloc extends Bloc<MyBodyEvent, MyBodyState> {
  final GetAllBodyProgressUc _getAllBodyProgressUc;
  final GetLatestBodyProgressUc _getLatestBodyProgressUc;
  final CreateBodyProgressUc _createBodyProgressUc;

  MyBodyBloc(
    this._getAllBodyProgressUc,
    this._getLatestBodyProgressUc,
    this._createBodyProgressUc,
  ) : super(const MyBodyState()) {
    on<MyBodyLoadRequested>(_onLoadRequested);
    on<MyBodyRefreshRequested>(_onRefreshRequested);
    on<MyBodyCreateRequested>(_onCreateRequested);
    on<MyBodyLoadLatestRequested>(_onLoadLatestRequested);
  }

  Future<void> _onLoadRequested(
    MyBodyLoadRequested event,
    Emitter<MyBodyState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final result = await _getAllBodyProgressUc();

      emit(state.copyWith(
        bodyProgressList: result,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onRefreshRequested(
    MyBodyRefreshRequested event,
    Emitter<MyBodyState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    add(const MyBodyLoadRequested());
  }

  Future<void> _onCreateRequested(
    MyBodyCreateRequested event,
    Emitter<MyBodyState> emit,
  ) async {
    emit(state.copyWith(isCreating: true, error: null));

    try {
      final result = await _createBodyProgressUc(event.request);
      
      // Add to list
      final updatedList = [result, ...state.bodyProgressList];
      
      emit(state.copyWith(
        bodyProgressList: updatedList,
        isCreating: false,
        latestProgress: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        isCreating: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onLoadLatestRequested(
    MyBodyLoadLatestRequested event,
    Emitter<MyBodyState> emit,
  ) async {
    try {
      final result = await _getLatestBodyProgressUc();
      emit(state.copyWith(latestProgress: result));
    } catch (e) {
      // Don't emit error for latest, just log
      print('Failed to load latest body progress: $e');
    }
  }
}

