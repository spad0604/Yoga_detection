import 'package:flutter_starter/data/entities/request/change_password.dart';
import 'package:flutter_starter/data/entities/request/register_params.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:flutter_starter/data/sources/network/base_api_response.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:flutter_starter/data/entities/request/login_params.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_starter/data/entities/account.dart';
import 'package:flutter_starter/data/sources/network/dio.dart';

part 'network.g.dart';

@singleton
@RestApi()
abstract class NetworkDataSource {
  @factoryMethod
  factory NetworkDataSource(NetworkDio dio) = _NetworkDataSource;

  @POST('api/auth/verify')
  Future<Account> verifyLoginStatus();

  @POST('api/auth/login')
  Future<BaseApiResponse<RegisterResponse>> login(@Body() LoginParams params);

  @POST('api/auth/register')
  Future<BaseApiResponse<RegisterResponse>> register(@Body() RegisterParams params);

  @POST('api/user/change-password')
  Future<BaseApiResponse<void>> changePassword(@Body() ChangePasswordRequest params);
}
