import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saay/core/theming/styles.dart';
import 'package:saay/core/theming/theming_cubit/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Home View",
                style: Styles.font16SemiBold(context),
              ), // مثال زر لتغيير الثيم (في أي شاشة):
              ElevatedButton(
                onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                child: Text('تبديل الثيم'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
