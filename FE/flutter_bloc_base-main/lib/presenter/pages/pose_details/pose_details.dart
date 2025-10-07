import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_bloc.dart';
import 'package:flutter_starter/presenter/pages/pose_details/pose_details_bloc.dart';
import 'package:flutter_starter/presenter/pages/pose_details/pose_details_event.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:flutter_starter/presenter/widget/custom_button.dart';

part 'information_details_items.dart';

// TODO: Add the page to the router
@RoutePage()
class PoseDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  const PoseDetailsPage();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PoseDetailsBloc>(
          create: (ctx) => provider.get<PoseDetailsBloc>(),
        ),
        BlocProvider<HomePageBloc>(
          create: (ctx) => provider.get<HomePageBloc>(),
        ),
      ],
      child: this,
    );
  }

  @override
  State<PoseDetailsPage> createState() => _PoseDetailsPageState();
}

class _PoseDetailsPageState extends State<PoseDetailsPage> {
  PoseDetailsBloc get _bloc => context.read<PoseDetailsBloc>();

  HomePageBloc get _homeBloc => context.read<HomePageBloc>();

  @override
  void initState() {
    _bloc.add(PoseDetailsGetDetails(_homeBloc.state.chooseYogaPose));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 240,
              child: Image.network(
                _bloc.state.yogaPoseDetails?.imageUrl ??
                    'https://genk.mediacdn.vn/2019/9/10/image014-15680981147321515432907.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        _bloc.state.yogaPoseDetails?.name ?? '',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InformationDetailsItems(
                          iconPath: AppImages.ic_minutes,
                          title: 'Duration',
                          value:
                              '${_bloc.state.yogaPoseDetails?.totalMinutes.toString()} mins ?? ' '',
                        ),
                        InformationDetailsItems(
                          iconPath: AppImages.ic_calo,
                          title: 'Calories',
                          value: '${_bloc.state.yogaPoseDetails?.totalCalories.toString()} cals ?? '
                              '',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Description:',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _bloc.state.yogaPoseDetails?.description ?? '',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: AppColors.grey),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Benefits:',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'From a standing position, the legs are in a wide stance with the feet aligned and flat on the earth. The back foot is in a 60-degree angle toward the front. The hips are squared. The inner thighs are rotated toward each other. The front knee is bent in a 90-degree angle directly above the ankle. The arms extend up to the sky with the biceps by the ears. The hands can be together or separated and facing each other with the fingers spread wide. The ribcage is lifted and the pelvis tucked. The gaze is forward.',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: AppColors.grey),
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: 'Start',
                      backgroundColor: AppColors.primaryBlue,
                      textColor: Colors.white,
                      onPressed: () {
                        context.router.push(CameraDetectionRoute());
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
