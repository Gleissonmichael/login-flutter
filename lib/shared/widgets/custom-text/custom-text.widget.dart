import 'package:flutter/material.dart';
import 'package:login/shared/enums/font-family.enum.dart';
import 'package:login/shared/theme/colors.dart';
import 'package:login/shared/theme/typography.dart';

enum CustomTexts {
  headingBig,
  headingMedium,
  headingSmall,
  paragraphBigBold,
  paragraphBigRegular,
  paragraphMediumBold,
  paragraphMediumRegular,
  paragraphSmallBold,
  paragraphSmallRegular,
  paragraphXSmallBold,
  paragraphXSmallRegular,
  linkBig,
  linkMedium,
  linkSmall,
}

class CustomText extends StatelessWidget {
  final CustomTexts type;
  final Color color;
  final String text;
  final Function? callback;
  final int maxLines;
  final TextAlign textAlign;
  final bool isRichText;
  final FontFamilies? fontFamilyOverride;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;

  const CustomText({
    Key? key,
    required this.type,
    required this.text,
    this.isRichText = false,
    this.callback,
    this.color = ColorsTheme.primary,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.fontFamilyOverride,
    this.fontStyle,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isRichText
        ? Text(text,
            maxLines: maxLines,
            softWrap: true,
            style: getTextStyle(type),
            textAlign: textAlign,
            textDirection: TextDirection.ltr,
            overflow: overflow)
        : RichText(
            text: TextSpan(
              text: text,
              style: getTextStyle(type),
              children: const <TextSpan>[],
            ),
            textAlign: textAlign,
            textDirection: TextDirection.ltr,
            maxLines: maxLines,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          );
  }

  TextStyle getTextStyle(CustomTexts type) {
    TextStyle textStyle = _textTypeToStyle[type]!;
    return textStyle.copyWith(
        color: color, fontFamily: fontFamilyOverride?.value, fontStyle: fontStyle);
  }

  static final Map<CustomTexts, TextStyle> _textTypeToStyle = {
    CustomTexts.headingBig: TypographyTheme.headingBig(),
    CustomTexts.headingMedium: TypographyTheme.headingMedium(),
    CustomTexts.headingSmall: TypographyTheme.headingSmall(),
    CustomTexts.paragraphBigBold: TypographyTheme.paragraphBigBold(),
    CustomTexts.paragraphBigRegular: TypographyTheme.paragraphBigRegular(),
    CustomTexts.paragraphMediumBold: TypographyTheme.paragraphMediumBold(),
    CustomTexts.paragraphMediumRegular: TypographyTheme.paragraphMediumRegular(),
    CustomTexts.paragraphSmallBold: TypographyTheme.paragraphSmallBold(),
    CustomTexts.paragraphSmallRegular: TypographyTheme.paragraphSmallRegular(),
    CustomTexts.paragraphXSmallBold: TypographyTheme.paragraphXSmallBold(),
    CustomTexts.paragraphXSmallRegular: TypographyTheme.paragraphXSmallRegular(),
    CustomTexts.linkBig: TypographyTheme.linkBig(),
    CustomTexts.linkMedium: TypographyTheme.linkMedium(),
    CustomTexts.linkSmall: TypographyTheme.linkSmall(),
  };
}
