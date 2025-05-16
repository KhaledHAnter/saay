import 'package:flutter/material.dart';
import 'package:saay/core/di/dependency_injection.dart';
import 'package:saay/core/routing/app_router.dart';
import 'package:saay/saay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Brightness systemBrightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;
  await setupGetIt(systemBrightness);
  runApp(Saay(appRouter: AppRouter()));
}
