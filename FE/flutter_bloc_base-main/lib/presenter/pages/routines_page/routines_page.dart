import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_starter/data/entities/response/yoga_routine.dart';
import 'package:flutter_starter/data/states/routines/routines_bloc.dart';
import 'package:flutter_starter/data/states/routines/routines_event.dart';
import 'package:flutter_starter/data/states/routines/routines_state.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/languages/translation_keys.g.dart';
import 'package:flutter_starter/core/utils/user_preferences.dart';
import 'package:flutter_starter/presenter/pages/admin/admin_add_edit_routine_page.dart';
import 'package:flutter_starter/presenter/widgets/admin_routine_delete_dialog.dart';

@RoutePage()
class RoutinesPage extends StatefulWidget implements AutoRouteWrapper {
  const RoutinesPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<RoutinesBloc>(
      create: (ctx) =>
          provider.get<RoutinesBloc>()..add(const RoutinesLoadRequested()),
      child: this,
    );
  }

  @override
  State<RoutinesPage> createState() => _RoutinesPageState();
}

class _RoutinesPageState extends State<RoutinesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _allRoutinesScrollController = ScrollController();
  bool _isAdmin = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _allRoutinesScrollController.addListener(_onAllRoutinesScroll);
    _checkAdminStatus();
  }

  void _onAllRoutinesScroll() {
    if (!_allRoutinesScrollController.hasClients) return;

    final position = _allRoutinesScrollController.position;
    if (position.maxScrollExtent - position.pixels <= 240) {
      final bloc = context.read<RoutinesBloc>();
      final state = bloc.state;
      if (state.hasMore && !state.isLoading && !state.isLoadingMore) {
        bloc.add(const RoutinesLoadMoreRequested());
      }
    }
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
  void dispose() {
    _allRoutinesScrollController.removeListener(_onAllRoutinesScroll);
    _allRoutinesScrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.WorkoutPrograms.tr()),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: LocaleKeys.AllRoutines.tr()),
            Tab(text: LocaleKeys.InProgress.tr()),
            Tab(text: LocaleKeys.Completed.tr()),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAllRoutinesTab(),
          _buildInProgressTab(),
          _buildCompletedTab(),
        ],
      ),
      floatingActionButton: _isAdmin
          ? FloatingActionButton(
              onPressed: () async {
                final bloc = context.read<RoutinesBloc>();
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AdminAddEditRoutinePage(),
                  ),
                );
                if (result == true && mounted) {
                  bloc.add(const RoutinesRefreshRequested());
                }
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  Widget _buildAllRoutinesTab() {
    return BlocBuilder<RoutinesBloc, RoutinesState>(
      builder: (context, state) {
        if (state.isLoading && state.routines.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.error != null && state.routines.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.error!, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<RoutinesBloc>()
                        .add(const RoutinesLoadRequested());
                  },
                  child: Text(LocaleKeys.Retry.tr()),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<RoutinesBloc>().add(const RoutinesRefreshRequested());
          },
          child: ListView.builder(
            controller: _allRoutinesScrollController,
            padding: const EdgeInsets.all(16),
            itemCount: state.routines.length + (state.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == state.routines.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              final routine = state.routines[index];
              return _RoutineCard(
                routine: routine,
                isAdmin: _isAdmin,
                onTap: () {
                  context.router
                      .push(RoutineDetailsRoute(routineId: routine.id));
                },
                onRefresh: () {
                  context
                      .read<RoutinesBloc>()
                      .add(const RoutinesRefreshRequested());
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildInProgressTab() {
    return BlocBuilder<RoutinesBloc, RoutinesState>(
      builder: (context, state) {
        if (state.isLoading && state.inProgressRoutines.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.inProgressRoutines.isEmpty) {
          return Center(
            child: Text(LocaleKeys.NoRoutinesInProgress.tr()),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: state.inProgressRoutines.length,
          itemBuilder: (context, index) {
            final progress = state.inProgressRoutines[index];
            return _ProgressCard(progress: progress);
          },
        );
      },
    );
  }

  Widget _buildCompletedTab() {
    return BlocBuilder<RoutinesBloc, RoutinesState>(
      builder: (context, state) {
        if (state.isLoading && state.completedRoutines.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.completedRoutines.isEmpty) {
          return Center(
            child: Text(LocaleKeys.NoCompletedRoutinesYet.tr()),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: state.completedRoutines.length,
          itemBuilder: (context, index) {
            final progress = state.completedRoutines[index];
            return _ProgressCard(progress: progress);
          },
        );
      },
    );
  }
}

class _RoutineCard extends StatelessWidget {
  final YogaRoutine routine;
  final VoidCallback onTap;
  final bool isAdmin;
  final VoidCallback onRefresh;

  const _RoutineCard({
    required this.routine,
    required this.onTap,
    this.isAdmin = false,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with admin buttons
            Stack(
              children: [
                if (routine.imageUrl != null)
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      routine.imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.image, size: 50),
                      ),
                    ),
                  ),

                // Admin buttons
                if (isAdmin)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Row(
                      children: [
                        // Delete button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.white),
                            onPressed: () async {
                              final result =
                                  await AdminRoutineDeleteDialog.show(
                                context,
                                routine.id,
                                routine.name,
                              );
                              if (result == true) {
                                onRefresh();
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Edit button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.edit, color: Colors.white),
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
                              if (result == true) {
                                onRefresh();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Premium badge
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          routine.name,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      if (routine.isPremium)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            LocaleKeys.PRO.tr(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Description
                  if (routine.description != null)
                    Text(
                      routine.description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),

                  const SizedBox(height: 12),

                  // Info row
                  Row(
                    children: [
                      _InfoChip(
                        icon: Icons.access_time,
                        label: '${routine.durationMinutes ?? 0} min',
                      ),
                      const SizedBox(width: 8),
                      _InfoChip(
                        icon: Icons.local_fire_department,
                        label: '${routine.estimatedCalories ?? 0} kcal',
                      ),
                      const SizedBox(width: 8),
                      _InfoChip(
                        icon: Icons.fitness_center,
                        label: routine.level ?? 'BEGINNER',
                      ),
                    ],
                  ),

                  // Progress bar (if exists)
                  if (routine.userProgress != null &&
                      routine.userProgress!.completionPercentage > 0) ...[
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: routine.userProgress!.completionPercentage / 100,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        routine.userProgress!.isCompleted
                            ? Colors.green
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      LocaleKeys.PercentCompleted.tr(namedArgs: {
                        'percent': routine.userProgress!.completionPercentage
                            .toStringAsFixed(0)
                      }),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey[700]),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  final dynamic progress; // UserRoutineProgress

  const _ProgressCard({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: progress.routineImageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  progress.routineImageUrl!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.fitness_center),
              ),
        title: Text(progress.routineName ?? 'Unnamed Routine'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: progress.completionPercentage / 100,
            ),
            const SizedBox(height: 4),
            Text(LocaleKeys.PercentCompleted.tr(namedArgs: {
              'percent': progress.completionPercentage.toStringAsFixed(0)
            })),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
