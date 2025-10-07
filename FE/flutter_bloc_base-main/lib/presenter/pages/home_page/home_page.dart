import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_bloc.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';

part 'welcome_banner.dart';
part 'over_view.dart';
part 'yoga_poses_item.dart';

// TODO: Add the page to the router
@RoutePage()
class HomePagePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePagePage();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<HomePageBloc>(
      create: (ctx) => provider.get<HomePageBloc>(),
      child: this,
    );
  }

  @override
  State<HomePagePage> createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePagePage> {
  HomePageBloc get _bloc => context.read<HomePageBloc>();

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
                        Image.asset(
                          AppImages.ic_bell,
                          width: 30.w,
                          height: 30.h,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Image.asset(
                          AppImages.ic_heart_circle,
                          width: 30.w,
                          height: 30.h,
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
                      OverView(
                        totalSessions: '15',
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          const Text(
                            'Yoga Poses',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            'View All',
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.primaryBlue,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward, size: 16, color: AppColors.primaryBlue),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: YogaPosesItem(
                              title: 'Sun Salutation',
                              totalTime: '15',
                              level: 'Beginner',
                              imageUrl:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaYRmvtTjbhBRv-BIbEfxFcWy4ZKwwscujrQ&s',
                            ),
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
