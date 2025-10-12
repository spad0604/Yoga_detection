// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'data/repositories/auth_repository/auth_repository.dart' as _i344;
import 'data/repositories/auth_repository/auth_repository.default.dart'
    as _i522;
import 'data/repositories/user_repository/user_repository.dart' as _i971;
import 'data/repositories/user_repository/user_repository.default.dart'
    as _i912;
import 'data/repositories/yoga_poses_repository/yoga_poses_repository.dart'
    as _i153;
import 'data/repositories/yoga_poses_repository/yoga_poses_repository.default.dart'
    as _i818;
import 'data/sources/local/local.dart' as _i193;
import 'data/sources/network/dio.dart' as _i288;
import 'data/sources/network/network.dart' as _i536;
import 'data/states/auth/auth_bloc.dart' as _i963;
import 'data/states/camera_detection/camera_detection_bloc.dart' as _i161;
import 'data/states/settings/settings_bloc.dart' as _i932;
import 'data/usecases/change_password_uc.dart' as _i1035;
import 'data/usecases/get_information_uc.dart' as _i924;
import 'data/usecases/get_list_yoga_poses_uc.dart' as _i856;
import 'data/usecases/get_yoga_poses_details.dart' as _i404;
import 'data/usecases/login.dart' as _i470;
import 'data/usecases/register.dart' as _i686;
import 'data/usecases/send_otp_uc.dart' as _i212;
import 'data/usecases/verify_login_status.dart' as _i412;
import 'data/usecases/verify_otp_uc.dart' as _i855;
import 'di.dart' as _i913;
import 'presenter/navigation/navigation.dart' as _i551;
import 'presenter/pages/account_page/account_page_bloc.dart' as _i8;
import 'presenter/pages/forgot_password/forgot_password_bloc.dart' as _i132;
import 'presenter/pages/history/history_bloc.dart' as _i313;
import 'presenter/pages/home_page/home_page_bloc.dart' as _i267;
import 'presenter/pages/login/login_bloc.dart' as _i902;
import 'presenter/pages/pose_details/pose_details_bloc.dart' as _i133;
import 'presenter/pages/register/register_bloc.dart' as _i338;
import 'presenter/pages/search_yoga_pose/search_yoga_pose_bloc.dart' as _i296;
import 'presenter/pages/splash/splash_bloc.dart' as _i517;
import 'services/oauth_token_manager/oauth_token_manager.dart' as _i132;
import 'services/oauth_token_manager/oauth_token_manager.default.dart' as _i290;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i161.CameraDetectionBloc>(() => _i161.CameraDetectionBloc());
    gh.factory<_i313.HistoryBloc>(() => _i313.HistoryBloc());
    gh.singleton<_i963.AuthBloc>(() => _i963.AuthBloc());
    gh.singleton<_i932.SettingsBloc>(() => _i932.SettingsBloc());
    gh.singleton<_i558.FlutterSecureStorage>(
        () => registerModule.flutterSecureStorage);
    gh.singleton<_i132.OauthTokenManager>(() => _i290.DefaultOauthTokenManager(
        flutterSecureStorage: gh<_i558.FlutterSecureStorage>()));
    gh.singleton<_i551.AppRouter>(
        () => _i551.AppRouter(authBloc: gh<_i963.AuthBloc>()));
    gh.singleton<_i193.LocalDataSource>(() => _i193.LocalDataSource(
        flutterSecureStorage: gh<_i558.FlutterSecureStorage>()));
    gh.singleton<String>(
      () => registerModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.singleton<_i288.NetworkDio>(() => _i288.NetworkDio(
          tokenManager: gh<_i132.OauthTokenManager>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
        ));
    gh.singleton<_i536.NetworkDataSource>(
        () => _i536.NetworkDataSource(gh<_i288.NetworkDio>()));
    gh.singleton<_i153.YogaPosesRepository>(() => _i818.YogaPosesRepositoryImpl(
        networkDataSource: gh<_i536.NetworkDataSource>()));
    gh.singleton<_i971.UserRepository>(() => _i912.UserRepositoryImpl(
        networkDataSource: gh<_i536.NetworkDataSource>()));
    gh.singleton<_i1035.ChangePasswordUseCase>(() =>
        _i1035.ChangePasswordUseCase(
            userRepository: gh<_i971.UserRepository>()));
    gh.singleton<_i924.GetInformationUc>(() =>
        _i924.GetInformationUc(userRepository: gh<_i971.UserRepository>()));
    gh.singleton<_i344.AuthRepository>(() => _i522.DefaultAuthRepository(
        networkDataSource: gh<_i536.NetworkDataSource>()));
    gh.singleton<_i686.RegisterUseCase>(
        () => _i686.RegisterUseCase(repository: gh<_i344.AuthRepository>()));
    gh.singleton<_i856.GetListYogaPosesUc>(
        () => _i856.GetListYogaPosesUc(gh<_i153.YogaPosesRepository>()));
    gh.singleton<_i404.GetYogaPoseDetailsUc>(
        () => _i404.GetYogaPoseDetailsUc(gh<_i153.YogaPosesRepository>()));
    gh.factory<_i338.RegisterBloc>(() => _i338.RegisterBloc(
          register: gh<_i686.RegisterUseCase>(),
          oauthTokenManager: gh<_i132.OauthTokenManager>(),
        ));
    gh.singleton<_i8.AccountPageBloc>(() =>
        _i8.AccountPageBloc(getInformationUc: gh<_i924.GetInformationUc>()));
    gh.singleton<_i470.LoginUseCase>(
        () => _i470.LoginUseCase(authRepository: gh<_i344.AuthRepository>()));
    gh.singleton<_i212.SendOtpUc>(
        () => _i212.SendOtpUc(authRepository: gh<_i344.AuthRepository>()));
    gh.singleton<_i412.VerifyLoginStatusUseCase>(() =>
        _i412.VerifyLoginStatusUseCase(
            authRepository: gh<_i344.AuthRepository>()));
    gh.singleton<_i855.VerifyOtpUc>(
        () => _i855.VerifyOtpUc(authRepository: gh<_i344.AuthRepository>()));
    gh.factory<_i132.ForgotPasswordBloc>(() => _i132.ForgotPasswordBloc(
          changePassword: gh<_i1035.ChangePasswordUseCase>(),
          authRepository: gh<_i344.AuthRepository>(),
          sendOtpUc: gh<_i212.SendOtpUc>(),
          verifyOtpUc: gh<_i855.VerifyOtpUc>(),
          oauthTokenManager: gh<_i132.OauthTokenManager>(),
        ));
    gh.factory<_i517.SplashBloc>(() => _i517.SplashBloc(
        verifyLoginStatus: gh<_i412.VerifyLoginStatusUseCase>()));
    gh.factory<_i296.SearchYogaPoseBloc>(() => _i296.SearchYogaPoseBloc(
        getListYogaPoses: gh<_i856.GetListYogaPosesUc>()));
    gh.singleton<_i267.HomePageBloc>(() =>
        _i267.HomePageBloc(getListYogaPoses: gh<_i856.GetListYogaPosesUc>()));
    gh.factory<_i902.LoginBloc>(() => _i902.LoginBloc(
          login: gh<_i470.LoginUseCase>(),
          oauthTokenManager: gh<_i132.OauthTokenManager>(),
        ));
    gh.factory<_i133.PoseDetailsBloc>(() => _i133.PoseDetailsBloc(
        getYogaPoseDetails: gh<_i404.GetYogaPoseDetailsUc>()));
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}
