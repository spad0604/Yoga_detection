import 'package:flutter_starter/data/entities/account.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loggedIn(RegisterResponse account) = AuthLoggedIn;

  const factory AuthEvent.loggedOut([Exception? error]) = AuthLoggedOut;
}
