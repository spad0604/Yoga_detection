part of 'account_page.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final String text;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.grey100),
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Image.asset(
                  iconPath,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Icon(Icons.edit, size: 18, color: AppColors.primaryBlue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
