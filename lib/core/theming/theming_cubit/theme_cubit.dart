import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:saay/core/helpers/shared_prefernce_helper.dart';
import 'package:saay/core/theming/app_themes.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const _key = 'isDarkMode';

  ThemeCubit()
    : super(ThemeState(themeData: AppTheme.lightTheme, isDarkMode: false));

  Future<void> loadTheme(Brightness platformBrightness) async {
    final isDark = await SharedPrefHelper.getBool(_key);

    if (isDark == null) {
      final defaultDark = platformBrightness == Brightness.dark;
      await SharedPrefHelper.setData(_key, defaultDark);
      emit(
        ThemeState(
          themeData: defaultDark ? AppTheme.darkTheme : AppTheme.lightTheme,
          isDarkMode: defaultDark,
        ),
      );
    } else {
      emit(
        ThemeState(
          themeData: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
          isDarkMode: isDark,
        ),
      );
    }
  }

  Future<void> toggleTheme() async {
    final newIsDark = !state.isDarkMode;
    await SharedPrefHelper.setData(_key, newIsDark);
    emit(
      ThemeState(
        themeData: newIsDark ? AppTheme.darkTheme : AppTheme.lightTheme,
        isDarkMode: newIsDark,
      ),
    );
  }
}
