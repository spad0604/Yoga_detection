part of 'search_yoga_pose.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hoverColor: AppColors.primaryBlue,
          focusColor: AppColors.primaryBlue,
          hintText: 'Search',
          fillColor: AppColors.grey200,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
