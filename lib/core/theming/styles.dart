import 'package:flutter/material.dart';
import 'package:saay/core/theming/colors.dart';
import 'package:saay/core/theming/font_weights_helper.dart';

class Styles {
  static String arabicFontFamily = 'DIN Next LT Arabic';
  static TextStyle font12SemiBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightsHelper.semiBold,
    color: ColorsManager.mainBlue,
    fontFamily: arabicFontFamily,
  );
  static TextStyle font16SemiBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightsHelper.semiBold,
    color: Colors.white,
    fontFamily: arabicFontFamily,
  );
}
