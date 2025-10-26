import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_starter/core/firebase_config.dart';
import 'package:flutter_starter/data/states/auth/auth_bloc.dart';
import 'package:flutter_starter/data/states/auth/auth_state.dart';
import 'package:flutter_starter/data/states/settings/settings_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/flavors.dart';
import 'package:flutter_starter/presenter/navigation/navigation_logger.dart';

class App extends StatefulWidget {
  static final _appRouter = provider.get<AppRouter>();

  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final FirebaseConfig firebaseConfig = FirebaseConfig();

  @override
  void initState() {
    super.initState();
    firebaseConfig.initFCM();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<SettingsBloc>().state.theme;

    return MultiBlocListener(
      listeners: [
        // Automatically navigate back to the login page when the user logged out
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (previousState, state) =>
              previousState.loggedIn != state.loggedIn && state.loggedIn == false,
          listener: (context, state) => context.router.replaceAll([const LoginRoute()]),
        ),
      ],
      child: MaterialApp.router(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        title: F.title,
        theme: appTheme.themeData,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: [
          ...context.localizationDelegates,
          // more delegates here
        ],
        routerConfig: App._appRouter.config(
          navigatorObservers: () => [
            if (kDebugMode) NavigationLogger(),
          ],
        ),
      ),
    );
  }
}
