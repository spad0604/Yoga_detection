import 'package:flutter/material.dart';
import 'package:flutter_starter/presenter/themes/colors.dart';
import 'package:flutter_starter/presenter/themes/styles.dart';
import 'package:flutter_starter/presenter/themes/themes.dart';
import 'package:flutter_starter/presenter/themes/themes/light.dart';
import 'package:flutter_starter/presenter/themes/typography.dart';

extension AppThemeExtension on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>() ?? const LightAppTheme();

  AppThemeTypography get typographies => appTheme.typographies;

  AppThemeColors get colors => appTheme.colors;

  AppThemeStyles get styles => appTheme.styles;
}

extension TextStyleExtension on TextStyle {
  TextStyle withHeight(double? height) => copyWith(height: height);

  TextStyle withColor(Color? color) => copyWith(color: color);

  TextStyle withSize(double? size) => copyWith(fontSize: size);

  TextStyle withWeight(FontWeight? weight) => merge(TextStyle(fontWeight: weight));
}

extension DateTimeExtension on DateTime {
  String dateTimeToDayMonDay() {
    // Converts DateTime to 'Sat, Dec 06' format (capitalize first letter)
    final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    String dayStr = days[weekday % 7];
    String monthStr = months[month - 1];
    String dayNumStr = day.toString().padLeft(2, '0');
    return '$dayStr, $monthStr $dayNumStr';
  }
}
