import 'package:flutter/material.dart';
import 'package:saay/core/routing/app_router.dart';
import 'package:saay/core/routing/routes.dart';
import 'package:saay/core/theming/colors.dart';

class Saay extends StatelessWidget {
  final AppRouter appRouter;
  const Saay({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Saay",
      theme: ThemeData(
        primaryColor: ColorsManager.mainBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: Routes.splashScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
