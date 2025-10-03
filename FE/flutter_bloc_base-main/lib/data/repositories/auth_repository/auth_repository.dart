import 'package:flutter_starter/data/entities/account.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:flutter_starter/data/sources/network/base_api_response.dart';

abstract class AuthRepository {
  Future<Account> verifyLoginStatus();

  Future<BaseApiResponse<RegisterResponse>> login({
    required String email,
    required String password,
  });

  Future<BaseApiResponse<RegisterResponse>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String birthDate,
  });
}
