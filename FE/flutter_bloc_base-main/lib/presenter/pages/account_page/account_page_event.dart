import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'account_page_event.freezed.dart';

@freezed
class AccountPageEvent with _$AccountPageEvent {
  const factory AccountPageEvent.errorOccurred([BaseException? error]) = AccountPageErrorOccurred;

  const factory AccountPageEvent.getInformation() = AccountPageGetInformation;

  const factory AccountPageEvent.updateProfile({
    String? firstName,
    String? lastName,
    DateTime? dob,
    String? avatarFilePath,
  }) = AccountPageUpdateProfile;
}
