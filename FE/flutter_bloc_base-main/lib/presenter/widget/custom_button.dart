import 'package:flutter/material.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool fullWidth;

  const CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.backgroundColor = AppColors.primaryBlue,
      this.textColor = Colors.white,
      this.fullWidth = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: fullWidth ? double.infinity : null,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: backgroundColor),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
