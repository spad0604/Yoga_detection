import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_params.freezed.dart';
part 'register_params.g.dart';

@freezed
class RegisterParams with _$RegisterParams {
  const factory RegisterParams({
    @JsonKey(name: 'firstName') required String firstName,
    @JsonKey(name: 'lastName') required String lastName,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'password') required String password,
    @JsonKey(name: 'birthDate') required String birthDate,
  }) = _RegisterParams;

  factory RegisterParams.fromJson(Map<String, dynamic> json) => _$RegisterParamsFromJson(json);
}
