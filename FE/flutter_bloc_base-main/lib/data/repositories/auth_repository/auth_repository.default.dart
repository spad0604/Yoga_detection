import 'package:dio/dio.dart';
import 'package:flutter_starter/data/entities/request/change_password.dart';
import 'package:flutter_starter/data/entities/request/google_login_params.dart';
import 'package:flutter_starter/data/entities/request/register_params.dart';
import 'package:flutter_starter/data/entities/request/request_change_password.dart';
import 'package:flutter_starter/data/entities/request/verify_otp_request.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:flutter_starter/data/entities/response/verify_otp.dart';
import 'package:flutter_starter/data/sources/network/base_api_response.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/data/entities/request/login_params.dart';
import 'package:flutter_starter/data/entities/request/refresh_token_request.dart';
import 'package:flutter_starter/data/repositories/auth_repository/auth_repository.dart';
import 'package:flutter_starter/services/oauth_token_manager/oauth_token_manager.dart';
import 'package:flutter_starter/data/repositories/auth_repository/exceptions.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'package:flutter_starter/core/error_code.dart';
import 'package:flutter_starter/core/exception.dart';

import '../../entities/request/reset_password_request.dart';

@Singleton(as: AuthRepository)
class DefaultAuthRepository extends AuthRepository {
  final NetworkDataSource _networkDataSource;

  final OauthTokenManager _tokenManager;

  DefaultAuthRepository({
    required NetworkDataSource networkDataSource,
    required OauthTokenManager tokenManager,
  })  : _networkDataSource = networkDataSource,
        _tokenManager = tokenManager;

  @override
  Future<BaseApiResponse<RegisterResponse>> login({
    required String email,
    required String password,
    String? fcmToken,
  }) async {
    try {
      final res = await _networkDataSource
          .login(LoginParams(email: email, password: password, fcmToken: fcmToken));

      final code = res.code;
      if (code != null && code != ErrorCode.SUCCESS.code) {
        final match = ErrorCode.values.firstWhere(
          (e) => e.code == code,
          orElse: () => ErrorCode.INTERNAL_SERVER_ERROR,
        );
        throw ServerException(match, data: res);
      }

      return res;
    } on DioException {
      throw LoginInvalidEmailPasswordException();
    }
  }

  @override
  Future<BaseApiResponse<RegisterResponse>> loginWithGoogle({
    required String idToken,
    String? fcmToken,
  }) async {
    try {
      final res = await _networkDataSource.loginWithGoogle(
        GoogleLoginParams(idToken: idToken, fcmToken: fcmToken),
      );

      final code = res.code;
      if (code != null && code != ErrorCode.SUCCESS.code) {
        final match = ErrorCode.values.firstWhere(
          (e) => e.code == code,
          orElse: () => ErrorCode.INTERNAL_SERVER_ERROR,
        );
        throw ServerException(match, data: res);
      }

      return res;
    } on DioException {
      throw LoginInvalidEmailPasswordException();
    }
  }

  @override
  Future<BaseApiResponse<RegisterResponse>> verifyLoginStatus() async {
    // On app start, attempt to refresh tokens using stored refresh token.
    // If refresh succeeds, we can treat the user as logged in.
    final refreshToken = await _tokenManager.getRefreshToken();
    if (refreshToken == null) {
      throw ServerException(ErrorCode.UNAUTHORIZED);
    }

    try {
      final res =
          await _networkDataSource.refreshToken(RefreshTokenRequest(refreshToken: refreshToken));

      final code = res.code;
      if (code != null && code != ErrorCode.SUCCESS.code) {
        final match = ErrorCode.values.firstWhere(
          (e) => e.code == code,
          orElse: () => ErrorCode.INTERNAL_SERVER_ERROR,
        );
        throw ServerException(match, data: res);
      }

      final payload = res.data;
      final newAccess = payload?.accessToken;
      final newRefresh = payload?.refreshToken;

      if (newAccess != null) await _tokenManager.saveAccessToken(newAccess);
      if (newRefresh != null) await _tokenManager.saveRefreshToken(newRefresh);

      return res;
    } on DioException {
      await _tokenManager.removeAllTokens();
      rethrow;
    }
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
      final res = await _networkDataSource.register(RegisterParams(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        birthDate: birthDate,
      ));

      final code = res.code;
      if (code != null && code != ErrorCode.SUCCESS.code) {
        final match = ErrorCode.values.firstWhere(
          (e) => e.code == code,
          orElse: () => ErrorCode.INTERNAL_SERVER_ERROR,
        );
        throw ServerException(match, data: res);
      }

      return res;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<BaseApiResponse<String>> changePassword({
    required String email,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final res = await _networkDataSource.changePassword(ChangePasswordRequest(
        email: email,
        oldPassword: currentPassword,
        newPassword: newPassword,
      ));

      final code = res.code;
      if (code != null && code != ErrorCode.SUCCESS.code) {
        final match = ErrorCode.values.firstWhere(
          (e) => e.code == code,
          orElse: () => ErrorCode.INTERNAL_SERVER_ERROR,
        );
        throw ServerException(match, data: res);
      }

      return res;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<BaseApiResponse<String>> sendOtp({
    required String email,
  }) async {
    try {
      final res = await _networkDataSource.sendOtp(RequestChangePassword(email: email));

      final code = res.code;
      if (code != null && code != ErrorCode.SUCCESS.code) {
        final match = ErrorCode.values.firstWhere(
          (e) => e.code == code,
          orElse: () => ErrorCode.INTERNAL_SERVER_ERROR,
        );
        throw ServerException(match, data: res);
      }

      return res;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<BaseApiResponse<VerifyOtpResponse>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final res = await _networkDataSource.verifyOtp(VerifyOtpRequest(email: email, otp: otp));

      final code = res.code;
      if (code != null && code != ErrorCode.SUCCESS.code) {
        final match = ErrorCode.values.firstWhere(
          (e) => e.code == code,
          orElse: () => ErrorCode.INTERNAL_SERVER_ERROR,
        );
        throw ServerException(match, data: res);
      }

      return res;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<BaseApiResponse<void>> resetPassword({
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      final res = await _networkDataSource.resetPassword(
        ResetPasswordRequest(
          newPassword: newPassword,
          confirmNewPassword: confirmNewPassword,
        ),
      );

      final code = res.code;
      if (code != null && code != ErrorCode.SUCCESS.code) {
        final match = ErrorCode.values.firstWhere(
          (e) => e.code == code,
          orElse: () => ErrorCode.INTERNAL_SERVER_ERROR,
        );
        throw ServerException(match, data: res);
      }

      return res;
    } on DioException {
      rethrow;
    }
  }
}
