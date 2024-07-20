import 'package:flutter/material.dart';
import 'package:uber_app_customer/core/styles/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade200,
      colorScheme: const ColorScheme.light(
        secondary: Colors.white,
        onSecondary: Colors.black, // for black in light theme
      ));
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      colorScheme: const ColorScheme.dark(
        secondary: Colors.black,
        onSecondary: Colors.white, // for white in dark theme
      ));
}
