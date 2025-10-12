import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_starter/data/states/auth/auth_bloc.dart';
import 'package:flutter_starter/data/states/bloc_observer.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/app.dart';
import 'package:flutter_starter/presenter/languages/languages.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:flutter_starter/services/oauth_token_manager/oauth_token_manager.dart';

final GlobalKey overViewShowCaseWidget = GlobalKey();
final GlobalKey listYogaPoseShowCaseWidget = GlobalKey();
final GlobalKey viewAllYogaPoseShowCaseWidget = GlobalKey();
final GlobalKey listHistoryShowCaseWidget = GlobalKey();
final GlobalKey accountShowCaseWidget = GlobalKey();
final GlobalKey notificationShowCaseWidget = GlobalKey();
final GlobalKey favoriteShowCaseWidget = GlobalKey();
final GlobalKey bellShowCaseWidget = GlobalKey();
final GlobalKey heartShowCaseWidget = GlobalKey();
final GlobalKey minutesShowCaseWidget = GlobalKey();
final GlobalKey caloriesShowCaseWidget = GlobalKey();
final GlobalKey playShowCaseWidget = GlobalKey();
// Notifier used to signal that the home showcase sequence has been completed by the user
final ValueNotifier<bool> homeShowcaseCompletedNotifier = ValueNotifier<bool>(false);

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await configureDependencies();

  configLoading();

  Bloc.observer = AppBlocObserver(provider.get<AuthBloc>());

  runApp(
    AppLanguages(
      child: GlobalBlocProviders(
        child: ShowCaseWidget(
          onComplete: (index, key) {
            // When the Account step completes in the home sequence, mark showcase as finished
            if (key == accountShowCaseWidget && homeShowcaseCompletedNotifier.value == false) {
              homeShowcaseCompletedNotifier.value = true;
              // Persist that the user has seen the home showcase so it won't run again
              try {
                provider.get<OauthTokenManager>().isFirstLaunch(false);
              } catch (_) {
                // ignore errors when persisting the flag; non-fatal
              }
            }
          },
          builder: (context) => App(),
        ),
      ),
    ),
  );
}
