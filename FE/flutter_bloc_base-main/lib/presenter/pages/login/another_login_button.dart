part of 'login.dart';

class AnotherLoginButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback? onPressed;

  const AnotherLoginButton({Key? key, required this.imagePath, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.lightGray),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 20,
              height: 20,
            ),
            SizedBox(width: 12.w),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.w,
                color: AppColors.gray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
