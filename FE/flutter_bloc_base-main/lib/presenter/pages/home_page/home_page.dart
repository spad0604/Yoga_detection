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
        BlocProvider<HomePageBloc>(
          create: (ctx) => provider.get<HomePageBloc>(),
        ),
        BlocProvider<AccountPageBloc>(
          create: (ctx) => provider.get<AccountPageBloc>(),
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

  @override
  void initState() {
    super.initState();
    _bloc.add(HomePageStarted());
    // Ensure account information is loaded for WelcomeBanner
    context.read<AccountPageBloc>().add(AccountPageEvent.getInformation());
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 50,
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppImages.logo,
                      width: 40.w,
                      height: 40.h,
                    ),
                    Center(
                      child: Text(
                        'Yoga',
                        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Showcase(
                          key: bellShowCaseWidget,
                          description: 'Notifications',
                          child: Image.asset(
                            AppImages.ic_bell,
                            width: 30.w,
                            height: 30.h,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Showcase(
                          key: heartShowCaseWidget,
                          description: 'Favorites',
                          child: Image.asset(
                            AppImages.ic_heart_circle,
                            width: 30.w,
                            height: 30.h,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      WelcomeBanner(),
                      const SizedBox(height: 24),
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
                      Row(
                        children: [
                          const Text(
                            'Yoga Poses',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Showcase(
                            key: viewAllYogaPoseShowCaseWidget,
                            description: 'See all poses',
                            child: GestureDetector(
                              onTap: () {
                                context.router.push(const SearchYogaPoseRoute());
                              },
                              child: Text(
                                'View All',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.primaryBlue,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward, size: 16, color: AppColors.primaryBlue),
                        ],
                      ),
                      const SizedBox(height: 12),
                      BlocBuilder<HomePageBloc, HomePageState>(
                        builder: (context, state) {
                          final items = state.yogaPoses?.items ?? const <YogaPoseDetails>[];
                          if (state.status == HomePageStatus.loading && items.isEmpty) {
                            return const Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: CircularProgressIndicator(),
                            ));
                          }
                          if (state.status == HomePageStatus.failure) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Text('Failed to load poses'),
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
                            return const SizedBox.shrink();
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
