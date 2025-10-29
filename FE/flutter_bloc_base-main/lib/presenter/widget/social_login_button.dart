import 'package:flutter/material.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';

class SocialLoginButton extends StatefulWidget {
  final String imagePath;
  final String text;
  final VoidCallback? onPressed;

  const SocialLoginButton({
    Key? key,
    required this.imagePath,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  State<SocialLoginButton> createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
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
              style: const TextStyle(
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
