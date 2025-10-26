import 'package:flutter_starter/data/entities/request/change_password.dart';
import 'package:flutter_starter/data/entities/request/post_yoga_pose_model.dart';
import 'package:flutter_starter/data/entities/request/register_params.dart';
import 'package:flutter_starter/data/entities/request/request_change_password.dart';
import 'package:flutter_starter/data/entities/request/reset_password_request.dart';
import 'package:flutter_starter/data/entities/request/refresh_token_request.dart';
import 'package:flutter_starter/data/entities/request/verify_otp_request.dart';
import 'package:flutter_starter/data/entities/response/get_information.dart';
import 'package:flutter_starter/data/entities/response/page_response.dart';
import 'package:flutter_starter/data/entities/response/register_response.dart';
import 'package:flutter_starter/data/entities/response/user_yoga_pose_model.dart';
import 'package:flutter_starter/data/entities/response/verify_otp.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
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

  @POST('api/user/change')
  Future<BaseApiResponse<String>> changePassword(@Body() ChangePasswordRequest params);

  @POST('api/password/send-otp')
  Future<BaseApiResponse<String>> sendOtp(@Body() RequestChangePassword params);

  @POST('api/password/verify-otp')
  Future<BaseApiResponse<VerifyOtpResponse>> verifyOtp(@Body() VerifyOtpRequest params);

  @GET('api/yoga-poses')
  Future<BaseApiResponse<PageResponse<YogaPoseDetails>>> getYogaPoses(
      @Query('page') int page, @Query('pageSize') int size, @Query('keyWord') String keyword);

  @GET('api/yoga-poses/{code}')
  Future<BaseApiResponse<YogaPoseDetails>> getYogaPoseDetails(@Path('code') String code);

  @POST('api/password/reset')
  Future<BaseApiResponse<void>> resetPassword(@Body() ResetPasswordRequest params);

  @POST('api/auth/refresh')
  Future<BaseApiResponse<RegisterResponse>> refreshToken(@Body() RefreshTokenRequest params);

  @GET('api/user/me')
  Future<BaseApiResponse<GetInformation>> getInformation();

  @POST('api/pose-attempts')
  Future<BaseApiResponse<void>> postYogaPose(
      @Body() PostYogaPoseModel model, @Part() MultipartFile image);

  @GET("api/pose-attempts/by-date")
  Future<BaseApiResponse<PageResponse<UserYogaPoseModel>>> getUserYogaPosesByDate(
      @Query("page") int page,
      @Query("startDate") String startDate,
      @Query("endDate") String endDate);

  @GET('api/pose-attempts/{id}')
  Future<BaseApiResponse<UserYogaPoseModel>> getUserYogaPoseById(@Path('id') String id);
}
