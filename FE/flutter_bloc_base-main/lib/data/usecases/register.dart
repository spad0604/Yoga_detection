import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/request/register_params.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:flutter_starter/data/repositories/auth_repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class RegisterUseCase extends UseCase<RegisterResponse, RegisterParams> {
  final AuthRepository _repository;

  const RegisterUseCase({required AuthRepository repository}) : _repository = repository;

  @override
  Future<RegisterResponse> call(RegisterParams params) async {
    final response = await _repository.register(
      email: params.email,
      password: params.password,
      firstName: params.firstName,
      lastName: params.lastName,
      birthDate: params.birthDate,
    );

    return response.data!;
  }
}
