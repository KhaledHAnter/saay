import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saay/core/di/dependency_injection.dart';
import 'package:saay/core/routing/app_router.dart';
import 'package:saay/core/routing/routes.dart';
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
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Saay",
            theme: state.themeData,

            initialRoute: Routes.splashScreen,
            onGenerateRoute: appRouter.generateRoute,
          );
        },
      ),
    );
  }
}
