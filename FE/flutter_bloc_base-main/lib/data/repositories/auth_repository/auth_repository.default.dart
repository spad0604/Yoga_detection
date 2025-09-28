import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_starter/data/entities/request/register_params.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:flutter_starter/data/sources/network/base_api_response.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/data/entities/account.dart';
import 'package:flutter_starter/data/entities/request/login_params.dart';
import 'package:flutter_starter/data/repositories/auth_repository/auth_repository.dart';
import 'package:flutter_starter/data/repositories/auth_repository/exceptions.dart';
import 'package:flutter_starter/data/sources/network/network.dart';

@Singleton(as: AuthRepository)
class DefaultAuthRepository extends AuthRepository {
  final NetworkDataSource _networkDataSource;

  DefaultAuthRepository({
    required NetworkDataSource networkDataSource,
  }) : _networkDataSource = networkDataSource;

  @override
  Future<BaseApiResponse<RegisterResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final account = await _networkDataSource.login(LoginParams(
        email: email,
        password: password,
      ));

      return account;
    } on DioException {
      throw LoginInvalidEmailPasswordException();
    }
  }

  @override
  Future<Account> verifyLoginStatus() async {
    return await _networkDataSource.verifyLoginStatus();
  }

  @override
  Future<BaseApiResponse<RegisterResponse>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String birthDate,
  }) async {
    try {
      final account = await _networkDataSource.register(RegisterParams(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        birthDate: birthDate,
      ));

      return account;
    } on DioException {
      rethrow;
    }
  }
}
