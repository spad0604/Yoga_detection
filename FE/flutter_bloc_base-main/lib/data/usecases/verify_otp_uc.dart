import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/request/verify_otp_request.dart';
import 'package:flutter_starter/data/entities/response/verify_otp.dart';
import 'package:flutter_starter/data/repositories/auth_repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class VerifyOtpUc extends UseCase<VerifyOtpResponse, VerifyOtpRequest> {
  final AuthRepository _authRepository;

  VerifyOtpUc({required AuthRepository authRepository}) : _authRepository = authRepository;

  @override
  Future<VerifyOtpResponse> call(VerifyOtpRequest params) async {
    final res = await _authRepository.verifyOtp(
      email: params.email,
      otp: params.otp,
    );
    return res.data ?? VerifyOtpResponse(token: '');
  }
}
