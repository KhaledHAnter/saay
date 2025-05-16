// core/theming/app_theme.dart

import 'package:flutter/material.dart';
import 'package:saay/core/theming/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey.shade100,
    primaryColor: ColorsManager.mainBlue,
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
    colorScheme: ColorScheme.light(
      primary: ColorsManager.mainBlue,
      onPrimary: Colors.white,
      secondary: Color(0xFFFFE082),
      onSecondary: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF141E24),
    primaryColor: ColorsManager.mainBlue,
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
    colorScheme: ColorScheme.dark(
      primary: ColorsManager.mainBlue,
      onPrimary: Colors.white,
      secondary: Color(0xFFFFC107),
      onSecondary: Colors.black87,
      surface: Color(0xFF121212),
      onSurface: Colors.white,
    ),
  );
}
