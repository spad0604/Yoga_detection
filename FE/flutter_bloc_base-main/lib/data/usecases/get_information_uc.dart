import 'package:flutter_starter/core/use_case.dart';
import 'package:flutter_starter/data/entities/response/get_information.dart';
import 'package:flutter_starter/data/repositories/user_repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetInformationUc extends UseCase<GetInformation, void> {
  final UserRepository _userRepository;

  GetInformationUc({required UserRepository userRepository}) : _userRepository = userRepository;

  @override
  Future<GetInformation> call(void params) async {
    final res = await _userRepository.getInformation();
    return res;
  }
}
