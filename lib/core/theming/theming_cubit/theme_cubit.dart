import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:saay/core/helpers/shared_prefernce_helper.dart';
import 'package:saay/core/theming/app_themes.dart';

part 'theme_state.dart';

enum AppThemeMode { system, light, dark }

class ThemeCubit extends Cubit<ThemeState> {
  static const _key = 'themeMode';

  ThemeCubit() : super(const ThemeState(mode: ThemeMode.system));

  Future<void> loadThemeFromSystem(BuildContext context) async {
    final savedValue = await SharedPrefHelper.getString(_key);

    ThemeMode selectedMode;

    if (savedValue.isEmpty) {
      // First time run → default to system
      selectedMode = ThemeMode.system;
    } else {
      selectedMode = ThemeMode.values.firstWhere(
        (e) => e.name == savedValue,
        orElse: () => ThemeMode.system,
      );
    }

    emit(ThemeState(mode: selectedMode));
  }

  Future<void> toggleTheme(BuildContext context) async {
    // الوضع اللي عايشه الشاشة حاليًا (فعليًا)
    final brightness = MediaQuery.of(context).platformBrightness;

    // استخدم الحالة المحفوظة إن وجدت، أو الوضع الفعلي من النظام
    final isCurrentlyDark =
        state.mode == ThemeMode.dark ||
        (state.mode == ThemeMode.system && brightness == Brightness.dark);

    final newMode = isCurrentlyDark ? ThemeMode.light : ThemeMode.dark;

    await SharedPrefHelper.setData(_key, newMode.name);
    emit(ThemeState(mode: newMode));
  }

  ThemeData getCurrentTheme(Brightness platformBrightness) {
    switch (state.mode) {
      case ThemeMode.light:
        return AppTheme.lightTheme;
      case ThemeMode.dark:
        return AppTheme.darkTheme;
      case ThemeMode.system:
        return platformBrightness == Brightness.dark
            ? AppTheme.darkTheme
            : AppTheme.lightTheme;
    }
  }
}
