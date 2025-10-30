import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/main.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_bloc.dart';
import 'package:flutter_starter/presenter/pages/account_page/overall_account_page.dart';
import 'package:flutter_starter/presenter/pages/activities_page/activities_page.dart';
import 'package:flutter_starter/presenter/pages/friends_page/friends_page.dart';
import 'package:flutter_starter/presenter/pages/history/history.dart';
import 'package:flutter_starter/presenter/pages/history/history_bloc.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_bloc.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:flutter_starter/data/states/activities/activities_bloc.dart';
import 'package:flutter_starter/data/states/activities/activities_event.dart';
import 'package:flutter_starter/data/states/friends/friends_bloc.dart';
import 'package:flutter_starter/data/states/friends/friends_event.dart';
import 'package:showcaseview/showcaseview.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  late final HomePageBloc _homeBloc;
  late final AccountPageBloc _accountBloc;
  late final HistoryBloc _historyBloc;
  late final ActivitiesBloc _activitiesBloc;
  late final FriendsBloc _friendsBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = provider.get<HomePageBloc>();
    _accountBloc = provider.get<AccountPageBloc>();
    _historyBloc = provider.get<HistoryBloc>();
    _activitiesBloc = provider.get<ActivitiesBloc>();
    _friendsBloc = provider.get<FriendsBloc>();

    // Load initial data for Activities and Friends
    _activitiesBloc
      ..add(const ActivitiesLoadFriendActivities())
      ..add(const ActivitiesLoadMyActivities());
    _friendsBloc
      ..add(const FriendsLoadFriends())
      ..add(const FriendsLoadPendingRequests());
  }

  @override
  void dispose() {
    // Don't close blocs - they're managed by the DI container
    // Closing singleton blocs causes memory leaks
    super.dispose();
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: _homeBloc),
            BlocProvider.value(value: _accountBloc),
          ],
          child: HomePagePage(),
        );
      case 1:
        return BlocProvider.value(
          value: _activitiesBloc,
          child: const ActivitiesPageContent(),
        );
      case 2:
        return BlocProvider.value(
          value: _friendsBloc,
          child: const FriendsPageContent(),
        );
      case 3:
        return BlocProvider.value(
          value: _historyBloc,
          child: HistoryPage(),
        );
      case 4:
        return BlocProvider.value(
          value: _accountBloc,
          child: OverallAccountPage(),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(currentIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.primaryPurple,
            unselectedItemColor: Colors.grey.shade500,
            selectedFontSize: 13,
            unselectedFontSize: 12,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 11,
              color: Colors.grey.shade600,
            ),
            showUnselectedLabels: true,
            elevation: 0,
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.home_outlined, size: 24),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.primaryPurple.withOpacity(0.1),
                  ),
                  child: const Icon(Icons.home_rounded, size: 24, color: AppColors.primaryPurple),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.rss_feed_outlined, size: 24),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.secondaryTeal.withOpacity(0.1),
                  ),
                  child: Icon(Icons.rss_feed_rounded, size: 24, color: AppColors.secondaryTeal),
                ),
                label: 'Feed',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.people_outline, size: 24),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue.withOpacity(0.1),
                  ),
                  child: const Icon(Icons.people_rounded, size: 24, color: Colors.blue),
                ),
                label: 'Friends',
              ),
              BottomNavigationBarItem(
                icon: Showcase(
                  key: listHistoryShowCaseWidget,
                  description: 'See your workout history here',
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.history_outlined, size: 24),
                  ),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orange.withOpacity(0.1),
                  ),
                  child: const Icon(Icons.history_rounded, size: 24, color: Colors.orange),
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Showcase(
                  key: accountShowCaseWidget,
                  description: 'Open your account and settings here',
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.person_outline, size: 24),
                  ),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.accentCoral.withOpacity(0.1),
                  ),
                  child: const Icon(Icons.person_rounded, size: 24, color: AppColors.accentCoral),
                ),
                label: 'Account',
              ),
            ],
            onTap: (value) {
              setState(() {
                currentIndex = value;
                // If the user navigates to the Account tab we consider the home showcase finished
                if (value == 4 && homeShowcaseCompletedNotifier.value == false) {
                  homeShowcaseCompletedNotifier.value = true;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
