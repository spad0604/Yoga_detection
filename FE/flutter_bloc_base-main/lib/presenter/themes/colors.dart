import 'package:flutter/material.dart';

class AppThemeColors {
  final MaterialColor primarySwatch;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color background;
  final Color backgroundDark;
  final Color disabled;
  final Color information;
  final Color success;
  final Color alert;
  final Color warning;
  final Color error;
  final Color text;
  final Color textOnPrimary;
  final Color border;
  final Color hint;

  const AppThemeColors({
    required this.primarySwatch,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.backgroundDark,
    required this.disabled,
    required this.information,
    required this.success,
    required this.alert,
    required this.warning,
    required this.error,
    required this.text,
    required this.textOnPrimary,
    required this.border,
    required this.hint,
  });

  AppThemeColors lerp(covariant dynamic other, double t) {
    if (other is! AppThemeColors) {
      return this;
    }
    return AppThemeColors(
      primarySwatch: primarySwatch,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      background: Color.lerp(background, other.background, t)!,
      backgroundDark: Color.lerp(backgroundDark, other.backgroundDark, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      information: Color.lerp(information, other.information, t)!,
      success: Color.lerp(success, other.success, t)!,
      alert: Color.lerp(alert, other.alert, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      text: Color.lerp(text, other.text, t)!,
      textOnPrimary: Color.lerp(textOnPrimary, other.textOnPrimary, t)!,
      border: Color.lerp(border, other.border, t)!,
      hint: Color.lerp(hint, other.hint, t)!,
    );
  }

  AppThemeColors copyWith({
    MaterialColor? primarySwatch,
    Color? primary,
    Color? secondary,
    Color? accent,
    Color? background,
    Color? backgroundDark,
    Color? disabled,
    Color? information,
    Color? success,
    Color? alert,
    Color? warning,
    Color? error,
    Color? text,
    Color? textOnPrimary,
    Color? border,
    Color? hint,
  }) {
    return AppThemeColors(
      primarySwatch: primarySwatch ?? this.primarySwatch,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
      background: background ?? this.background,
      backgroundDark: backgroundDark ?? this.backgroundDark,
      disabled: disabled ?? this.disabled,
      information: information ?? this.information,
      success: success ?? this.success,
      alert: alert ?? this.alert,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      text: text ?? this.text,
      textOnPrimary: textOnPrimary ?? this.textOnPrimary,
      border: border ?? this.border,
      hint: hint ?? this.hint,
    );
  }
}

abstract class AppColors {
  const AppColors._();

  // Base colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  // Modern Yoga-themed color palette
  // Primary - Calming Purple/Violet (meditation, spirituality)
  static const Color primaryPurple = Color(0xFF7B68EE);
  static const Color primaryPurpleDark = Color(0xFF5E4DB2);
  static const Color primaryPurpleLight = Color(0xFFA294F9);

  // Secondary - Peaceful Teal (balance, tranquility)
  static const Color secondaryTeal = Color(0xFF4ECDC4);
  static const Color secondaryTealDark = Color(0xFF3AAFA9);
  static const Color secondaryTealLight = Color(0xFF7EDDD8);

  // Accent - Energizing Coral (vitality, warmth)
  static const Color accentCoral = Color(0xFFFF6B6B);
  static const Color accentCoralLight = Color(0xFFFF8E8E);

  // Neutral colors
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color backgroundCard = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFFF5F5F7);

  // Text colors
  static const Color textPrimary = Color(0xFF2D3142);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Border & Divider
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderFocused = Color(0xFF7B68EE);
  static const Color divider = Color(0xFFEFEFEF);

  // Status colors
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFFD1FAE5);
  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color info = Color(0xFF3B82F6);
  static const Color infoLight = Color(0xFFDBEAFE);

  // Gradient colors
  static const List<Color> gradientPurple = [Color(0xFF7B68EE), Color(0xFFA294F9)];
  static const List<Color> gradientTeal = [Color(0xFF4ECDC4), Color(0xFF7EDDD8)];
  static const List<Color> gradientSunset = [Color(0xFFFF6B6B), Color(0xFFFFB347)];
  static const List<Color> gradientCalm = [Color(0xFF667EEA), Color(0xFF764BA2)];

  // Legacy colors (kept for backward compatibility)
  static const Color red = Color(0xFFFA6555);
  static const Color grey600 = Color(0xFF9EA1A8);
  static const Color primaryBlue = Color(0xFF2489F4);
  static const Color gray = Color(0xFF6C7278);
  static const Color lightBlue = Color(0xFF4D81E7);
  static const Color lightGray = Color(0xFFEFF0F6);
  static const Color darkBlue = Color(0xFF0A1D9C);
  static const Color teal = Color(0xFF68EBD7);
  static const Color cyan = Color(0xFF62BEEF);
  static const Color grey = Color(0xFF808080);
  static const Color blue = Color(0XFF0B70DB);
  static const Color lightCyan = Color(0xFFE7F2FE);
  static const Color grey200 = Color(0xFFF2F4F5);
  static const Color grey100 = Color(0xFFF7F7F7);
}
