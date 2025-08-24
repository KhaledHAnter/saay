import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:saay/core/global/global.dart';
import 'package:saay/core/helpers/app_strings.dart';
import 'package:saay/core/theming/styles.dart';
import 'package:saay/core/widgets/app_text.dart';
import 'package:saay/features/country/ui/widgets/country_headers.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEn = Global.langCode == 'en';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CountryHeaders(),
              Gap(20),
              Padding(
                padding:
                    EdgeInsets.only(
                      right: isEn ? 80 : 0,
                      left: isEn ? 0 : 80,
                    ).r,
                child: AppText(
                  AppStrings.selectYourCountry,
                  maxLines: 2,
                  style: Styles.font48Bold(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
