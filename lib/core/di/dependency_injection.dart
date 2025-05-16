// core/di/di.dart
import 'package:get_it/get_it.dart';
import 'package:saay/core/theming/theming_cubit/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> setupGetIt() async {
  // Register ThemeCubit with pre-loaded theme state
  final themeCubit = ThemeCubit();

  sl.registerSingleton<ThemeCubit>(themeCubit);
}
