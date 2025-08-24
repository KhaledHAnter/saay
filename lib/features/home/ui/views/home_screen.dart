import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:saay/core/helpers/app_strings.dart';
import 'package:saay/core/helpers/constants.dart';
import 'package:saay/core/helpers/shared_prefernce_helper.dart';
import 'package:saay/core/theming/styles.dart';
import 'package:saay/core/theming/theming_cubit/theme_cubit.dart';
import 'package:saay/core/widgets/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Future<void> toggleLanguage(BuildContext context) async {
    final currentLang = context.locale.languageCode;

    // حدد اللغة الجديدة
    final newLang = currentLang == 'ar' ? 'en' : 'ar';

    // احفظ اللغة الجديدة محليًا
    await SharedPrefHelper.setData(langCacheKey, newLang);

    // غيّر اللغة باستخدام EasyLocalization
    await context.setLocale(Locale(newLang));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    AppStrings.homeScreenTitle,
                    style: Styles.font16SemiBold(context),
                  ),
                  Gap(10),
                  AppText(
                    AppStrings.appVersion,
                    style: Styles.font16SemiBold(context),
                  ),
                ],
              ),
              Gap(20),
              Text(
                AppStrings.homeScreenTitle.tr(),
                style: Styles.font16SemiBold(context),
              ), // مثال زر لتغيير الثيم (في أي شاشة):
              Gap(20),
              ElevatedButton(
                onPressed:
                    () => context.read<ThemeCubit>().toggleTheme(context),
                child: Text(AppStrings.changeTheme.tr()),
              ),
              Gap(20),
              ElevatedButton(
                onPressed: () => toggleLanguage(context),
                child: Text(AppStrings.changeLanguage.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
