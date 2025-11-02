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
/// [ActivitiesPage]
class ActivitiesRoute extends PageRouteInfo<void> {
  const ActivitiesRoute({List<PageRouteInfo>? children})
    : super(ActivitiesRoute.name, initialChildren: children);

  static const String name = 'ActivitiesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const ActivitiesPage());
    },
  );
}

/// generated route for
/// [AdminAddEditPosePage]
class AdminAddEditPoseRoute extends PageRouteInfo<AdminAddEditPoseRouteArgs> {
  AdminAddEditPoseRoute({
    Key? key,
    String? poseId,
    String? initialName,
    int? initialMinutes,
    int? initialCalories,
    String? initialLevel,
    String? initialDescription,
    String? initialImageUrl,
    List<PageRouteInfo>? children,
  }) : super(
         AdminAddEditPoseRoute.name,
         args: AdminAddEditPoseRouteArgs(
           key: key,
           poseId: poseId,
           initialName: initialName,
           initialMinutes: initialMinutes,
           initialCalories: initialCalories,
           initialLevel: initialLevel,
           initialDescription: initialDescription,
           initialImageUrl: initialImageUrl,
         ),
         initialChildren: children,
       );

  static const String name = 'AdminAddEditPoseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AdminAddEditPoseRouteArgs>(
        orElse: () => const AdminAddEditPoseRouteArgs(),
      );
      return AdminAddEditPosePage(
        key: args.key,
        poseId: args.poseId,
        initialName: args.initialName,
        initialMinutes: args.initialMinutes,
        initialCalories: args.initialCalories,
        initialLevel: args.initialLevel,
        initialDescription: args.initialDescription,
        initialImageUrl: args.initialImageUrl,
      );
    },
  );
}

class AdminAddEditPoseRouteArgs {
  const AdminAddEditPoseRouteArgs({
    this.key,
    this.poseId,
    this.initialName,
    this.initialMinutes,
    this.initialCalories,
    this.initialLevel,
    this.initialDescription,
    this.initialImageUrl,
  });

  final Key? key;

  final String? poseId;

  final String? initialName;

  final int? initialMinutes;

  final int? initialCalories;

  final String? initialLevel;

  final String? initialDescription;

  final String? initialImageUrl;

  @override
  String toString() {
    return 'AdminAddEditPoseRouteArgs{key: $key, poseId: $poseId, initialName: $initialName, initialMinutes: $initialMinutes, initialCalories: $initialCalories, initialLevel: $initialLevel, initialDescription: $initialDescription, initialImageUrl: $initialImageUrl}';
  }
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
/// [FriendsPage]
class FriendsRoute extends PageRouteInfo<void> {
  const FriendsRoute({List<PageRouteInfo>? children})
    : super(FriendsRoute.name, initialChildren: children);

  static const String name = 'FriendsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const FriendsPage());
    },
  );
}

/// generated route for
/// [GroupFeedPage]
class GroupFeedRoute extends PageRouteInfo<GroupFeedRouteArgs> {
  GroupFeedRoute({
    Key? key,
    required String groupId,
    String groupName = 'Group',
    List<PageRouteInfo>? children,
  }) : super(
         GroupFeedRoute.name,
         args: GroupFeedRouteArgs(
           key: key,
           groupId: groupId,
           groupName: groupName,
         ),
         rawPathParams: {'groupId': groupId},
         rawQueryParams: {'groupName': groupName},
         initialChildren: children,
       );

  static const String name = 'GroupFeedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<GroupFeedRouteArgs>(
        orElse: () => GroupFeedRouteArgs(
          groupId: pathParams.getString('groupId'),
          groupName: queryParams.getString('groupName', 'Group'),
        ),
      );
      return WrappedRoute(
        child: GroupFeedPage(
          key: args.key,
          groupId: args.groupId,
          groupName: args.groupName,
        ),
      );
    },
  );
}

class GroupFeedRouteArgs {
  const GroupFeedRouteArgs({
    this.key,
    required this.groupId,
    this.groupName = 'Group',
  });

