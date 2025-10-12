import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_bloc.dart';
import 'package:flutter_starter/presenter/pages/account_page/overall_account_page.dart';
import 'package:flutter_starter/presenter/pages/history/history.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/main.dart';
import 'package:showcaseview/showcaseview.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  late final List<Widget> _pages;
  late final HomePageBloc _homeBloc;
  late final AccountPageBloc _accountBloc;
  @override
  void initState() {
    super.initState();
    _homeBloc = provider.get<HomePageBloc>();
    _accountBloc = provider.get<AccountPageBloc>();
    _pages = [
      // Home (provide both HomePageBloc and AccountPageBloc so descendants can read either)
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _homeBloc),
          BlocProvider.value(value: _accountBloc),
        ],
        child: HomePagePage(),
      ),
      // History (real page with calendar)
      HistoryPage(),
      // Account
      BlocProvider.value(
        value: _accountBloc,
        child: OverallAccountPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(AppImages.ic_home, width: 24, height: 24), label: 'Home'),
            BottomNavigationBarItem(
                icon: Showcase(
                  key: listHistoryShowCaseWidget,
                  description: 'See your workout history here',
                  child: Image.asset(AppImages.ic_clock, width: 24, height: 24),
                ),
                label: 'History'),
            BottomNavigationBarItem(
                icon: Showcase(
                  key: accountShowCaseWidget,
                  description: 'Open your account and settings here',
                  child: Image.asset(AppImages.ic_account, width: 24, height: 24),
                ),
                label: 'Account'),
          ],
          onTap: (value) => setState(() {
            currentIndex = value;
            // If the user navigates to the Account tab we consider the home showcase finished
            if (value == 2 && homeShowcaseCompletedNotifier.value == false) {
              homeShowcaseCompletedNotifier.value = true;
            }
          }),
        ));
  }
}
