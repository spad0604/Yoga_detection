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
    BaseException? error,
  }) = _AccountPageState;
}
