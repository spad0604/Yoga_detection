import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_starter/core/exception.dart';

part 'register_event.freezed.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.errorOccurred([BaseException? error]) = RegisterErrorOccurred;
}
