import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    HomePagePage(),
    HomePagePage(),
    HomePagePage(),
  ];

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
