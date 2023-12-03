// coverage:ignore-file
import 'package:flutter/cupertino.dart';
import 'package:login/shared/enums/font-family.enum.dart';
import 'package:login/shared/theme/colors.dart';
import 'package:login/shared/theme/font-size.style.dart';
import 'package:login/shared/theme/font-weight.style.dart';
import 'package:login/shared/theme/line-height.style.dart';

class TypographyTheme {
  //Heading

  static TextStyle headingBig({Color color = ColorsTheme.primary}) => TextStyle(
      color: color,
      fontFamily: FontFamilies.roboto.value,
      fontWeight: FontWeightTheme.bold,
      fontSize: FontSizeTheme.headingBig,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight800(FontSizeTheme.headingBig));

  static TextStyle headingMedium({Color color = ColorsTheme.primary}) => TextStyle(
      color: color,
      fontFamily: FontFamilies.roboto.value,
      fontWeight: FontWeightTheme.bold,
      fontSize: FontSizeTheme.headingMedium,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight600(FontSizeTheme.headingMedium));

  static TextStyle headingSmall({Color color = ColorsTheme.primary}) => TextStyle(
      color: color,
      fontFamily: FontFamilies.roboto.value,
      fontWeight: FontWeightTheme.bold,
      fontSize: FontSizeTheme.headingSmall,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.headingSmall));

  //Paragraph

  static TextStyle paragraphBigBold({Color color = ColorsTheme.neutral3}) => TextStyle(
      color: color,
      fontFamily: FontFamilies.roboto.value,
      fontWeight: FontWeightTheme.bold,
      fontSize: FontSizeTheme.paragraphBigBold,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.paragraphBigBold));

  static TextStyle paragraphBigRegular({Color color = ColorsTheme.neutral3}) => TextStyle(
      color: color,
      fontFamily: FontFamilies.roboto.value,
      fontWeight: FontWeightTheme.regular,
      fontSize: FontSizeTheme.paragraphBigRegular,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.paragraphBigRegular));

  static TextStyle paragraphMediumBold({Color color = ColorsTheme.neutral3}) => TextStyle(
      color: color,
      fontFamily: FontFamilies.roboto.value,
      fontWeight: FontWeightTheme.bold,
      fontSize: FontSizeTheme.paragraphMediumBold,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.paragraphMediumBold));

  static TextStyle paragraphMediumRegular({Color color = ColorsTheme.neutral3}) => TextStyle(
      color: color,
      fontFamily: FontFamilies.roboto.value,
      fontWeight: FontWeightTheme.regular,
      fontSize: FontSizeTheme.paragraphMediumRegular,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.paragraphMediumRegular));

  static TextStyle paragraphSmallBold({Color color = ColorsTheme.neutral3}) => TextStyle(
      color: color,
      fontFamily: FontFamilies.roboto.value,
      fontWeight: FontWeightTheme.bold,
      fontSize: FontSizeTheme.paragraphSmallBold,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight200(FontSizeTheme.paragraphSmallBold));

  static TextStyle paragraphSmallRegular({Color color = ColorsTheme.neutral3}) => TextStyle(
      color: color,
      fontFamily: FontFamilies.roboto.value,
      fontWeight: FontWeightTheme.regular,
      fontSize: FontSizeTheme.paragraphSmallRegular,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight200(FontSizeTheme.paragraphSmallRegular));

  static TextStyle paragraphXSmallBold({Color color = ColorsTheme.neutral3}) => TextStyle(
      color: color,
      fontFamily: FontFamilies.roboto.value,
      fontWeight: FontWeightTheme.bold,
      fontSize: FontSizeTheme.paragraphXSmallBold,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight100(FontSizeTheme.paragraphXSmallBold));

  static TextStyle paragraphXSmallRegular({Color color = ColorsTheme.neutral3}) => TextStyle(
      color: color,
      fontFamily: FontFamilies.roboto.value,
      fontWeight: FontWeightTheme.regular,
      fontSize: FontSizeTheme.paragraphXSmallRegular,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight100(FontSizeTheme.paragraphXSmallRegular));

  //Link

  static TextStyle linkBig({Color color = ColorsTheme.mainSecondary}) => TextStyle(
      color: color,
      fontFamily: FontFamilies.roboto.value,
      fontWeight: FontWeightTheme.bold,
      fontSize: FontSizeTheme.linkBig,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.underline,
      decorationColor: ColorsTheme.mainSecondary,
      decorationThickness: 1,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.linkBig));

  static TextStyle linkMedium({Color color = ColorsTheme.mainSecondary}) => TextStyle(
      color: color,
      fontFamily: FontFamilies.roboto.value,
      fontWeight: FontWeightTheme.bold,
      fontSize: FontSizeTheme.linkMedium,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.underline,
      decorationColor: ColorsTheme.mainSecondary,
      decorationThickness: 1,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.linkMedium));

  static TextStyle linkSmall({Color color = ColorsTheme.mainSecondary}) => TextStyle(
      color: color,
      fontFamily: FontFamilies.roboto.value,
      fontWeight: FontWeightTheme.bold,
      fontSize: FontSizeTheme.linkSmall,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.underline,
      decorationColor: ColorsTheme.mainSecondary,
      decorationThickness: 1,
      height: LineHeightTheme.lineHeight200(FontSizeTheme.linkSmall));
}
