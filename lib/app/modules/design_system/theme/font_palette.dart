import 'package:flutter/material.dart';

abstract class FontPalette {
  static void changeCurrent(FontPalette newFontPallete) => _current = newFontPallete;
  static FontPalette? _current;
  static FontPalette get current {
    _current ??= DefaultFontPalette();
    return _current!;
  }

  TextStyle get appbarTitle;
  TextStyle get cardTitle;
  TextStyle get cardSubtitle;
  TextStyle get introTitle;
  TextStyle get nextButton;
  TextStyle get sectionTitle;
  TextStyle get closeButton;
  TextStyle get filterSectionTitle;
  TextStyle get filterBody;
  TextStyle get detailsTitle;
  TextStyle get detailsSubtitle;
  TextStyle get detailsDownloads;
  TextStyle get detailsPrice;
  TextStyle get detailsDescription;
}

class DefaultFontPalette implements FontPalette {
  @override
  TextStyle get appbarTitle => const TextStyle(fontSize: 24, color: Color(0xFF212121), letterSpacing: -0.5, fontWeight: FontWeight.w400);

  @override
  TextStyle get cardSubtitle => const TextStyle(fontSize: 10, color: Color(0xFF222222), letterSpacing: -0.5, fontWeight: FontWeight.w400);

  @override
  TextStyle get cardTitle => const TextStyle(fontSize: 10, color: Color(0xFF222222), letterSpacing: -0.5, fontWeight: FontWeight.w700);

  @override
  TextStyle get introTitle =>
      TextStyle(fontSize: 36, color: Colors.white.withOpacity(0.9), letterSpacing: -0.5, fontWeight: FontWeight.w500);

  @override
  TextStyle get nextButton => const TextStyle(letterSpacing: -0.5, fontWeight: FontWeight.w600, fontSize: 20);

  @override
  TextStyle get sectionTitle => const TextStyle(letterSpacing: -0.5, fontWeight: FontWeight.w600, fontSize: 18);

  @override
  TextStyle get closeButton => const TextStyle(letterSpacing: -0.5, fontWeight: FontWeight.w400, fontSize: 17, color: Color(0xFF222222));

  @override
  TextStyle get filterBody => const TextStyle(letterSpacing: -0.5, fontWeight: FontWeight.w400, fontSize: 15, color: Color(0xFF030303));

  @override
  TextStyle get filterSectionTitle =>
      const TextStyle(letterSpacing: -0.5, fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xFF030303));

  @override
  TextStyle get detailsTitle => const TextStyle(letterSpacing: -0.5, fontWeight: FontWeight.w700, fontSize: 30, color: Colors.white);

  @override
  TextStyle get detailsSubtitle =>
      TextStyle(letterSpacing: -0.5, fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white.withOpacity(0.5));

  @override
  TextStyle get detailsDownloads => const TextStyle(letterSpacing: -0.5, fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white);

  @override
  TextStyle get detailsPrice => const TextStyle(letterSpacing: -0.5, fontWeight: FontWeight.w700, fontSize: 23, color: Color(0xFFDE3A60));
  @override
  TextStyle get detailsDescription =>
      const TextStyle(letterSpacing: -0.5, fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xFF343434), height: 2);
}
