import 'package:flutter_starter/data/entities/response/get_information.dart';

abstract class UserRepository {
  Future<void> changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  });

  Future<GetInformation> getInformation();
}
