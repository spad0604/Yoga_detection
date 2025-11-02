import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/services/oauth_token_manager/oauth_token_manager.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_bloc.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_event.dart';
import 'package:flutter_starter/presenter/pages/account_page/account_page_state.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_bloc.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_event.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_state.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:flutter_starter/core/utils/user_preferences.dart';
import 'package:flutter_starter/presenter/pages/admin/admin_add_edit_pose_page.dart';
import 'package:flutter_starter/presenter/widgets/admin_pose_delete_dialog.dart';
import 'package:flutter_starter/main.dart';
import 'package:showcaseview/showcaseview.dart';
import 'dart:math';

part 'welcome_banner.dart';
part 'over_view.dart';
part 'yoga_poses_item.dart';

// TODO: Add the page to the router
@RoutePage()
class HomePagePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePagePage();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomePageBloc>.value(
          value: provider.get<HomePageBloc>(),
        ),
        BlocProvider<AccountPageBloc>.value(
          value: provider.get<AccountPageBloc>(),
        ),
      ],
      child: this,
    );
  }

  @override
  State<HomePagePage> createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePagePage> {
  HomePageBloc get _bloc => context.read<HomePageBloc>();
  bool _showcaseStarted = false;
  bool _autoNavigated = false;
  final Random _random = Random();
  YogaPoseDetails? _pendingAutoNavigateItem;
  VoidCallback? _homeShowcaseListener;
  bool _isAdmin = false;

  Future<void> _checkAdminStatus() async {
    final isAdmin = await UserPreferences.isAdmin();
    if (mounted) {
      setState(() {
        _isAdmin = isAdmin;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _bloc.add(HomePageStarted());
    // Ensure account information is loaded for WelcomeBanner
    context.read<AccountPageBloc>().add(AccountPageEvent.getInformation());
    _checkAdminStatus();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_showcaseStarted) {
        _showcaseStarted = true;
        // Only start the showcase on the first app launch. Use persisted flag from OauthTokenManager.
        provider.get<OauthTokenManager>().getIsFirstLaunch().then((isFirst) {
          if (isFirst) {
            try {
              ShowCaseWidget.of(context).startShowCase([
                overViewShowCaseWidget,
                listYogaPoseShowCaseWidget,
                viewAllYogaPoseShowCaseWidget,
                accountShowCaseWidget,
              ]);
            } catch (_) {}
          }
        }).catchError((_) {
          // If checking persistence fails, fall back to starting the showcase to ensure users see the onboarding
          try {
            ShowCaseWidget.of(context).startShowCase([
              overViewShowCaseWidget,
              listYogaPoseShowCaseWidget,
              viewAllYogaPoseShowCaseWidget,
              accountShowCaseWidget,
            ]);
          } catch (_) {}
        });
      }
    });
    // Listen for home showcase completion and perform pending navigation if any
    _homeShowcaseListener = () {
      if (homeShowcaseCompletedNotifier.value &&
          !_autoNavigated &&
          _pendingAutoNavigateItem != null) {
        final item = _pendingAutoNavigateItem!;
        _pendingAutoNavigateItem = null;
        _autoNavigated = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          try {
            context.router.push(PoseDetailsRoute(item: item));
          } catch (_) {}
        });
      }
    };
    homeShowcaseCompletedNotifier.addListener(_homeShowcaseListener!);
  }

  @override
  void dispose() {
    if (_homeShowcaseListener != null)
      homeShowcaseCompletedNotifier.removeListener(_homeShowcaseListener!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _isAdmin
          ? FloatingActionButton.extended(
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AdminAddEditPosePage(),
                  ),
                );
                if (result == true && mounted) {
                  // Refresh the list
                  _bloc.add(HomePageStarted());
                }
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Pose'),
              backgroundColor: AppColors.primaryPurple,
            )
          : null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backgroundLight,
              AppColors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Modern Header - softer gradient
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryPurple.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo with gradient circle background
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: AppColors.gradientPurple,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryPurple.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: ClipOval(
                          child: Image.asset(
                            AppImages.logo,
                            width: 32,
                            height: 32,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    // Title with gradient text
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: AppColors.gradientPurple,
                      ).createShader(bounds),
                      child: const Text(
                        'Yoga',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),

                    // Action buttons
                    Row(
                      children: [
                        Showcase(
                          key: bellShowCaseWidget,
                          description: 'Notifications',
                          child: InkWell(
                            onTap: () {
                              context.router.push(const NotificationRouteRoute());
                            },
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.primaryPurpleLight.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.notifications_outlined,
                                color: AppColors.primaryPurple,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Showcase(
                          key: heartShowCaseWidget,
                          description: 'Favorites',
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      // Welcome Banner
                      WelcomeBanner(),
                      const SizedBox(height: 20),

                      // Overview Card
                      BlocBuilder<HomePageBloc, HomePageState>(
                        builder: (context, state) => Showcase(
                          key: overViewShowCaseWidget,
                          description: 'Here is your weekly overview',
                          child: OverView(
                            totalSessions: _bloc.state.yogaPoses?.totalElements.toString() ?? '0',
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Yoga Poses Section Header
                      Row(
                        children: [
                          const Text(
                            'Yoga Poses',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const Spacer(),
                          Showcase(
                            key: viewAllYogaPoseShowCaseWidget,
                            description: 'See all poses',
                            child: GestureDetector(
                              onTap: () {
                                context.router.push(const SearchYogaPoseRoute());
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: AppColors.gradientPurple,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primaryPurple.withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      'View All',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<HomePageBloc, HomePageState>(
                        builder: (context, state) {
                          final items = state.yogaPoses?.items ?? const <YogaPoseDetails>[];

                          if (state.status == HomePageStatus.loading && items.isEmpty) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 40),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                          AppColors.primaryPurple,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Loading poses...',
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                          if (state.status == HomePageStatus.failure) {
                            return Container(
                              padding: const EdgeInsets.all(24),
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: AppColors.errorLight,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: AppColors.error.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: AppColors.error,
                                    size: 48,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Failed to load poses',
                                    style: TextStyle(
                                      color: AppColors.error,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          // Auto-navigate to a random pose once when the list becomes available,
                          // but ONLY on the very first app launch and only AFTER the home showcase completes.
                          if (!_autoNavigated && items.isNotEmpty) {
                            // Determine randomly selected item
                            final idx = _random.nextInt(items.length);
                            final item = items[idx];

                            // Check persisted first-launch flag. If true, we allow auto-navigation
                            // (but still only after the showcase completes). If false, do nothing.
                            provider.get<OauthTokenManager>().getIsFirstLaunch().then((isFirst) {
                              if (!isFirst) return; // not first launch: never auto-navigate

                              if (homeShowcaseCompletedNotifier.value) {
                                _autoNavigated = true;
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  try {
                                    context.router.push(PoseDetailsRoute(item: item));
                                  } catch (_) {
                                    // ignore navigation errors in case route isn't available in some builds
                                  }
                                });
                              } else {
                                // Defer navigation until showcase completes
                                _pendingAutoNavigateItem ??= item;
                              }
                            }).catchError((_) {
                              // If we can't read persisted flag, be conservative and do NOT auto-navigate.
                            });
                          }

                          if (items.isEmpty) {
                            return Container(
                              padding: const EdgeInsets.all(32),
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundCard,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: AppColors.border,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.self_improvement_outlined,
                                    color: AppColors.textSecondary,
                                    size: 64,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'No poses available',
                                    style: TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return ListView.builder(
                            itemCount: items.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final item = items[index];
                              final itemWidget = Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: YogaPosesItem(
                                  item: item,
                                  isAdmin: _isAdmin,
                                ),
                              );
                              if (index == 0) {
                                return Showcase(
                                  key: listYogaPoseShowCaseWidget,
                                  description: 'Tap an item to view details',
                                  child: itemWidget,
                                );
                              }
                              return itemWidget;
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
