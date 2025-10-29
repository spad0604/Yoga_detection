part of 'login.dart';

class AnotherLoginButton extends StatefulWidget {
  final String imagePath;
  final String text;
  final VoidCallback? onPressed;

  const AnotherLoginButton({
    Key? key,
    required this.imagePath,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  _AnotherLoginButtonState createState() => _AnotherLoginButtonState();
}

class _AnotherLoginButtonState extends State<AnotherLoginButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed?.call();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _isPressed ? AppColors.backgroundDark : AppColors.white,
          border: Border.all(
            color: _isPressed ? AppColors.primaryPurple.withOpacity(0.3) : AppColors.border,
            width: 1.5,
          ),
          boxShadow: _isPressed
              ? null
              : [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.imagePath,
              width: 22,
              height: 22,
            ),
            const SizedBox(width: 12),
            Text(
              widget.text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.textPrimary,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
