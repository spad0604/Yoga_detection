import 'package:flutter/material.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String suffixIcon;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final bool isPassword;
  final void Function()? onTapSuffix;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final int maxLines;

  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.suffixIcon = '',
    this.onChanged,
    this.errorText,
    this.isPassword = false,
    this.onTapSuffix,
    this.prefixIcon,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _borderAnimation;
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _borderAnimation = Tween<double>(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
        if (_isFocused) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _borderAnimation,
      builder: (context, child) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: _isFocused
              ? [
                  BoxShadow(
                    color: AppColors.primaryPurple.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: widget.isPassword,
          focusNode: _focusNode,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: _isFocused ? AppColors.white : AppColors.backgroundCard,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),

            // Prefix icon
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    color: _isFocused ? AppColors.primaryPurple : AppColors.textSecondary,
                    size: 22,
                  )
                : null,

            // Border styles
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                width: _borderAnimation.value,
                color: AppColors.border,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                width: 1.5,
                color: AppColors.border,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                width: _borderAnimation.value,
                color: AppColors.primaryPurple,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                width: 1.5,
                color: AppColors.error,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                width: _borderAnimation.value,
                color: AppColors.error,
              ),
            ),

            // Hint text
            hintText: widget.hintText ?? 'Enter text',
            hintStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.textHint,
            ),

            // Suffix icon
            suffixIcon: widget.suffixIcon.isEmpty
                ? null
                : GestureDetector(
                    onTap: widget.onTapSuffix,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        widget.suffixIcon,
                        width: 20,
                        height: 20,
                        color: _isFocused ? AppColors.primaryPurple : AppColors.textSecondary,
                      ),
                    ),
                  ),

            // Error text
            errorText: widget.errorText,
            errorStyle: const TextStyle(
              fontSize: 12,
              color: AppColors.error,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