  final Key? key;

  final String groupId;

  final String groupName;

  @override
  String toString() {
    return 'GroupFeedRouteArgs{key: $key, groupId: $groupId, groupName: $groupName}';
  }
}

/// generated route for
/// [GroupsPage]
class GroupsRoute extends PageRouteInfo<void> {
  const GroupsRoute({List<PageRouteInfo>? children})
    : super(GroupsRoute.name, initialChildren: children);

  static const String name = 'GroupsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const GroupsPage());
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
/// [MyBodyPage]
class MyBodyRoute extends PageRouteInfo<void> {
  const MyBodyRoute({List<PageRouteInfo>? children})
    : super(MyBodyRoute.name, initialChildren: children);

  static const String name = 'MyBodyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const MyBodyPage());
    },
  );
}

/// generated route for
/// [NotificationDetailsPage]
class NotificationDetailsRoute
    extends PageRouteInfo<NotificationDetailsRouteArgs> {
  NotificationDetailsRoute({
    Key? key,
    required NotificationResponse notification,
    List<PageRouteInfo>? children,
  }) : super(
         NotificationDetailsRoute.name,
         args: NotificationDetailsRouteArgs(
           key: key,
           notification: notification,
         ),
         initialChildren: children,
       );

  static const String name = 'NotificationDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationDetailsRouteArgs>();
      return NotificationDetailsPage(
        key: args.key,
        notification: args.notification,
      );
    },
  );
}

class NotificationDetailsRouteArgs {
  const NotificationDetailsRouteArgs({this.key, required this.notification});

  final Key? key;

  final NotificationResponse notification;

  @override
  String toString() {
    return 'NotificationDetailsRouteArgs{key: $key, notification: $notification}';
  }
}

/// generated route for
/// [NotificationPagePage]
class NotificationRouteRoute extends PageRouteInfo<void> {
  const NotificationRouteRoute({List<PageRouteInfo>? children})
    : super(NotificationRouteRoute.name, initialChildren: children);

  static const String name = 'NotificationRouteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const NotificationPagePage());
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
/// [PoseAttemptDetailsPage]
class PoseAttemptDetailsRoute
    extends PageRouteInfo<PoseAttemptDetailsRouteArgs> {
  PoseAttemptDetailsRoute({
    Key? key,
    required UserYogaPoseModel poseAttempt,
    List<PageRouteInfo>? children,
  }) : super(
         PoseAttemptDetailsRoute.name,
         args: PoseAttemptDetailsRouteArgs(key: key, poseAttempt: poseAttempt),
         initialChildren: children,
       );

  static const String name = 'PoseAttemptDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PoseAttemptDetailsRouteArgs>();
      return PoseAttemptDetailsPage(
        key: args.key,
        poseAttempt: args.poseAttempt,
      );
    },
  );
}

class PoseAttemptDetailsRouteArgs {
  const PoseAttemptDetailsRouteArgs({this.key, required this.poseAttempt});

  final Key? key;

  final UserYogaPoseModel poseAttempt;

  @override
  String toString() {
    return 'PoseAttemptDetailsRouteArgs{key: $key, poseAttempt: $poseAttempt}';
  }
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
/// [PoseResultPage]
class PoseResultRoute extends PageRouteInfo<PoseResultRouteArgs> {
  PoseResultRoute({
    Key? key,
    required UserYogaPoseModel result,
    String? poseName,
    List<PageRouteInfo>? children,
  }) : super(
         PoseResultRoute.name,
         args: PoseResultRouteArgs(
           key: key,
           result: result,
           poseName: poseName,
         ),
         initialChildren: children,
       );

  static const String name = 'PoseResultRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PoseResultRouteArgs>();
      return PoseResultPage(
        key: args.key,
        result: args.result,
        poseName: args.poseName,
      );
    },
  );
}

class PoseResultRouteArgs {
  const PoseResultRouteArgs({this.key, required this.result, this.poseName});

  final Key? key;

  final UserYogaPoseModel result;

