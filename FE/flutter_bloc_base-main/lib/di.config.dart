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
import 'data/repositories/body_progress_repository/body_progress_repository.dart'
    as _i654;
import 'data/repositories/body_progress_repository/body_progress_repository.default.dart'
    as _i481;
import 'data/repositories/group_posts_repository/group_posts_repository.dart'
    as _i636;
import 'data/repositories/group_posts_repository/group_posts_repository.default.dart'
    as _i1051;
import 'data/repositories/notification_repository/notification_repository.dart'
    as _i710;
import 'data/repositories/notification_repository/notification_repository.default.dart'
    as _i307;
import 'data/repositories/practice_session_repository/practice_session_repository.dart'
    as _i930;
import 'data/repositories/practice_session_repository/practice_session_repository.default.dart'
    as _i990;
import 'data/repositories/routine_repository/routine_repository.dart' as _i398;
import 'data/repositories/routine_repository/routine_repository.default.dart'
    as _i447;
import 'data/repositories/social_posts_repository/social_posts_repository.dart'
    as _i160;
import 'data/repositories/social_posts_repository/social_posts_repository.default.dart'
    as _i789;
import 'data/repositories/social_repository/social_repository.dart' as _i951;
import 'data/repositories/social_repository/social_repository.default.dart'
    as _i211;
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
import 'data/states/activities/activities_bloc.dart' as _i844;
import 'data/states/auth/auth_bloc.dart' as _i963;
import 'data/states/camera_detection/camera_detection_bloc.dart' as _i161;
import 'data/states/friends/friends_bloc.dart' as _i881;
import 'data/states/group_feed/group_feed_bloc.dart' as _i771;
import 'data/states/groups/groups_bloc.dart' as _i819;
import 'data/states/my_body/my_body_bloc.dart' as _i950;
import 'data/states/practice_session/practice_session_bloc.dart' as _i878;
import 'data/states/routine_details/routine_details_bloc.dart' as _i659;
import 'data/states/routines/routines_bloc.dart' as _i682;
import 'data/states/settings/settings_bloc.dart' as _i932;
import 'data/states/social_feed/social_feed_bloc.dart' as _i581;
import 'data/usecases/change_password_uc.dart' as _i1035;
import 'data/usecases/create_body_progress_uc.dart' as _i562;
import 'data/usecases/get_all_body_progress_uc.dart' as _i652;
import 'data/usecases/get_all_routines_uc.dart' as _i779;
import 'data/usecases/get_history_by_date_uc.dart' as _i937;
import 'data/usecases/get_information_uc.dart' as _i924;
import 'data/usecases/get_latest_body_progress_uc.dart' as _i426;
import 'data/usecases/get_list_yoga_poses_uc.dart' as _i856;
import 'data/usecases/get_notification_by_id_uc.dart' as _i1046;
import 'data/usecases/get_notifications_uc.dart' as _i1054;
import 'data/usecases/get_pose_history_details.dart' as _i711;
import 'data/usecases/get_routine_details_uc.dart' as _i443;
import 'data/usecases/get_user_routines_progress_uc.dart' as _i405;
import 'data/usecases/get_yoga_poses_details.dart' as _i404;
import 'data/usecases/login.dart' as _i470;
import 'data/usecases/post_yoga_pose_uc.dart' as _i389;
import 'data/usecases/register.dart' as _i686;
import 'data/usecases/send_otp_uc.dart' as _i212;
import 'data/usecases/start_routine_uc.dart' as _i576;
import 'data/usecases/update_profile_uc.dart' as _i489;
import 'data/usecases/update_routine_progress_uc.dart' as _i843;
import 'data/usecases/verify_login_status.dart' as _i412;
import 'data/usecases/verify_otp_uc.dart' as _i855;
import 'di.dart' as _i913;
import 'presenter/navigation/navigation.dart' as _i551;
import 'presenter/pages/account_page/account_page_bloc.dart' as _i8;
import 'presenter/pages/forgot_password/forgot_password_bloc.dart' as _i132;
import 'presenter/pages/history/history_bloc.dart' as _i313;
import 'presenter/pages/home_page/home_page_bloc.dart' as _i267;
import 'presenter/pages/login/login_bloc.dart' as _i902;
import 'presenter/pages/notification_page/notification_page_bloc.dart' as _i306;
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
    gh.singleton<_i932.SettingsBloc>(() => _i932.SettingsBloc());
    gh.singleton<_i558.FlutterSecureStorage>(
        () => registerModule.flutterSecureStorage);
    gh.singleton<_i132.OauthTokenManager>(() => _i290.DefaultOauthTokenManager(
        flutterSecureStorage: gh<_i558.FlutterSecureStorage>()));
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
    gh.singleton<_i963.AuthBloc>(
        () => _i963.AuthBloc(tokenManager: gh<_i132.OauthTokenManager>()));
    gh.singleton<_i344.AuthRepository>(() => _i522.DefaultAuthRepository(
          networkDataSource: gh<_i536.NetworkDataSource>(),
          tokenManager: gh<_i132.OauthTokenManager>(),
        ));
    gh.singleton<_i160.SocialPostsRepository>(() =>
        _i789.SocialPostsRepositoryImpl(api: gh<_i536.NetworkDataSource>()));
    gh.singleton<_i153.YogaPosesRepository>(() => _i818.YogaPosesRepositoryImpl(
        networkDataSource: gh<_i536.NetworkDataSource>()));
    gh.singleton<_i937.GetHistoryByDateUC>(() => _i937.GetHistoryByDateUC(
        historyRepository: gh<_i153.YogaPosesRepository>()));
    gh.singleton<_i711.GetPoseHistoryDetails>(() => _i711.GetPoseHistoryDetails(
        yogaPosesRepository: gh<_i153.YogaPosesRepository>()));
    gh.singleton<_i389.PostYogaPoseUC>(() => _i389.PostYogaPoseUC(
        yogaPosesRepository: gh<_i153.YogaPosesRepository>()));
    gh.singleton<_i710.NotificationRepository>(() =>
        _i307.NotificationRepositoryImpl(
            networkDataSource: gh<_i536.NetworkDataSource>()));
    gh.singleton<_i971.UserRepository>(() => _i912.UserRepositoryImpl(
        networkDataSource: gh<_i536.NetworkDataSource>()));
    gh.singleton<_i951.SocialRepository>(() => _i211.SocialRepositoryImpl(
        networkDataSource: gh<_i536.NetworkDataSource>()));
    gh.singleton<_i551.AppRouter>(
        () => _i551.AppRouter(authBloc: gh<_i963.AuthBloc>()));
    gh.singleton<_i470.LoginUseCase>(
        () => _i470.LoginUseCase(authRepository: gh<_i344.AuthRepository>()));
    gh.singleton<_i212.SendOtpUc>(
        () => _i212.SendOtpUc(authRepository: gh<_i344.AuthRepository>()));
    gh.singleton<_i412.VerifyLoginStatusUseCase>(() =>
        _i412.VerifyLoginStatusUseCase(
            authRepository: gh<_i344.AuthRepository>()));
    gh.singleton<_i855.VerifyOtpUc>(
        () => _i855.VerifyOtpUc(authRepository: gh<_i344.AuthRepository>()));
    gh.singleton<_i654.BodyProgressRepository>(() =>
        _i481.BodyProgressRepositoryImpl(
            networkDataSource: gh<_i536.NetworkDataSource>()));
    gh.singleton<_i1035.ChangePasswordUseCase>(() =>
        _i1035.ChangePasswordUseCase(
            userRepository: gh<_i971.UserRepository>()));
    gh.singleton<_i924.GetInformationUc>(() =>
        _i924.GetInformationUc(userRepository: gh<_i971.UserRepository>()));
    gh.singleton<_i489.UpdateProfileUc>(() =>
        _i489.UpdateProfileUc(userRepository: gh<_i971.UserRepository>()));
    gh.factory<_i581.SocialFeedBloc>(
        () => _i581.SocialFeedBloc(gh<_i160.SocialPostsRepository>()));
    gh.factory<_i132.ForgotPasswordBloc>(() => _i132.ForgotPasswordBloc(
          changePassword: gh<_i1035.ChangePasswordUseCase>(),
          authRepository: gh<_i344.AuthRepository>(),
          sendOtpUc: gh<_i212.SendOtpUc>(),
          verifyOtpUc: gh<_i855.VerifyOtpUc>(),
          oauthTokenManager: gh<_i132.OauthTokenManager>(),
        ));
    gh.singleton<_i930.PracticeSessionRepository>(() =>
        _i990.PracticeSessionRepositoryImpl(
            networkDataSource: gh<_i536.NetworkDataSource>()));
    gh.singleton<_i636.GroupPostsRepository>(() =>
        _i1051.GroupPostsRepositoryImpl(api: gh<_i536.NetworkDataSource>()));
    gh.singleton<_i398.RoutineRepository>(() => _i447.RoutineRepositoryImpl(
        networkDataSource: gh<_i536.NetworkDataSource>()));
    gh.singleton<_i686.RegisterUseCase>(
        () => _i686.RegisterUseCase(repository: gh<_i344.AuthRepository>()));
    gh.factory<_i517.SplashBloc>(() => _i517.SplashBloc(
        verifyLoginStatus: gh<_i412.VerifyLoginStatusUseCase>()));
    gh.factory<_i844.ActivitiesBloc>(
        () => _i844.ActivitiesBloc(gh<_i951.SocialRepository>()));
    gh.factory<_i881.FriendsBloc>(
        () => _i881.FriendsBloc(gh<_i951.SocialRepository>()));
    gh.factory<_i819.GroupsBloc>(
        () => _i819.GroupsBloc(gh<_i951.SocialRepository>()));
    gh.singleton<_i1054.GetNotificationsUseCase>(() =>
        _i1054.GetNotificationsUseCase(
            notificationRepository: gh<_i710.NotificationRepository>()));
    gh.singleton<_i1046.GetNotificationByIdUseCase>(() =>
        _i1046.GetNotificationByIdUseCase(
            notificationRepository: gh<_i710.NotificationRepository>()));
    gh.factory<_i161.CameraDetectionBloc>(
        () => _i161.CameraDetectionBloc(gh<_i389.PostYogaPoseUC>()));
    gh.factory<_i902.LoginBloc>(() => _i902.LoginBloc(
          login: gh<_i470.LoginUseCase>(),
          oauthTokenManager: gh<_i132.OauthTokenManager>(),
        ));
    gh.singleton<_i856.GetListYogaPosesUc>(
        () => _i856.GetListYogaPosesUc(gh<_i153.YogaPosesRepository>()));
    gh.singleton<_i404.GetYogaPoseDetailsUc>(
        () => _i404.GetYogaPoseDetailsUc(gh<_i153.YogaPosesRepository>()));
    gh.factory<_i338.RegisterBloc>(() => _i338.RegisterBloc(
          register: gh<_i686.RegisterUseCase>(),
          oauthTokenManager: gh<_i132.OauthTokenManager>(),
        ));
    gh.factory<_i878.PracticeSessionBloc>(() => _i878.PracticeSessionBloc(
        repository: gh<_i930.PracticeSessionRepository>()));
    gh.factory<_i771.GroupFeedBloc>(
        () => _i771.GroupFeedBloc(gh<_i636.GroupPostsRepository>()));
    gh.singleton<_i8.AccountPageBloc>(() => _i8.AccountPageBloc(
          getInformationUc: gh<_i924.GetInformationUc>(),
          updateProfileUc: gh<_i489.UpdateProfileUc>(),
        ));
    gh.factory<_i313.HistoryBloc>(() => _i313.HistoryBloc(
          gh<_i930.PracticeSessionRepository>(),
          gh<_i153.YogaPosesRepository>(),
        ));
    gh.singleton<_i562.CreateBodyProgressUc>(
        () => _i562.CreateBodyProgressUc(gh<_i654.BodyProgressRepository>()));
    gh.singleton<_i652.GetAllBodyProgressUc>(
        () => _i652.GetAllBodyProgressUc(gh<_i654.BodyProgressRepository>()));
    gh.singleton<_i426.GetLatestBodyProgressUc>(() =>
        _i426.GetLatestBodyProgressUc(gh<_i654.BodyProgressRepository>()));
    gh.factory<_i950.MyBodyBloc>(() => _i950.MyBodyBloc(
          gh<_i652.GetAllBodyProgressUc>(),
          gh<_i426.GetLatestBodyProgressUc>(),
          gh<_i562.CreateBodyProgressUc>(),
        ));
    gh.singleton<_i779.GetAllRoutinesUc>(
        () => _i779.GetAllRoutinesUc(gh<_i398.RoutineRepository>()));
    gh.singleton<_i443.GetRoutineDetailsUc>(
        () => _i443.GetRoutineDetailsUc(gh<_i398.RoutineRepository>()));
    gh.singleton<_i405.GetInProgressRoutinesUc>(
        () => _i405.GetInProgressRoutinesUc(gh<_i398.RoutineRepository>()));
    gh.singleton<_i405.GetCompletedRoutinesUc>(
        () => _i405.GetCompletedRoutinesUc(gh<_i398.RoutineRepository>()));
    gh.singleton<_i576.StartRoutineUc>(
        () => _i576.StartRoutineUc(gh<_i398.RoutineRepository>()));
    gh.singleton<_i843.UpdateRoutineProgressUc>(
        () => _i843.UpdateRoutineProgressUc(gh<_i398.RoutineRepository>()));
    gh.factory<_i306.NotificationPageBloc>(() => _i306.NotificationPageBloc(
          gh<_i1054.GetNotificationsUseCase>(),
          gh<_i1046.GetNotificationByIdUseCase>(),
        ));
    gh.factory<_i682.RoutinesBloc>(() => _i682.RoutinesBloc(
          gh<_i779.GetAllRoutinesUc>(),
          gh<_i405.GetInProgressRoutinesUc>(),
          gh<_i405.GetCompletedRoutinesUc>(),
        ));
    gh.factory<_i296.SearchYogaPoseBloc>(() => _i296.SearchYogaPoseBloc(
        getListYogaPoses: gh<_i856.GetListYogaPosesUc>()));
    gh.singleton<_i267.HomePageBloc>(() =>
        _i267.HomePageBloc(getListYogaPoses: gh<_i856.GetListYogaPosesUc>()));
    gh.factory<_i659.RoutineDetailsBloc>(() => _i659.RoutineDetailsBloc(
          gh<_i443.GetRoutineDetailsUc>(),
          gh<_i576.StartRoutineUc>(),
          gh<_i843.UpdateRoutineProgressUc>(),
        ));
    gh.factory<_i133.PoseDetailsBloc>(() => _i133.PoseDetailsBloc(
        getYogaPoseDetails: gh<_i404.GetYogaPoseDetailsUc>()));
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}
