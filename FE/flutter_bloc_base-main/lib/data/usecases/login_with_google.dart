import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:flutter_starter/data/repositories/auth_repository/auth_repository.dart';

typedef GoogleLoginParams = ({String idToken, String? fcmToken});

@singleton
class LoginWithGoogleUseCase extends UseCase<RegisterResponse?, GoogleLoginParams> {
  final AuthRepository _authRepository;

  const LoginWithGoogleUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  FutureOr<RegisterResponse?> call(GoogleLoginParams params) async {
    final res =
        await _authRepository.loginWithGoogle(idToken: params.idToken, fcmToken: params.fcmToken);
    return res.data;
  }
}
