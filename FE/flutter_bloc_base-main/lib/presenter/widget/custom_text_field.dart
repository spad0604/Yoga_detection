import 'package:flutter/material.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String suffixIcon;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final bool isPassword;

  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.suffixIcon = '',
    this.onChanged,
    this.errorText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: isPassword,
      decoration: InputDecoration(
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.grey600,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.grey600,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.grey600,
          ),
        ),
        hintText: hintText ?? 'Enter text',
        hintStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: AppColors.grey600,
        ),
        suffixIcon: suffixIcon.isEmpty
            ? null
            : Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  suffixIcon,
                  width: 20,
                  height: 20,
                  color: AppColors.grey600,
                ),
              ),
        errorText: errorText,
      ),
    );
  }
}
