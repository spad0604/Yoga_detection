import 'package:auto_route/auto_route.dart';
import 'package:flutter_starter/data/states/auth/auth_bloc.dart';
import 'package:flutter_starter/presenter/pages/home/home.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page.dart';
import 'package:flutter_starter/presenter/pages/login/login.dart';
import 'package:flutter_starter/presenter/pages/splash/splash.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/presenter/pages/camera_detection/camera_detection.dart';
import 'package:flutter_starter/presenter/pages/forgot_password/forgot_password.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page.dart';

import 'package:flutter_starter/presenter/pages/pose_details/pose_details.dart';
import 'package:flutter_starter/presenter/pages/search_yoga_pose/search_yoga_pose.dart';
import '../pages/register/register.dart';

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

            if (isAuthorizedRoute(resolver.routeName) && !isAuthenticated) {
              return resolver.redirect(LoginRoute(), replace: true);
            }

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
