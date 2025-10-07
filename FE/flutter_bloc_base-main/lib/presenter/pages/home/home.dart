import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/gen/app_images.dart';
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

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  late final List<Widget> _pages;
  late final HomePageBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = provider.get<HomePageBloc>();
    _pages = List.generate(
      3,
      (_) => BlocProvider.value(
        value: _homeBloc,
        child: HomePagePage(),
      ),
    );
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
