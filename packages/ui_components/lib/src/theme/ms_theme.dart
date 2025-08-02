import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide ProgressIndicatorTheme;
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_components/src/dots_progress_indicator/dots_progress_indicator_theme.dart';
import 'package:ui_components/src/grid_view/staggered_grid_view_theme.dart';
import 'package:ui_components/src/loading_error_stub/loading_error_stub_theme.dart';
import 'package:ui_components/src/movie_card/movie_card_theme.dart';
import 'package:ui_components/src/ms_elevated_button/ms_elevated_button_theme.dart';
import 'package:ui_components/src/ms_icon_button/ms_icon_button_theme.dart';
import 'package:ui_components/src/shared/ms_border_radius.dart';
import 'package:ui_components/src/shared/ms_edge_insets.dart';
import 'package:ui_components/src/shared/ms_spacings.dart';
import 'package:ui_components/src/theme/ms_colors.dart';

extension type MsTheme._(ThemeData data) implements ThemeData {
  factory MsTheme.light() {
    final data = _createThemeData(MsColors.light(), Brightness.light);

    return MsTheme._(data);
  }

  static ThemeData _createThemeData(MsColors colors, Brightness brightness) {
    final theme = _setupThemeFoundation(colors, brightness);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return theme.copyWith(
      extensions: [
        _createMovieCardTheme(colorScheme, textTheme),
        _createStaggeredGridViewTheme(textTheme),
        _createDotsProgressIndicatorTheme(colorScheme),
        _createLoadingErrorStubTheme(textTheme),
        _createMSElevatedButtonTheme(colorScheme, textTheme),
        _createMsIconButtonTheme(colorScheme),
      ],
    );
  }

  static ThemeData _setupThemeFoundation(
    MsColors colors,
    Brightness brightness,
  ) {
    const cupertinoTheme = CupertinoThemeData(applyThemeToAll: true);

    final flexSchemeColor = FlexSchemeColor.effective(
      _createColorScheme(colors),
      4,
    );
    final visualDensity = FlexColorScheme.comfortablePlatformDensity;

    final textTheme = _createTextTheme();

    return switch (brightness) {
      Brightness.dark => FlexThemeData.dark(
        colors: flexSchemeColor,
        visualDensity: visualDensity,
        cupertinoOverrideTheme: cupertinoTheme,
        textTheme: textTheme,
      ),
      Brightness.light => FlexThemeData.light(
        colors: flexSchemeColor,
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
    return TextTheme(
      displayLarge: GoogleFonts.roboto(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        letterSpacing: -1.5,
      ),
      displayMedium: GoogleFonts.roboto(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -1,
      ),
      headlineMedium: GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
      ),
      titleLarge: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2,
      ),
      labelLarge: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.4,
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
      ),
    );
  }

  static MovieCardTheme _createMovieCardTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return MovieCardTheme(
      backgroundColor: colorScheme.surfaceContainerLow,
      borderRadius: MsBorderRadius.extraLarge,
      titleStyle: textTheme.titleLarge,
      subtitleStyle: textTheme.bodyMedium,
      elevation: 8,
    );
  }

  static StaggeredGridViewTheme _createStaggeredGridViewTheme(
    TextTheme textTheme,
  ) {
    return StaggeredGridViewTheme(
      crossAxisCount: 2,
      crossAxisSpacing: MsSpacings.medium,
      mainAxisSpacing: MsSpacings.medium,
      padding: MsEdgeInsets.scrollableContent,
      largeTextStyle: textTheme.displayMedium,
      smallTextStyle: textTheme.bodyLarge,
    );
  }

  static DotsProgressIndicatorTheme _createDotsProgressIndicatorTheme(
    ColorScheme colorScheme,
  ) {
    return DotsProgressIndicatorTheme(
      dotSize: 6,
      spacing: MsSpacings.xxSmall,
      color: colorScheme.primary,
    );
  }

  static LoadingErrorStubTheme _createLoadingErrorStubTheme(
    TextTheme textTheme,
  ) {
    return LoadingErrorStubTheme(textStyle: textTheme.displayMedium);
  }

  static MsElevatedButtonTheme _createMSElevatedButtonTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return MsElevatedButtonTheme(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      borderRadius: MsBorderRadius.regular,
      elevation: 8,
      padding: const EdgeInsets.all(24),
      textStyle: textTheme.labelLarge,
    );
  }

  static MsIconButtonTheme _createMsIconButtonTheme(
    ColorScheme colorScheme,
  ) {
    return MsIconButtonTheme(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      borderRadius: MsBorderRadius.regular,
      elevation: 8,
      padding: const EdgeInsets.all(16),
    );
  }
}
