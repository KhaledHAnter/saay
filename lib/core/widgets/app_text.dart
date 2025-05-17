import "package:easy_localization/easy_localization.dart" as tr;
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:readmore/readmore.dart";
import "package:saay/core/helpers/app_strings.dart";
import "package:saay/core/theming/colors.dart";
import "package:saay/core/theming/styles.dart";

// Widget kText({
//   required String? text,
//   double? fontSize,
//   FontWeight? fontWeight,
//   Color? color,
//   TextAlign? textAlign,
//   int? maxLines,
//   double? fontHeight,
//   TextDecoration? decoration,
//   TextStyle? style,
//   bool pageTitle = false,
//   bool pageSubTitle = false,
//   bool bodyTitle = false,
//   TextDirection? textDirection,
//   int? trimLines,
// }) {
//   return trimLines != null
//       ? ReadMoreText(
//         text != null ? text.tr() : text.toString(),
//         trimLines: trimLines,
//         trimMode: TrimMode.Line,
//         trimCollapsedText: AppStrings.seeMore.tr(),
//         trimExpandedText: AppStrings.seeLess.tr(),
//         moreStyle: Styles.font14Medium(context),
//         lessStyle: GoogleFonts.inter(
//           fontSize: 14.r,
//           fontWeight: FontWeight.bold,
//           color: ColorsManager.grey,
//         ),
//         style: GoogleFonts.inter(fontSize: 13.r, fontWeight: FontWeight.w400),
//       )
//       : Text(
//         text != null ? text.tr() : text.toString(),
//         textAlign: textAlign,

//         overflow: TextOverflow.ellipsis,
//         textDirection: textDirection,
//         maxLines: maxLines,
//         //for arabic text almarai
//         //FOR ENGLISH TEXT GoogleFonts.INTER()
//         style:
//             style ??
//             (Global.langCode == "ar"
//                 ? GoogleFonts.almarai(
//                   decoration: decoration,
//                   decorationColor: ColorsManager.mainBlue,
//                   height: fontHeight,
//                   fontSize: fontSize?.spMin ?? 15.spMin,
//                   fontWeight: fontWeight ?? FontWeight.w500,
//                   color: color,
//                 )
//                 : GoogleFonts.inter(
//                   decoration: decoration,
//                   decorationColor: ColorsManager.mainBlue,
//                   height: fontHeight,
//                   fontSize:
//                       fontSize?.spMin ??
//                       (pageTitle
//                           ? 23.spMin
//                           : bodyTitle
//                           ? 14.spMin
//                           : pageSubTitle
//                           ? 13.spMin
//                           : 13.spMin),
//                   fontWeight:
//                       fontWeight ??
//                       (pageTitle
//                           ? FontWeight.w700
//                           : bodyTitle
//                           ? FontWeight.w600
//                           : pageSubTitle
//                           ? FontWeight.w400
//                           : FontWeight.w500),
//                   color: color,
//                 )),
//       );
// }

// TextSpan kTextSpan({
//   required String text,
//   double? fontSize,
//   FontWeight? fontWeight,
//   Color? color,
//   TextAlign? textAlign,
//   int? maxLines,
//   double? fontHeight,
//   TextDecoration? decoration,
//   TextStyle? style,
//   bool pageTitle = false,
//   bool pageSubTitle = false,
//   bool bodyTitle = false,
//   GestureRecognizer? onTap,
// }) {
//   return TextSpan(
//     text: text.tr(),
//     recognizer: onTap,
//     //for arabic text almarai
//     //FOR ENGLISH TEXT GoogleFonts.INTER()
//     style:
//         style ??
//         (Global.langCode == "ar"
//             ? GoogleFonts.almarai(
//               decoration: decoration,
//               decorationColor: ColorsManager.mainBlue,
//               height: fontHeight,
//               fontSize: fontSize?.spMin ?? 15.spMin,
//               fontWeight: fontWeight ?? FontWeight.w500,
//               color: color,
//             )
//             : GoogleFonts.inter(
//               decoration: decoration,
//               decorationColor: ColorsManager.mainBlue,
//               height: fontHeight,
//               fontSize:
//                   fontSize?.spMin ??
//                   (pageTitle
//                       ? 23.spMin
//                       : bodyTitle
//                       ? 14.spMin
//                       : pageSubTitle
//                       ? 13.spMin
//                       : 13.spMin),
//               fontWeight:
//                   fontWeight ??
//                   (pageTitle
//                       ? FontWeight.w700
//                       : bodyTitle
//                       ? FontWeight.w600
//                       : pageSubTitle
//                       ? FontWeight.w400
//                       : FontWeight.w500),
//               color: color,
//             )),
//   );
// }

class AppText extends StatelessWidget {
  final int? trimLines;
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextDecoration? decoration;
  final TextStyle? style, moreStyle, lessStyle;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontHeight;
  final TextDirection? textDirection;
  final TrimMode? trimMode;
  final TextOverflow? overflow;
  const AppText({
    super.key,
    this.trimLines,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.decoration,
    this.style,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontHeight,
    this.textDirection,
    this.moreStyle,
    this.lessStyle,
    this.trimMode,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return trimLines != null
        ? ReadMoreText(
          text.tr(),
          trimLines: trimLines!,
          trimMode: trimMode ?? TrimMode.Line,
          trimCollapsedText: AppStrings.seeMore.tr(),
          trimExpandedText: AppStrings.seeLess.tr(),
          moreStyle: moreStyle ?? Styles.font14Bold(context),
          lessStyle: lessStyle ?? Styles.font14Bold(context),
          style: style ?? Styles.font13Medium(context),
        )
        : Text(
          text.tr(),
          textAlign: textAlign,

          overflow: overflow ?? TextOverflow.ellipsis,
          textDirection: textDirection,
          maxLines: maxLines,
          style:
              style ??
              TextStyle(
                decoration: decoration,
                decorationColor: ColorsManager.mainBlue,
                height: fontHeight,
                fontSize: fontSize?.spMin ?? 15.spMin,
                fontWeight: fontWeight ?? FontWeight.w500,
                color: color,
              ),
        );
  }
}