  final String? poseName;

  @override
  String toString() {
    return 'PoseResultRouteArgs{key: $key, result: $result, poseName: $poseName}';
  }
}

/// generated route for
/// [PracticeSessionSummaryPage]
class PracticeSessionSummaryRoute
    extends PageRouteInfo<PracticeSessionSummaryRouteArgs> {
  PracticeSessionSummaryRoute({
    Key? key,
    required PracticeSession session,
    List<PageRouteInfo>? children,
  }) : super(
         PracticeSessionSummaryRoute.name,
         args: PracticeSessionSummaryRouteArgs(key: key, session: session),
         initialChildren: children,
       );

  static const String name = 'PracticeSessionSummaryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PracticeSessionSummaryRouteArgs>();
      return PracticeSessionSummaryPage(key: args.key, session: args.session);
    },
  );
}

class PracticeSessionSummaryRouteArgs {
  const PracticeSessionSummaryRouteArgs({this.key, required this.session});

  final Key? key;

  final PracticeSession session;

  @override
  String toString() {
    return 'PracticeSessionSummaryRouteArgs{key: $key, session: $session}';
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
/// [RoutineDetailsPage]
class RoutineDetailsRoute extends PageRouteInfo<RoutineDetailsRouteArgs> {
  RoutineDetailsRoute({
    Key? key,
    required String routineId,
    List<PageRouteInfo>? children,
  }) : super(
         RoutineDetailsRoute.name,
         args: RoutineDetailsRouteArgs(key: key, routineId: routineId),
         initialChildren: children,
       );

  static const String name = 'RoutineDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RoutineDetailsRouteArgs>();
      return WrappedRoute(
        child: RoutineDetailsPage(key: args.key, routineId: args.routineId),
      );
    },
  );
}

class RoutineDetailsRouteArgs {
  const RoutineDetailsRouteArgs({this.key, required this.routineId});

  final Key? key;

  final String routineId;

  @override
  String toString() {
    return 'RoutineDetailsRouteArgs{key: $key, routineId: $routineId}';
  }
}

/// generated route for
/// [RoutinePracticeSessionPage]
class RoutinePracticeSessionRoute
    extends PageRouteInfo<RoutinePracticeSessionRouteArgs> {
  RoutinePracticeSessionRoute({
    Key? key,
    required String routineId,
    List<PageRouteInfo>? children,
  }) : super(
         RoutinePracticeSessionRoute.name,
         args: RoutinePracticeSessionRouteArgs(key: key, routineId: routineId),
         initialChildren: children,
       );

  static const String name = 'RoutinePracticeSessionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RoutinePracticeSessionRouteArgs>();
      return RoutinePracticeSessionPage(
        key: args.key,
        routineId: args.routineId,
      );
    },
  );
}

class RoutinePracticeSessionRouteArgs {
  const RoutinePracticeSessionRouteArgs({this.key, required this.routineId});

  final Key? key;

  final String routineId;

  @override
  String toString() {
    return 'RoutinePracticeSessionRouteArgs{key: $key, routineId: $routineId}';
  }
}

/// generated route for
/// [RoutinesPage]
class RoutinesRoute extends PageRouteInfo<void> {
  const RoutinesRoute({List<PageRouteInfo>? children})
    : super(RoutinesRoute.name, initialChildren: children);

  static const String name = 'RoutinesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const RoutinesPage());
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
/// [SocialFeedPage]
class SocialFeedRoute extends PageRouteInfo<void> {
  const SocialFeedRoute({List<PageRouteInfo>? children})
    : super(SocialFeedRoute.name, initialChildren: children);

  static const String name = 'SocialFeedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SocialFeedPage());
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

/// generated route for
/// [WaitingResultPage]
class WaitingResultRoute extends PageRouteInfo<void> {
  const WaitingResultRoute({List<PageRouteInfo>? children})
    : super(WaitingResultRoute.name, initialChildren: children);

  static const String name = 'WaitingResultRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WaitingResultPage();
    },
  );
}
