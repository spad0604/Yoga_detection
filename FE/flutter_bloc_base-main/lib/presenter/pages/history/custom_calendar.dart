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
        color: Colors.white, // White background like in the image
      ),
      padding: const EdgeInsets.all(16),
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          calendarType: CalendarDatePicker2Type.multi, // Multi date picker for highlighted dates
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          selectedDayHighlightColor: AppColors.primaryBlue, // Blue highlight color
          selectedDayTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          dayTextStyle: const TextStyle(color: Colors.black, fontSize: 16),
          weekdayLabelTextStyle: const TextStyle(
            color: AppColors.grey600,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          controlsTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          centerAlignModePicker: true,
        ),
        value: value,
        onValueChanged: onChanged,
      ),
    );
  }
}
