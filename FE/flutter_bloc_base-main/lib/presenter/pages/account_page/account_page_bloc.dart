import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/usecases/get_information_uc.dart';
import 'package:flutter_starter/data/usecases/update_profile_uc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_event.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_state.dart';

@singleton
class AccountPageBloc extends Bloc<AccountPageEvent, AccountPageState> {
  final GetInformationUc _getInformationUc;
  final UpdateProfileUc _updateProfileUc;

  AccountPageBloc({required GetInformationUc getInformationUc, required UpdateProfileUc updateProfileUc})
      : _getInformationUc = getInformationUc,
        _updateProfileUc = updateProfileUc,
        super(const AccountPageState()) {
    on<AccountPageErrorOccurred>(_onErrorOccurred);

    on<AccountPageGetInformation>((event, emit) async {
      emit(state.copyWith(status: AccountPageStatus.loading));
      try {
        final information = await _getInformationUc.call(null);
        emit(state.copyWith(
          status: AccountPageStatus.success,
          information: information,
        ));
      } catch (e) {
        add(AccountPageErrorOccurred(BaseException.from(e)));
      }
    });

    on<AccountPageUpdateProfile>((event, emit) async {
      emit(state.copyWith(status: AccountPageStatus.loading));
      try {
        final updated = await _updateProfileUc(UpdateProfileParams(
          firstName: event.firstName,
          lastName: event.lastName,
          dob: event.dob,
          avatarFilePath: event.avatarFilePath,
        ));
        emit(state.copyWith(status: AccountPageStatus.success, information: updated));
      } catch (e) {
        add(AccountPageErrorOccurred(BaseException.from(e)));
      }
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // Avoid re-dispatching events here to prevent error loops
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    AccountPageErrorOccurred event,
    Emitter<AccountPageState> emit,
  ) {
    emit(state.copyWith(
      status: AccountPageStatus.failure,
      error: event.error,
    ));
  }
}
