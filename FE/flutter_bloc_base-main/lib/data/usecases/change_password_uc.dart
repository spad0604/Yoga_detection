import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/request/change_password.dart';
import 'package:flutter_starter/data/repositories/user_repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class ChangePasswordUseCase extends UseCase<void, ChangePasswordRequest> {
  final UserRepository _userRepository;

  ChangePasswordUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<void> call(ChangePasswordRequest params) async {
    return await _userRepository.changePassword(
      email: params.email,
      oldPassword: params.oldPassword,
      newPassword: params.newPassword,
    );
  }
}
