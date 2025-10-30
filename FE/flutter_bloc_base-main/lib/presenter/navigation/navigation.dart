import 'package:auto_route/auto_route.dart';
import 'package:flutter_starter/data/states/auth/auth_bloc.dart';
import 'package:flutter_starter/presenter/pages/account_page/overall_account_page.dart';
import 'package:flutter_starter/presenter/pages/home/home.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page.dart';
import 'package:flutter_starter/presenter/pages/login/login.dart';
import 'package:flutter_starter/presenter/pages/splash/splash.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/presenter/pages/camera_detection/camera_detection.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/change_password.dart';
import 'package:flutter_starter/presenter/pages/pose_details/pose_details.dart';
import 'package:flutter_starter/presenter/pages/search_yoga_pose/search_yoga_pose.dart';
import '../pages/register/register.dart';
import '../pages/forgot_password/reset_password.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:flutter_starter/presenter/pages/history/history.dart';
import 'package:flutter_starter/presenter/pages/notification_page/notification_page.dart';
import 'package:flutter_starter/presenter/pages/routines_page/routines_page.dart';
import 'package:flutter_starter/presenter/pages/routine_details/routine_details_page.dart';
import 'package:flutter_starter/presenter/pages/friends_page/friends_page.dart';
import 'package:flutter_starter/presenter/pages/groups_page/groups_page.dart';
import 'package:flutter_starter/presenter/pages/activities_page/activities_page.dart';
import 'package:flutter_starter/presenter/pages/my_body_page/my_body_page.dart';
import 'package:flutter_starter/presenter/pages/camera_detection/waiting_result_page.dart';
import 'package:flutter_starter/presenter/pages/group_feed/group_feed_page.dart';

part 'navigation.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  final AuthBloc _authBloc;

  AppRouter({
    required AuthBloc authBloc,
  }) : _authBloc = authBloc;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SplashRoute.page),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(path: '/register', page: RegisterRoute.page),
        AutoRoute(path: '/home', page: HomeRoute.page),
        AutoRoute(path: '/camera-detection', page: CameraDetectionRoute.page),
        AutoRoute(path: '/forgot-password', page: ForgotPasswordRoute.page),
        AutoRoute(path: '/account', page: AccountRouteRoute.page),
        AutoRoute(path: '/pose-details', page: PoseDetailsRoute.page),
        AutoRoute(path: '/search-yoga-pose', page: SearchYogaPoseRoute.page),
        AutoRoute(path: '/change-password', page: ChangePasswordRoute.page),
        AutoRoute(path: '/reset-password', page: ResetPasswordRoute.page),
        AutoRoute(path: '/history', page: HistoryRoute.page),
        AutoRoute(path: '/overall-account', page: OverallAccountRoute.page),
        AutoRoute(path: '/notifications', page: NotificationRouteRoute.page),
        AutoRoute(path: '/routines', page: RoutinesRoute.page),
        AutoRoute(path: '/routine-details/:id', page: RoutineDetailsRoute.page),
        AutoRoute(path: '/friends', page: FriendsRoute.page),
        AutoRoute(path: '/groups', page: GroupsRoute.page),
        AutoRoute(path: '/group-feed/:groupId', page: GroupFeedRoute.page),
        AutoRoute(path: '/activities', page: ActivitiesRoute.page),
        AutoRoute(path: '/my-body', page: MyBodyRoute.page),
        AutoRoute(path: '/waiting-result', page: WaitingResultRoute.page),
      ];

  bool isUnauthorizedRoute(String routeName) => [
        LoginRoute.name,
      ].contains(routeName);

  bool isAuthorizedRoute(String routeName) => [
        HomeRoute.name,
      ].contains(routeName);

  @override
  List<AutoRouteGuard> get guards => [
        AutoRouteGuard.simple(
          (resolver, router) {
            final isAuthenticated = _authBloc.state.loggedIn;

            // If the user is trying to access an authorized route (e.g. Home)
            // but is NOT authenticated, redirect them to Login.
            if (isAuthorizedRoute(resolver.routeName) && !isAuthenticated) {
              return resolver.redirect(LoginRoute(), replace: true);
            }

            // If the user is trying to access an unauthorized route (e.g. Login)
            // but IS already authenticated, redirect them to Home to avoid showing Login.
            if (isUnauthorizedRoute(resolver.routeName) && isAuthenticated) {
              return resolver.redirect(HomeRoute(), replace: true);
            }

            resolver.next(true);
          },
        ),
      ];

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
}
