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
/// [ChangePasswordPage]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: ChangePasswordPage());
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
/// [HistoryPage]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
    : super(HistoryRoute.name, initialChildren: children);

  static const String name = 'HistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const HistoryPage());
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
/// [OverallAccountPage]
class OverallAccountRoute extends PageRouteInfo<void> {
  const OverallAccountRoute({List<PageRouteInfo>? children})
    : super(OverallAccountRoute.name, initialChildren: children);

  static const String name = 'OverallAccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: OverallAccountPage());
    },
  );
}

/// generated route for
/// [PoseDetailsPage]
class PoseDetailsRoute extends PageRouteInfo<PoseDetailsRouteArgs> {
  PoseDetailsRoute({
    required YogaPoseDetails item,
    List<PageRouteInfo>? children,
  }) : super(
         PoseDetailsRoute.name,
         args: PoseDetailsRouteArgs(item: item),
         initialChildren: children,
       );

  static const String name = 'PoseDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PoseDetailsRouteArgs>();
      return WrappedRoute(child: PoseDetailsPage(item: args.item));
    },
  );
}

class PoseDetailsRouteArgs {
  const PoseDetailsRouteArgs({required this.item});

  final YogaPoseDetails item;

  @override
  String toString() {
    return 'PoseDetailsRouteArgs{item: $item}';
  }
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
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
    : super(ResetPasswordRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: ResetPasswordPage());
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
