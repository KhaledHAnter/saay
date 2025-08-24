import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saay/core/di/dependency_injection.dart';
import 'package:saay/core/routing/app_router.dart';
import 'package:saay/core/routing/routes.dart';
import 'package:saay/core/theming/app_themes.dart';
import 'package:saay/core/theming/theming_cubit/theme_cubit.dart';

class Saay extends StatelessWidget {
  final AppRouter appRouter;
  const Saay({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              builder: (_, child) {
                return MaterialApp(
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  debugShowCheckedModeBanner: false,
                  title: "Saay",
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: state.mode,
                  initialRoute: Routes.splashScreen,
                  onGenerateRoute: appRouter.generateRoute,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
