// core/di/di.dart
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:saay/core/theming/theming_cubit/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> setupGetIt(Brightness systemBrightness) async {
  // Register ThemeCubit with pre-loaded theme state
  final themeCubit = ThemeCubit();
  await themeCubit.loadTheme(systemBrightness);

  sl.registerSingleton<ThemeCubit>(themeCubit);
}
