// coverage:ignore-file
class LineHeightTheme {
  /// line height 12px (line-height-100)
  static double lineHeight100(double fontSize) => _geiHeight(fontSize: fontSize, lineHeight: 12);

  /// line height 16px (line-height-200)
  static double lineHeight200(double fontSize) => _geiHeight(fontSize: fontSize, lineHeight: 16);

  /// line height 20px (line-height-300)
  static double lineHeight300(double fontSize) => _geiHeight(fontSize: fontSize, lineHeight: 20);

  /// line height 24px (line-height-400)
  static double lineHeight400(double fontSize) => _geiHeight(fontSize: fontSize, lineHeight: 24);

  /// line height 28px (line-height-500)
  static double lineHeight500(double fontSize) => _geiHeight(fontSize: fontSize, lineHeight: 28);

  /// line height 32px (line-height-600)
  static double lineHeight600(double fontSize) => _geiHeight(fontSize: fontSize, lineHeight: 32);

  /// line height 36px (line-height-700)
  static double lineHeight700(double fontSize) => _geiHeight(fontSize: fontSize, lineHeight: 36);

  /// line height 48px (line-height-800)
  static double lineHeight800(double fontSize) => _geiHeight(fontSize: fontSize, lineHeight: 48);

  static double _geiHeight({required double fontSize, required double lineHeight}) => lineHeight / fontSize;
}
