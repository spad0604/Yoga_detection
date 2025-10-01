import 'package:flutter_starter/data/repositories/user_repository/user_repository.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'package:flutter_starter/data/entities/request/change_password.dart';

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
      await _networkDataSource.changePassword(ChangePasswordRequest(
        email: email,
        oldPassword: oldPassword,
        newPassword: newPassword,
      ));
    } catch (e) {
      rethrow;
    }
  }
}
