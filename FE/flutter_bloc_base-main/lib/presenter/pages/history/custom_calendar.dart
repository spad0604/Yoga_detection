part of 'history.dart';

class CustomCalendar extends StatelessWidget {
  final List<DateTime?> value;
  final Function(List<DateTime?>) onChanged;
  const CustomCalendar({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.grey600),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          calendarType: CalendarDatePicker2Type.range, // Range picker: start date and end date only
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          selectedDayHighlightColor: AppColors.primaryBlue,
          selectedDayTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          dayTextStyle: const TextStyle(color: Colors.black, fontSize: 16),
          weekdayLabelTextStyle: const TextStyle(
            color: AppColors.grey600,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          controlsTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          centerAlignModePicker: false,
          // Range styling
          rangeBidirectional: true,
          selectedRangeHighlightColor: AppColors.primaryBlue.withOpacity(0.2),
          selectedRangeDayTextStyle: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
        value: value,
        onValueChanged: onChanged,
      ),
    );
  }
}
