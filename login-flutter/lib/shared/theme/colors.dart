// coverage:ignore-file
import 'package:flutter/material.dart';

class ColorsTheme {
  // Cores mais comuns, para facilidade de alteração no futuro

  /// Para backgrounds, textos, botões primários
  static const primary = mainPrimary;

  /// Alteração da cor primária ao apertar um botão
  //static const primaryPressed = primary600Pressed;

  /// Para backgrounds, botões secundários, e fontes em backgrounds com a cor primária.
  //static const secondary = neutral900;
  //static const secondaryPressed = neutral900Pressed;

  /// Para links e itens de form (checkbox,toggle)
  //static const tertiary = primary700;
  //static const tertiaryPressed = primary700Pressed;

  //Primary

  static const darkPrimary = Color(0xff13233e);

  static const mainPrimary = Color(0xff1b3157);

  static const lightPrimary = Color(0xff66758e);

  //Secondary

  static const darkSecondary = Color(0xff437533);

  static const mainSecondary = Color(0xff5fa548);

  static const lightSecondary = Color(0xff94c384);

  //Neutral

  static const neutral1 = Color(0xff000000);

  static const neutral2 = Color(0xff212224);

  static const neutral3 = Color(0xff2f3032);

  static const neutral4 = Color(0xff59595b);

  static const neutral5 = Color(0xff747476);

  static const neutral6 = Color(0xff9fa0a1);

  static const neutral7 = Color(0xffbfbfbf);

  static const neutral8 = Color(0xffeaeaeb);

  static const neutral9 = Color(0xfff3f3f3);

  static const neutral10 = Color(0xffffffff);

  //Support

  static const support01Dark = Color(0xff2b662c);

  static const support01Main = Color(0xff3C903E);

  static const support01Light = Color(0xff7CB57E);

  static const support02Dark = Color(0xff952A2A);

  static const support02Main = Color(0xffD23B3B);

  static const support02Light = Color(0xffE17C7C);

  static const support03Dark = Color(0xffB58707);

  static const support03Main = Color(0xffFFBE0A);

  static const support03Light = Color(0xffFFD35B);

  static const support04Dark = Color(0xffA75900);

  static const support04Main = Color(0xffEB7D00);

  static const support04Light = Color(0xffF2A854);

  static const support05Dark = Color(0xff20458A);

  static const support05Main = Color(0xff2D61C3);

  static const support05Light = Color(0xff7295D7);

  static const support06Dark = Color(0xff370E66);

  static const support06Main = Color(0xff4E148F);

  static const support06Light = Color(0xff8862B4);

  static const supportPix = Color(0xff25B785);

  // Shimmer
  static const baseShimmerColor = Color(0xffd0d0d0);

  static const finalShimmerColor = Color(0xffe8e8e8);

  // Loading
  static const loading01 = Color(0xffd0d0d0); //Color(0xffE8E8E8);

  static const loading02 = Color(0xffe8e8e8); //Color(0xffD3D3D3);

  static MaterialColor createMaterialColor(Color color) {
    List<double> strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
