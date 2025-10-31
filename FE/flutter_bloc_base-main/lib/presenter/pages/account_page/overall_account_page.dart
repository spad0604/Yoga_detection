import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_bloc.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_event.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_state.dart';
import 'package:flutter_starter/presenter/pages/account_page/logout_dialog.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:flutter_starter/data/states/auth/auth_event.dart';
import 'package:flutter_starter/data/states/auth/auth_bloc.dart';

part 'overall_item.dart';

@RoutePage()
class OverallAccountPage extends StatefulWidget implements AutoRouteWrapper {
  const OverallAccountPage();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<AccountPageBloc>.value(
      value: provider.get<AccountPageBloc>(),
      child: this,
    );
  }

  @override
  State<OverallAccountPage> createState() => _OverallAccountPageState();
}

class _OverallAccountPageState extends State<OverallAccountPage> {
  AccountPageBloc get _bloc => context.read<AccountPageBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(AccountPageEvent.getInformation());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountPageBloc, AccountPageState>(
      bloc: _bloc,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.gradientPurple,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white, Colors.white.withOpacity(0.9)],
            ).createShader(bounds),
            child: const Text(
              'Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              // Profile Card with gradient
              GestureDetector(
                onTap: () {
                  context.router.push(AccountRouteRoute());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: AppColors.gradientPurple,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryPurple.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        child: _bloc.state.information?.avatarUrl != null
                            ? Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    _bloc.state.information!.avatarUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 30,
                              ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_bloc.state.information?.firstName ?? ''} ${_bloc.state.information?.lastName ?? ''}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${_bloc.state.information?.email ?? ''}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.white.withOpacity(0.9),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Settings List
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 16),
                    _buildModernItem(
                      context,
                      icon: Icons.fitness_center,
                      title: 'My Body',
                      subtitle: 'Track your progress',
                      color: AppColors.primaryPurple,
                      onTap: () {
                        context.router.push(const MyBodyRoute());
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildModernItem(
                      context,
                      icon: Icons.book,
                      title: 'Workout Programs',
                      subtitle: 'Explore routines',
                      color: AppColors.secondaryTeal,
                      onTap: () {
                        context.router.push(const RoutinesRoute());
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildModernItem(
                      context,
                      icon: Icons.people,
                      title: 'Friends',
                      subtitle: 'Connect with friends',
                      color: Colors.blue,
                      onTap: () {
                        context.router.push(const FriendsRoute());
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildModernItem(
                      context,
                      icon: Icons.group,
                      title: 'Groups',
                      subtitle: 'Join yoga communities',
                      color: Colors.green,
                      onTap: () {
                        context.router.push(const GroupsRoute());
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildModernItem(
                      context,
                      icon: Icons.rss_feed,
                      title: 'Activity Feed',
                      subtitle: 'See what friends are doing',
                      color: Colors.orange,
                      onTap: () {
                        context.router.push(const ActivitiesRoute());
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildModernItem(
                      context,
                      icon: Icons.notifications,
                      title: 'Notifications',
                      subtitle: 'Manage your alerts',
                      color: AppColors.secondaryTeal,
                      onTap: () {
                        context.router.push(NotificationRouteRoute());
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildModernItem(
                      context,
                      icon: Icons.settings,
                      title: 'Settings',
                      subtitle: 'App preferences',
                      color: AppColors.accentCoral,
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    _buildModernItem(
                      context,
                      icon: Icons.help,
                      title: 'Help & Support',
                      subtitle: 'Get assistance',
                      color: AppColors.primaryPurpleLight,
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    _buildModernItem(
                      context,
                      icon: Icons.logout,
                      title: 'Log Out',
                      subtitle: 'Sign out of your account',
                      color: Colors.red,
                      onTap: () async {
                        final shouldLogout = await showModalBottomSheet<bool>(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: SafeArea(
                              top: false,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: LogoutDialog(),
                              ),
                            ),
                          ),
                        );
                        if (shouldLogout == true) {
                          context.read<AuthBloc>().add(const AuthLoggedOut());
                          context.router.replace(LoginRoute());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade400,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
