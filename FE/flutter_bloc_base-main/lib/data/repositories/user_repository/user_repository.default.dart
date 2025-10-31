import 'package:flutter_starter/data/entities/response/get_information.dart';
import 'package:flutter_starter/data/repositories/user_repository/user_repository.dart';
import 'package:flutter_starter/data/sources/network/network.dart';
import 'package:flutter_starter/data/entities/request/change_password.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/data/sources/network/base_api_response.dart';
import 'package:flutter_starter/core/error_code.dart';
import 'package:flutter_starter/core/exception.dart';
import 'package:dio/dio.dart';

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

  @override
  Future<GetInformation> getInformation() async {
    try {
      final res = await _networkDataSource.getInformation();

      final code = res.code;
      if (code != null && code != ErrorCode.SUCCESS.code) {
        final match = ErrorCode.values.firstWhere(
          (e) => e.code == code,
          orElse: () => ErrorCode.INTERNAL_SERVER_ERROR,
        );
        throw ServerException(match, data: res);
      }
      return res.data!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetInformation> updateProfile({
    String? firstName,
    String? lastName,
    DateTime? dob,
    String? avatarFilePath,
  }) async {
    try {
      final map = <String, dynamic>{};
      if (firstName != null) map['firstName'] = firstName;
      if (lastName != null) map['lastName'] = lastName;
      if (dob != null) map['dob'] = dob.toIso8601String().split('T').first;
      if (avatarFilePath != null && avatarFilePath.isNotEmpty) {
        final filename = avatarFilePath.split(RegExp(r'[\\\/]')).last;
        map['avatar'] = await MultipartFile.fromFile(avatarFilePath, filename: filename);
      }
      final formData = FormData.fromMap(map);

      final res = await _networkDataSource.updateProfile(formData);
      final code = res.code;
      if (code != null && code != ErrorCode.SUCCESS.code) {
        final match = ErrorCode.values.firstWhere(
          (e) => e.code == code,
          orElse: () => ErrorCode.INTERNAL_SERVER_ERROR,
        );
        throw ServerException(match, data: res);
      }
      return res.data!;
    } catch (e) {
      rethrow;
    }
  }
}
