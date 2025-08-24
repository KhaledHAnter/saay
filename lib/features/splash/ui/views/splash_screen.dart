import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saay/core/helpers/assets.dart';
import 'package:saay/core/helpers/constants.dart';
import 'package:saay/core/helpers/extentions.dart';
import 'package:saay/core/helpers/shared_prefernce_helper.dart';
import 'package:saay/core/routing/routes.dart';
import 'package:saay/core/theming/styles.dart';
import 'package:saay/core/theming/theming_cubit/theme_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _animation;

  void _navigateAfterSplash() async {
    final String? country = await SharedPrefHelper.getString(countryCacheKey);
    log('country: $country');

    if (!mounted) return;

    context.pushReplacementNamed(
      country == null || country.isEmpty
          ? Routes.countryScreen
          : Routes.homeScreen,
    );
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () => _navigateAfterSplash());
  }

  bool _isThemeLoaded = false;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (!_isThemeLoaded) {
      context.read<ThemeCubit>().loadThemeFromSystem(context);
      _isThemeLoaded = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color(0xFF3A7CA5),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                SvgPicture.asset(
                  Assets.imagesAppIconSvg,
                  height: width / 1.5,
                  width: width / 1.5,
                ),
                Spacer(),
                SlideTransition(
                  position: _textSlideAnimation,
                  child: Text(
                    'وَأَن لَّيْسَ لِلْإِنسَانِ إِلَّا مَا سَعَىٰ',
                    style: Styles.font16SemiBold(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
