import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_bloc.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// Simple placeholder for the History tab. Replace with your real History page.
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      body: Center(
        child: Text('History', style: textStyle),
      ),
    );
  }
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
      // Home
      BlocProvider.value(
        value: _homeBloc,
        child: HomePagePage(),
      ),
      // History (placeholder) — replace with real page when available
      // placeholder inserted; actual class defined at file-level below
      const SizedBox.shrink(),
      // Account
      BlocProvider.value(
        value: _accountBloc,
        child: AccountPagePage(),
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
                icon: Image.asset(AppImages.ic_clock, width: 24, height: 24), label: 'History'),
            BottomNavigationBarItem(
                icon: Image.asset(AppImages.ic_account, width: 24, height: 24), label: 'Account'),
          ],
          onTap: (value) => setState(() {
            currentIndex = value;
          }),
        ));
  }
}
