import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/response/yoga_routine.dart';
import 'package:flutter_starter/data/states/routine_details/routine_details_bloc.dart';
import 'package:flutter_starter/data/states/routine_details/routine_details_event.dart';
import 'package:flutter_starter/data/states/routine_details/routine_details_state.dart';
import 'package:flutter_starter/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_starter/presenter/languages/translation_keys.g.dart';
import 'package:flutter_starter/presenter/pages/routine_practice_session/routine_practice_session_page.dart';
import 'package:flutter_starter/data/states/practice_session/practice_session_bloc.dart';
import 'package:flutter_starter/data/states/practice_session/practice_session_event.dart';
import 'package:flutter_starter/core/utils/user_preferences.dart';
import 'package:flutter_starter/presenter/pages/admin/admin_add_edit_routine_page.dart';

@RoutePage()
class RoutineDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  final String routineId;

  const RoutineDetailsPage({
    super.key,
    required this.routineId,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<RoutineDetailsBloc>(
      create: (ctx) =>
          provider.get<RoutineDetailsBloc>()..add(RoutineDetailsLoadRequested(routineId)),
      child: this,
    );
  }

  @override
  State<RoutineDetailsPage> createState() => _RoutineDetailsPageState();
}

class _RoutineDetailsPageState extends State<RoutineDetailsPage> {
  bool _isAdmin = false;

  @override
  void initState() {
    super.initState();
    _checkAdminStatus();
  }

  Future<void> _checkAdminStatus() async {
    final isAdmin = await UserPreferences.isAdmin();
    if (mounted) {
      setState(() {
        _isAdmin = isAdmin;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RoutineDetailsBloc, RoutineDetailsState>(
        builder: (context, state) {
          if (state.isLoading && state.routine == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null && state.routine == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.error!, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<RoutineDetailsBloc>().add(
                            RoutineDetailsLoadRequested(widget.routineId),
                          );
                    },
                    child: Text(LocaleKeys.Retry.tr()),
                  ),
                ],
              ),
            );
          }

          if (state.routine == null) {
            return Center(child: Text(LocaleKeys.RoutineNotFound.tr()));
          }

          return _buildContent(context, state.routine!);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, YogaRoutine routine) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            // App Bar with Image
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              actions: _isAdmin
                  ? [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () async {
                          final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AdminAddEditRoutinePage(
                                routineId: routine.id,
                                initialName: routine.name,
                                initialDescription: routine.description,
                                initialLevel: routine.level,
                                initialDuration: routine.durationMinutes,
                                initialCalories: routine.estimatedCalories,
                                initialTags: routine.tags?.join(', '),
                                initialIsPremium: routine.isPremium,
                                initialImageUrl: routine.imageUrl,
                              ),
                            ),
                          );
                          if (result == true && mounted) {
                            context.read<RoutineDetailsBloc>().add(
                                  RoutineDetailsLoadRequested(widget.routineId),
                                );
                          }
                        },
                      ),
                    ]
                  : null,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  routine.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 1),
                        blurRadius: 3.0,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
                background: routine.imageUrl != null
                    ? Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            routine.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: Colors.grey[300],
                            ),
                          ),
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
                      )
                    : Container(color: Colors.grey[300]),
              ),
            ),

            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Info chips
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _InfoChip(
                          icon: Icons.access_time,
                          label: '${routine.durationMinutes ?? 0} min',
                          color: Colors.blue,
                        ),
                        _InfoChip(
                          icon: Icons.local_fire_department,
                          label: '${routine.estimatedCalories ?? 0} kcal',
                          color: Colors.orange,
                        ),
                        _InfoChip(
                          icon: Icons.fitness_center,
                          label: routine.level ?? 'BEGINNER',
                          color: Colors.green,
                        ),
                        _InfoChip(
                          icon: Icons.self_improvement,
                          label: '${routine.totalPoses ?? 0} poses',
                          color: Colors.purple,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Description
                    if (routine.description != null) ...[
                      Text(
                        'About',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        routine.description!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Tags
                    if (routine.tags != null && routine.tags!.isNotEmpty) ...[
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: routine.tags!
                            .map((tag) => Chip(
                                  label: Text(tag),
                                  backgroundColor: Colors.grey[200],
                                ))
                            .toList(),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Progress (if exists)
                    if (routine.userProgress != null) ...[
                      Text(
                        'Your Progress',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 12),
                      _ProgressCard(progress: routine.userProgress!),
                      const SizedBox(height: 24),
                    ],

                    // Poses List
                    Text(
                      'Poses in this Routine',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),

            // Poses List
            if (routine.poses != null)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final pose = routine.poses![index];
                    return _PoseListItem(pose: pose);
                  },
                  childCount: routine.poses!.length,
                ),
              ),

            // Bottom spacing for button
            const SliverToBoxAdapter(child: SizedBox(height: 80)),
          ],
        ),

        // Floating action button
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: SafeArea(
            child: ElevatedButton(
              onPressed: () {
                // Navigate to practice session page
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider<PracticeSessionBloc>(
                      create: (_) => provider.get<PracticeSessionBloc>()
                        ..add(PracticeSessionEvent.startSession(routine.id)),
                      child: RoutinePracticeSessionPage(
                        routineId: routine.id,
                      ),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                elevation: 8,
                shadowColor: Theme.of(context).primaryColor.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow, size: 28),
                  SizedBox(width: 8),
                  Text(
                    'Bắt đầu tập',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  final UserRoutineProgressInfo progress;

  const _ProgressCard({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  progress.isCompleted ? 'Completed! 🎉' : 'In Progress',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: progress.isCompleted ? Colors.green : Colors.orange,
                      ),
                ),
                Text(
                  '${progress.completionPercentage.toStringAsFixed(0)}%',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: progress.completionPercentage / 100,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(
                progress.isCompleted ? Colors.green : Theme.of(context).primaryColor,
              ),
            ),
            if (progress.averageScore != null) ...[
              const SizedBox(height: 12),
              Text(
                'Average Score: ${progress.averageScore!.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _PoseListItem extends StatelessWidget {
  final RoutinePose pose;

  const _PoseListItem({required this.pose});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: Text(
            '${pose.orderIndex}',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(pose.poseName ?? 'Pose ${pose.orderIndex}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (pose.durationSeconds != null)
              Text(
                  LocaleKeys.DurationSeconds.tr(namedArgs: {'seconds': '${pose.durationSeconds}'})),
            if (pose.instructions != null)
              Text(
                pose.instructions!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
          ],
        ),
        isThreeLine: pose.instructions != null,
        trailing: pose.poseImageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  pose.poseImageUrl!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              )
            : null,
      ),
    );
  }
}
