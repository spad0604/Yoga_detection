part of 'pose_details.dart';

class InformationDetailsItems extends StatelessWidget {
  String iconPath;
  String title;
  String value;

  InformationDetailsItems({
    super.key,
    required this.iconPath,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.5, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey600, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(
            iconPath,
            width: 27,
            height: 27,
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.gray),
          ),
        ],
      ),
    );
  }
}
