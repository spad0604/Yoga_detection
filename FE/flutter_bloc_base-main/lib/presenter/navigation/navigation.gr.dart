// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'navigation.dart';

/// generated route for
/// [AccountPagePage]
class AccountRouteRoute extends PageRouteInfo<void> {
  const AccountRouteRoute({List<PageRouteInfo>? children})
    : super(AccountRouteRoute.name, initialChildren: children);

  static const String name = 'AccountRouteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: AccountPagePage());
    },
  );
}

/// generated route for
/// [CameraDetectionPage]
class CameraDetectionRoute extends PageRouteInfo<void> {
  const CameraDetectionRoute({List<PageRouteInfo>? children})
    : super(CameraDetectionRoute.name, initialChildren: children);

  static const String name = 'CameraDetectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: CameraDetectionPage());
    },
  );
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: ForgotPasswordPage());
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        HomeRoute.name,
        args: HomeRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>(
        orElse: () => const HomeRouteArgs(),
      );
      return HomePage(key: args.key);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [HomePagePage]
class HomeRouteRoute extends PageRouteInfo<void> {
  const HomeRouteRoute({List<PageRouteInfo>? children})
    : super(HomeRouteRoute.name, initialChildren: children);

  static const String name = 'HomeRouteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: HomePagePage());
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: LoginPage());
    },
  );
}

/// generated route for
/// [PoseDetailsPage]
class PoseDetailsRoute extends PageRouteInfo<void> {
  const PoseDetailsRoute({List<PageRouteInfo>? children})
    : super(PoseDetailsRoute.name, initialChildren: children);

  static const String name = 'PoseDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: PoseDetailsPage());
    },
  );
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: RegisterPage());
    },
  );
}

/// generated route for
/// [SearchYogaPosePage]
class SearchYogaPoseRoute extends PageRouteInfo<void> {
  const SearchYogaPoseRoute({List<PageRouteInfo>? children})
    : super(SearchYogaPoseRoute.name, initialChildren: children);

  static const String name = 'SearchYogaPoseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: SearchYogaPosePage());
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: SplashPage());
    },
  );
}
