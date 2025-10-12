part of 'overall_account_page.dart';

class OverallItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;
  const OverallItem({super.key, required this.title, required this.iconPath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.lightCyan),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Image.asset(iconPath, width: 24, height: 24, color: AppColors.blue),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.black)
          ],
        ),
      ),
    );
  }
}
