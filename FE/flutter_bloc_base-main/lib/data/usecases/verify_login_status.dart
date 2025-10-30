import 'dart:async';

import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:flutter_starter/data/sources/network/base_api_response.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/account.dart';
import 'package:flutter_starter/data/repositories/auth_repository/auth_repository.dart';

@singleton
class VerifyLoginStatusUseCase extends UseCase<BaseApiResponse<RegisterResponse>, NoParams?> {
  final AuthRepository _authRepository;

  const VerifyLoginStatusUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<BaseApiResponse<RegisterResponse>> call([NoParams? params]) {
    return _authRepository.verifyLoginStatus();
  }
}
