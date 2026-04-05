import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page_bloc.dart';
import 'package:flutter_starter/presenter/pages/pose_details/pose_details_bloc.dart';
import 'package:flutter_starter/presenter/pages/pose_details/pose_details_event.dart';
import 'package:flutter_starter/presenter/pages/pose_details/pose_details_state.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:flutter_starter/main.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:flutter_starter/services/oauth_token_manager/oauth_token_manager.dart';
import 'package:flutter_starter/presenter/pages/camera_detection/camera_detection.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_bloc.dart';
import 'package:flutter_starter/presenter/languages/translation_keys.g.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter/presenter/widgets/youtube_video_card.dart';

part 'information_details_items.dart';

// TODO: Add the page to the router
@RoutePage()
class PoseDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  final YogaPoseDetails item;

  const PoseDetailsPage({required this.item});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PoseDetailsBloc>(
          create: (ctx) => provider.get<PoseDetailsBloc>(),
        ),
        BlocProvider.value(
          value: provider.get<HomePageBloc>(),
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
  bool _detailsShowcaseStarted = false;

  @override
  void initState() {
    super.initState();

    // Lock orientation to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _bloc.add(PoseDetailsGetDetails(widget.item.id));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_detailsShowcaseStarted) {
        _detailsShowcaseStarted = true;
        // Only start the details showcase on first app launch. Use persisted flag.
        provider.get<OauthTokenManager>().getIsFirstLaunch().then((isFirst) {
          if (isFirst) {
            try {
              ShowCaseWidget.of(context).startShowCase([
                minutesShowCaseWidget,
                caloriesShowCaseWidget,
                playShowCaseWidget,
              ]);
            } catch (_) {}
          }
        }).catchError((_) {
          // If checking persistence fails, fall back to starting the showcase
          try {
            ShowCaseWidget.of(context).startShowCase([
              minutesShowCaseWidget,
              caloriesShowCaseWidget,
              playShowCaseWidget,
            ]);
          } catch (_) {}
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // Ensure orientation is reset to portrait when leaving this page
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PoseDetailsBloc, PoseDetailsState>(builder: (context, state) {
        return CustomScrollView(
          slivers: [
            // Modern SliverAppBar with image
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              elevation: 0,
              backgroundColor: AppColors.primaryPurple,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      widget.item.imageUrl ??
                          'https://genk.mediacdn.vn/2019/9/10/image014-15680981147321515432907.png',
                      fit: BoxFit.cover,
                    ),
                    // Gradient overlay
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                title: Text(
                  widget.item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                titlePadding: const EdgeInsets.only(left: 56, bottom: 16),
              ),
            ),
            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Stats Cards
                    Row(
                      children: [
                        Expanded(
                          child: Showcase(
                            key: minutesShowCaseWidget,
                            description: LocaleKeys.DurationOfTheSession.tr(),
                            child: _buildStatCard(
                              icon: Icons.timer,
                              title: LocaleKeys.Duration.tr(),
                              value: '${widget.item.totalMinutes ?? 0}',
                              unit: LocaleKeys.Mins.tr(),
                              color: AppColors.primaryPurple,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Showcase(
                            key: caloriesShowCaseWidget,
                            description: LocaleKeys.EstimatedCaloriesBurned.tr(),
                            child: _buildStatCard(
                              icon: Icons.local_fire_department,
                              title: 'Calories',
                              value: '${widget.item.totalCalories ?? 0}',
                              unit: 'cals',
                              color: AppColors.accentCoral,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Description Section
                    _buildSection(
                      title: LocaleKeys.Description.tr(),
                      icon: Icons.description,
                      content: _bloc.state.yogaPoseDetails?.description ??
                          'A detailed yoga pose that helps improve flexibility and balance.',
                    ),
                    const SizedBox(height: 20),

                    // Benefits Section
                    _buildSection(
                      title: LocaleKeys.Benefits.tr(),
                      icon: Icons.favorite,
                      content: _bloc.state.yogaPoseDetails?.description ??
                          'Improves flexibility, balance, and strength. Helps reduce stress and anxiety while promoting better posture and body awareness.',
                    ),
                    const SizedBox(height: 24),

                    // Tutorial Video (YouTube) Section
                    if (_bloc.state.yogaPoseDetails?.tutorialVideoUrlCompat != null &&
                        _bloc.state.yogaPoseDetails!.tutorialVideoUrlCompat!.isNotEmpty)
                      YouTubeVideoCard(
                        videoUrl: _bloc.state.yogaPoseDetails!.tutorialVideoUrlCompat!,
                      ),
                    if (_bloc.state.yogaPoseDetails?.tutorialVideoUrlCompat != null &&
                        _bloc.state.yogaPoseDetails!.tutorialVideoUrlCompat!.isNotEmpty)
                      const SizedBox(height: 24),

                    // Start Button
                    Showcase(
                      key: playShowCaseWidget,
                      description: LocaleKeys.StartPractice.tr(),
                      child: Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: AppColors.gradientPurple,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryPurple.withOpacity(0.4),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {
                              // Navigate with BlocProvider wrapped
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider<CameraDetectionBloc>(
                                    create: (ctx) => provider.get<CameraDetectionBloc>(),
                                    child: CameraDetectionPage(
                                      poseId: widget.item.id.toString(),
                                      item: widget.item,
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.play_circle_filled,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'Start Practice',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required String unit,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(
                  unit,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primaryPurple,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              fontSize: 15,
              height: 1.6,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

extension _YogaPoseDetailsCompat on YogaPoseDetails {
  String? get tutorialVideoUrlCompat {
    try {
      // Access via dynamic to avoid analyzer errors before codegen runs
      final dynamic self = this;
      final value = self.tutorialVideoUrl as String?;
      return value;
    } catch (_) {
      return null;
    }
  }
}
