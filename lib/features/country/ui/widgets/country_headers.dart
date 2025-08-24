import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saay/core/global/global.dart';
import 'package:saay/core/helpers/app_strings.dart';
import 'package:saay/core/helpers/constants.dart';
import 'package:saay/core/helpers/shared_prefernce_helper.dart';
import 'package:saay/core/theming/styles.dart';
import 'package:saay/core/theming/theming_cubit/theme_cubit.dart';
import 'package:saay/core/widgets/app_text.dart';

class CountryHeaders extends StatelessWidget {
  const CountryHeaders({super.key});

  Future<void> toggleLanguage(BuildContext context) async {
    final currentLang = context.locale.languageCode;

    // حدد اللغة الجديدة
    final newLang = currentLang == 'ar' ? 'en' : 'ar';

    // احفظ اللغة الجديدة محليًا
    await SharedPrefHelper.setData(langCacheKey, newLang);

    Global.langCode = newLang;
    // غيّر اللغة باستخدام EasyLocalization
    await context.setLocale(Locale(newLang));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () => toggleLanguage(context),
            child: AppText(
              Global.langCode == 'en' ? AppStrings.arabic : AppStrings.english,
              style: Styles.font16SemiBold(context),
            ),
          ),
          Spacer(),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return IconButton(
                onPressed:
                    () => context.read<ThemeCubit>().toggleTheme(context),
                icon:
                    state.mode == ThemeMode.light
                        ? const Icon(Icons.dark_mode)
                        : const Icon(Icons.light_mode),
              );
            },
          ),
        ],
      ),
    );
  }
}
