import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/request/request_change_password.dart';
import 'package:flutter_starter/data/repositories/auth_repository/auth_repository.dart';
import 'package:flutter_starter/data/sources/network/base_api_response.dart';
import 'package:injectable/injectable.dart';

@singleton
class SendOtpUc extends UseCase<BaseApiResponse<String>, RequestChangePassword> {
  final AuthRepository _authRepository;

  SendOtpUc({required AuthRepository authRepository}) : _authRepository = authRepository;

  @override
  Future<BaseApiResponse<String>> call(RequestChangePassword params) async {
    final res = await _authRepository.sendOtp(
      email: params.email,
    );
    return res;
  }
}
