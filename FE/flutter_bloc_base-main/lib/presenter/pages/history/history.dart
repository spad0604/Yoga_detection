import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/pages/history/history_bloc.dart';
import 'package:flutter_starter/presenter/pages/history/history_event.dart';
import 'package:flutter_starter/presenter/pages/history/history_state.dart';
import 'package:flutter_starter/presenter/pages/home_page/home_page.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:flutter_starter/presenter/themes/extensions.dart';

part 'custom_calendar.dart';

// TODO: Add the page to the router
@RoutePage()
class HistoryPage extends StatefulWidget implements AutoRouteWrapper {
  const HistoryPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<HistoryBloc>(
      create: (ctx) => provider.get<HistoryBloc>(),
      child: this,
    );
  }

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  HistoryBloc get _bloc => context.read<HistoryBloc>();

  DateTime? _selectedDate;

  List<DateTime?> _selectedDates = [];

  @override
  void initState() {
    super.initState();
    // Load current month data by default
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);
    _bloc.add(HistoryEvent.loadPosesByDate(
      startDate: startOfMonth,
      endDate: endOfMonth,
    ));
  }

  void _onDateSelected(List<DateTime?> selectedDates) {
    setState(() {
      _selectedDates = selectedDates;
      _selectedDate = selectedDates.isNotEmpty ? selectedDates.first : null;
    });

    // Load poses for selected date range
    if (selectedDates.isNotEmpty && selectedDates.first != null) {
      final startDate = selectedDates.first!;
      final endDate =
          selectedDates.length > 1 && selectedDates.last != null ? selectedDates.last! : startDate;

      _bloc.add(HistoryEvent.loadPosesByDate(
        startDate: startDate,
        endDate: endDate,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundLight,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.primaryPurple),
          title: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: AppColors.gradientPurple,
            ).createShader(bounds),
            child: const Text(
              'Workout History',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              height: 1,
              color: AppColors.textSecondary.withOpacity(0.1),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            CustomCalendar(
              value: _selectedDates,
              onChanged: _onDateSelected,
            ),
            const SizedBox(height: 16), // Add spacing

            // Main content container (now sized by its content so the outer
            // scroll view can handle vertical gestures from anywhere on the page)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryPurple.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: BlocBuilder<HistoryBloc, HistoryState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date header with gradient
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors:
                                AppColors.gradientPurple.map((c) => c.withOpacity(0.1)).toList(),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today, color: AppColors.primaryPurple, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _selectedDate?.dateTimeToDayMonDay() ?? 'Select a date',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Stats cards
                      Row(
                        children: [
                          Expanded(
                            child: _statsCard(
                              icon: Icons.fitness_center,
                              label: 'Total',
                              value: state.poses.length.toString(),
                              color: AppColors.primaryPurple,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _statsCard(
                              icon: Icons.star,
                              label: 'Avg Score',
                              value: state.poses.isEmpty
                                  ? '0'
                                  : (state.poses
                                              .map((p) => p.score ?? 0.0)
                                              .reduce((a, b) => a + b) /
                                          state.poses.length)
                                      .toStringAsFixed(1),
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      Divider(color: AppColors.textSecondary.withOpacity(0.2), height: 1),
                      const SizedBox(height: 16),

                      // Poses list header
                      if (state.poses.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            'Workout Sessions',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),

                      // Content sections (loading / failure / empty / list)
                      if (state.status == HistoryStatus.loading)
                        const Center(
                            child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: CircularProgressIndicator(),
                        ))
                      else if (state.status == HistoryStatus.failure)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                                const SizedBox(height: 16),
                                Text(
                                  state.error?.message ?? 'Failed to load history',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      else if (state.poses.isEmpty)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: AppColors.gradientPurple
                                          .map((c) => c.withOpacity(0.1))
                                          .toList(),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.calendar_today,
                                    size: 40,
                                    color: AppColors.primaryPurple.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No workouts yet',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Start practicing yoga',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.textSecondary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        // Use a shrink-wrapped ListView so the outer scroll handles vertical gestures
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(top: 16),
                          itemCount: state.poses.length,
                          itemBuilder: (context, index) {
                            final pose = state.poses[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: YogaPosesItem(
                                item: YogaPoseDetails(
                                  imageUrl: pose.imageUrl,
                                  id: pose.id,
                                  name: pose.poseCode,
                                  totalMinutes: 0,
                                  totalCalories: 0,
                                  level: '',
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  );
                },
              ),
            ),
          ]),
        ));
  }

  Widget _statsCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
