import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saay/core/di/dependency_injection.dart';
import 'package:saay/core/helpers/constants.dart';
import 'package:saay/core/helpers/shared_prefernce_helper.dart';
import 'package:saay/core/routing/app_router.dart';
import 'package:saay/saay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupGetIt();
  String? langFromStorage = await SharedPrefHelper.getString(langCacheKey);

  if (langFromStorage == null || langFromStorage.isEmpty) {
    final String defaultLang = PlatformDispatcher.instance.locale.languageCode;
    final supported = ['en', 'ar'];
    final fallbackLang = supported.contains(defaultLang) ? defaultLang : 'ar';

    await SharedPrefHelper.setData(langCacheKey, fallbackLang);
    langFromStorage = fallbackLang;
  }
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en"), Locale("ar")],
      path: langPath,
      fallbackLocale: const Locale("en"),
      startLocale: Locale(langFromStorage),
      child: Saay(appRouter: AppRouter()),
    ),
  );
}
