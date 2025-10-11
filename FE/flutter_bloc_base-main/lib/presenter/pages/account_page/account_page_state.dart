import 'package:flutter_starter/data/entities/response/get_information.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'account_page_state.freezed.dart';

enum AccountPageStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class AccountPageState with _$AccountPageState {
  const factory AccountPageState({
    @Default(AccountPageStatus.initial) AccountPageStatus status,
    GetInformation? information,
    BaseException? error,
  }) = _AccountPageState;
}
