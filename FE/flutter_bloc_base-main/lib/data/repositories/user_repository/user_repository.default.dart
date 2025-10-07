import 'package:flutter_starter/data/repositories/user_repository/user_repository.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'package:flutter_starter/data/entities/request/change_password.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/data/sources/network/base_api_response.dart';
import 'package:flutter_starter/core/error_code.dart';
import 'package:flutter_starter/core/exception.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final NetworkDataSource _networkDataSource;

  UserRepositoryImpl({required NetworkDataSource networkDataSource})
      : _networkDataSource = networkDataSource;

  @override
  Future<void> changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final BaseApiResponse<void> res = await _networkDataSource.changePassword(
        ChangePasswordRequest(
          email: email,
          oldPassword: oldPassword,
          newPassword: newPassword,
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
    } catch (e) {
      rethrow;
    }
  }
}
