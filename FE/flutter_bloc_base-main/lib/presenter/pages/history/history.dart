import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/pages/history/history_bloc.dart';
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
  DateTime? _selectedDate;

  List<DateTime?> _selectedDates = [
    // Sample dates to highlight like in the image (December 2025)
    DateTime(2025, 12, 1), // 1st December
    DateTime(2025, 12, 4), // 4th December
    DateTime(2025, 12, 5), // 5th December
    DateTime(2025, 12, 6), // 6th December
    DateTime(2025, 12, 17), // 17th December
  ];

  void _onDateSelected(List<DateTime?> selectedDates) {
    setState(() {
      _selectedDates = selectedDates;
    });
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          _selectedDate?.dateTimeToDayMonDay() ?? '',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            _totalWidget(
                                Icons.check_circle, 'Total Sessions', 10, AppColors.primaryBlue),
                            const SizedBox(width: 16),
                            _totalWidget(Icons.access_time, 'Total Time', 10, Colors.lightGreen),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: AppColors.grey600),
                    const SizedBox(height: 16),
                    Expanded(
                      // ListView can now expand properly
                      child: ListView.builder(
                          padding: const EdgeInsets.only(top: 16),
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: YogaPosesItem(
                                    item: YogaPoseDetails(
                                        id: '',
                                        name: 'Bay phòng',
                                        totalMinutes: 10,
                                        totalCalories: 10,
                                        level: '')),
                              ),
                          itemCount: 100),
                    )
                  ],
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
