import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/response/user_activity_response.dart';
import 'package:flutter_starter/data/states/activities/activities_bloc.dart';
import 'package:flutter_starter/data/states/activities/activities_event.dart';
import 'package:flutter_starter/data/states/activities/activities_state.dart';
import 'package:flutter_starter/di.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ActivitiesPage extends StatefulWidget implements AutoRouteWrapper {
  const ActivitiesPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ActivitiesBloc>(
      create: (ctx) => provider.get<ActivitiesBloc>()
        ..add(const ActivitiesLoadFriendActivities())
        ..add(const ActivitiesLoadMyActivities()),
      child: this,
    );
  }

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

// Content widget that can be used with pre-provided BLoC
class ActivitiesPageContent extends StatefulWidget {
  const ActivitiesPageContent({super.key});

  @override
  State<ActivitiesPageContent> createState() => _ActivitiesPageContentState();
}

class _ActivitiesPageState extends State<ActivitiesPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Feed'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Friends', icon: Icon(Icons.people)),
            Tab(text: 'My Activity', icon: Icon(Icons.person)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFriendActivitiesTab(),
          _buildMyActivitiesTab(),
        ],
      ),
    );
  }

  Widget _buildFriendActivitiesTab() {
    return BlocBuilder<ActivitiesBloc, ActivitiesState>(
      builder: (context, state) {
        if (state.isLoadingFriends && state.friendActivities.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.friendActivities.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.rss_feed_outlined, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'No activities yet',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Your friends\' activities will appear here',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<ActivitiesBloc>().add(const ActivitiesRefreshFriendActivities());
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.friendActivities.length,
            itemBuilder: (context, index) {
              final activity = state.friendActivities[index];
              return _ActivityCard(activity: activity);
            },
          ),
        );
      },
    );
  }

  Widget _buildMyActivitiesTab() {
    return BlocBuilder<ActivitiesBloc, ActivitiesState>(
      builder: (context, state) {
        if (state.isLoadingMe && state.myActivities.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.myActivities.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.history_outlined, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'No activities yet',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Your activities will appear here',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<ActivitiesBloc>().add(const ActivitiesRefreshMyActivities());
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.myActivities.length,
            itemBuilder: (context, index) {
              final activity = state.myActivities[index];
              return _ActivityCard(activity: activity);
            },
          ),
        );
      },
    );
  }
}

class _ActivitiesPageContentState extends State<ActivitiesPageContent> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Feed'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Friends', icon: Icon(Icons.people)),
            Tab(text: 'My Activity', icon: Icon(Icons.person)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFriendActivitiesTab(),
          _buildMyActivitiesTab(),
        ],
      ),
    );
  }

  Widget _buildFriendActivitiesTab() {
    return BlocBuilder<ActivitiesBloc, ActivitiesState>(
      builder: (context, state) {
        if (state.isLoadingFriends && state.friendActivities.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.friendActivities.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.rss_feed_outlined, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'No activities yet',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Your friends\' activities will appear here',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<ActivitiesBloc>().add(const ActivitiesRefreshFriendActivities());
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.friendActivities.length,
            itemBuilder: (context, index) {
              final activity = state.friendActivities[index];
              return _ActivityCard(activity: activity);
            },
          ),
        );
      },
    );
  }

  Widget _buildMyActivitiesTab() {
    return BlocBuilder<ActivitiesBloc, ActivitiesState>(
      builder: (context, state) {
        if (state.isLoadingMe && state.myActivities.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.myActivities.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.history_outlined, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'No activities yet',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Your activities will appear here',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<ActivitiesBloc>().add(const ActivitiesRefreshMyActivities());
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.myActivities.length,
            itemBuilder: (context, index) {
              final activity = state.myActivities[index];
              return _ActivityCard(activity: activity);
            },
          ),
        );
      },
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final UserActivityResponse activity;

  const _ActivityCard({required this.activity});

  IconData _getActivityIcon(String type) {
    switch (type) {
      case 'POSE_COMPLETED':
        return Icons.self_improvement;
      case 'ROUTINE_COMPLETED':
        return Icons.check_circle;
      case 'ACHIEVEMENT_UNLOCKED':
        return Icons.emoji_events;
      case 'PERFECT_SCORE':
        return Icons.star;
      case 'STREAK_MILESTONE':
        return Icons.local_fire_department;
      default:
        return Icons.fitness_center;
    }
  }

  Color _getActivityColor(String type) {
    switch (type) {
      case 'POSE_COMPLETED':
        return Colors.blue;
      case 'ROUTINE_COMPLETED':
        return Colors.green;
      case 'ACHIEVEMENT_UNLOCKED':
        return Colors.amber;
      case 'PERFECT_SCORE':
        return Colors.purple;
      case 'STREAK_MILESTONE':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _formatTimestamp(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 7) {
      return DateFormat('MMM d, y').format(dateTime);
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            CircleAvatar(
              radius: 24,
              backgroundColor: _getActivityColor(activity.activityType).withOpacity(0.1),
              backgroundImage: activity.userAvatarUrl != null
                  ? NetworkImage(activity.userAvatarUrl!)
                  : null,
              child: activity.userAvatarUrl == null
                  ? Icon(
                      _getActivityIcon(activity.activityType),
                      color: _getActivityColor(activity.activityType),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User name & time
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          activity.username,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        _formatTimestamp(activity.createdAt),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Title
                  Row(
                    children: [
                      Icon(
                        _getActivityIcon(activity.activityType),
                        size: 16,
                        color: _getActivityColor(activity.activityType),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          activity.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Description
                  if (activity.description != null && activity.description!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      activity.description!,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                  // Metadata (score, etc.)
                  if (activity.metadata != null && activity.metadata!['score'] != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, size: 14, color: Colors.green),
                          const SizedBox(width: 4),
                          Text(
                            'Score: ${activity.metadata!['score']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
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

