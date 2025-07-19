import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_components/src/theme/ms_colors.dart';

extension type MsTheme._(ThemeData data) implements ThemeData {
  factory MsTheme.light() {
    final data = _createThemeData(MsColors.light(), Brightness.light);

    return MsTheme._(data);
  }

  static ThemeData _createThemeData(MsColors colors, Brightness brightness) {
    const cupertinoTheme = CupertinoThemeData(applyThemeToAll: true);

    final colorScheme =
        FlexSchemeColor.effective(_createColorScheme(colors), 4);
    final visualDensity = FlexColorScheme.comfortablePlatformDensity;

    final textTheme = _createTextTheme();

    return switch (brightness) {
      Brightness.dark => FlexThemeData.dark(
          colors: colorScheme,
          visualDensity: visualDensity,
          cupertinoOverrideTheme: cupertinoTheme,
          textTheme: textTheme,
        ),
      Brightness.light => FlexThemeData.light(
          colors: colorScheme,
          visualDensity: visualDensity,
          cupertinoOverrideTheme: cupertinoTheme,
          textTheme: textTheme,
        ),
    };
  }

  static FlexSchemeColor _createColorScheme(MsColors colors) {
    return FlexSchemeColor(
      primary: colors.brand,
      secondary: colors.accent,
      tertiary: colors.supportive,
      error: colors.error,
    );
  }

  static TextTheme _createTextTheme() {
    return GoogleFonts.robotoTextTheme();
  }
}
