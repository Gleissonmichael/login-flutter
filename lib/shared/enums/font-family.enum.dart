// coverage:ignore-file

enum FontFamilies {
  roboto,
}

extension FontFamiliesExtension on FontFamilies {
  static const _values = {
    FontFamilies.roboto: "Roboto",
  };

  String get value => _values[this]!;
}

extension StringFontFamiliesExtension on String {
  static const _keys = {
    "Roboto": FontFamilies.roboto,
  };

  FontFamilies toFontFamily() => _keys[this]!;
}
