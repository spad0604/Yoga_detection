import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/response/get_information.dart';
import 'package:flutter_starter/data/repositories/user_repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class UpdateProfileUc extends UseCase<GetInformation, UpdateProfileParams> {
  final UserRepository _userRepository;

  UpdateProfileUc({required UserRepository userRepository}) : _userRepository = userRepository;

  @override
  Future<GetInformation> call(UpdateProfileParams params) {
    return _userRepository.updateProfile(
      firstName: params.firstName,
      lastName: params.lastName,
      dob: params.dob,
      phone: params.phone,
      avatarFilePath: params.avatarFilePath,
    );
  }
}

class UpdateProfileParams {
  final String? firstName;
  final String? lastName;
  final DateTime? dob;
  final String? phone;
  final String? avatarFilePath;

  UpdateProfileParams({this.firstName, this.lastName, this.dob, this.phone, this.avatarFilePath});
}
