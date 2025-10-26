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
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'History',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            CustomCalendar(
              value: _selectedDates,
              onChanged: _onDateSelected,
            ),
            const SizedBox(height: 16), // Add spacing
            Expanded(
              // Make the container expand to fill remaining space
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.grey600),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<HistoryBloc, HistoryState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              _selectedDate?.dateTimeToDayMonDay() ?? 'Select a date',
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                _totalWidget(Icons.check_circle, 'Total', state.poses.length,
                                    AppColors.primaryBlue),
                                const SizedBox(width: 16),
                                _totalWidget(
                                    Icons.star,
                                    'Avg Score',
                                    state.poses.isEmpty
                                        ? 0
                                        : (state.poses.map((p) => p.score).reduce((a, b) => a + b) /
                                                state.poses.length)
                                            .round(),
                                    Colors.amber),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(color: AppColors.grey600),
                        const SizedBox(height: 16),
                        if (state.status == HistoryStatus.loading)
                          const Expanded(
                            child: Center(child: CircularProgressIndicator()),
                          )
                        else if (state.status == HistoryStatus.failure)
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                                  const SizedBox(height: 16),
                                  Text(
                                    state.error?.message ?? 'Failed to load history',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )
                        else if (state.poses.isEmpty)
                          const Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.calendar_today, size: 48, color: Colors.grey),
                                  SizedBox(height: 16),
                                  Text(
                                    'No poses found for selected date',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.only(top: 16),
                              itemCount: state.poses.length,
                              itemBuilder: (context, index) {
                                final pose = state.poses[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: YogaPosesItem(
                                      item: YogaPoseDetails(
                                          id: pose.id,
                                          name: pose.poseCode,
                                          totalMinutes: 0,
                                          totalCalories: 0,
                                          level: '')),
                                );
                              },
                            ),
                          )
                      ],
                    );
                  },
                ),
              ),
            )
          ]),
        ));
  }

  Widget _totalWidget(IconData icon, String title, int value, Color iconColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 16),
          const SizedBox(width: 4),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            value.toString(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 4),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
