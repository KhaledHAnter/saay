// core/theming/styles.dart

import 'package:flutter/material.dart';
import 'package:saay/core/theming/font_weights_helper.dart';

class Styles {
  static const String arabicFontFamily = 'DIN Next LT Arabic';

  static TextStyle font12SemiBold(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeightsHelper.semiBold,
    color: Theme.of(context).colorScheme.primary,
    fontFamily: arabicFontFamily,
  );

  static TextStyle font16SemiBold(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeightsHelper.semiBold,
    color: Theme.of(context).textTheme.bodyMedium!.color,
    fontFamily: arabicFontFamily,
  );

  static TextStyle font14Medium(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeightsHelper.medium,
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: arabicFontFamily,
  );

  static TextStyle font18Bold(BuildContext context) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeightsHelper.bold,
    color: Theme.of(context).colorScheme.primary,
    fontFamily: arabicFontFamily,
  );

  // أضف المزيد من الأنماط حسب الحاجة مع تمرير context
}
