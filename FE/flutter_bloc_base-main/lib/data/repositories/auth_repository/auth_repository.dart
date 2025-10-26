import 'package:flutter_starter/data/entities/account.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:flutter_starter/data/entities/response/verify_otp.dart';
import 'package:flutter_starter/data/sources/network/base_api_response.dart';

abstract class AuthRepository {
  Future<Account> verifyLoginStatus();

  Future<BaseApiResponse<RegisterResponse>> login({
    required String email,
    required String password,
    String? fcmToken,
  });

  Future<BaseApiResponse<RegisterResponse>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String birthDate,
  });

  Future<BaseApiResponse<String>> changePassword({
    required String email,
    required String currentPassword,
    required String newPassword,
  });

  Future<BaseApiResponse<String>> sendOtp({
    required String email,
  });

  Future<BaseApiResponse<VerifyOtpResponse>> verifyOtp({
    required String email,
    required String otp,
  });

  Future<BaseApiResponse<void>> resetPassword({
    required String newPassword,
    required String confirmNewPassword,
  });
}
