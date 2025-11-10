import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide ProgressIndicatorTheme;
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_components/src/dots_progress_indicator/dots_progress_indicator_theme.dart';
import 'package:ui_components/src/grid_view/staggered_grid_view_theme.dart';
import 'package:ui_components/src/like_button/like_button_theme.dart';
import 'package:ui_components/src/loading_error_stub/loading_error_stub_theme.dart';
import 'package:ui_components/src/movie_card/movie_card_theme.dart';
import 'package:ui_components/src/movie_carousel/carousel_dots_indicator_theme.dart';
import 'package:ui_components/src/movie_carousel/movie_carousel_theme.dart';
import 'package:ui_components/src/ms_app_bar/ms_app_bar_theme.dart';
import 'package:ui_components/src/ms_bottom_bar/ms_bottom_bar_theme.dart';
import 'package:ui_components/src/ms_elevated_button/ms_elevated_button_theme.dart';
import 'package:ui_components/src/ms_floating_app_bar/ms_floating_app_bar_theme.dart';
import 'package:ui_components/src/ms_icon_button/ms_icon_button_theme.dart';
import 'package:ui_components/src/ms_input_decoration/ms_input_decoration_theme.dart';
import 'package:ui_components/src/segmented_row/segmented_row_entry_theme.dart';
import 'package:ui_components/src/segmented_row/segmented_row_theme.dart';
import 'package:ui_components/src/shared/ms_border_radius.dart';
import 'package:ui_components/src/shared/ms_edge_insets.dart';
import 'package:ui_components/src/shared/ms_spacings.dart';
import 'package:ui_components/src/theme/ms_colors.dart';

extension type MsTheme._(ThemeData data) implements ThemeData {
  factory MsTheme.light() {
    final data = _createThemeData(MsColors.light(), Brightness.light);

    return MsTheme._(data);
  }

  static const _recommendedAlpha = 0.8;

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
        _createMsElevatedButtonTheme(colorScheme, textTheme),
        _createMsIconButtonTheme(colorScheme),
        _createMsInputDecorationTheme(colorScheme, textTheme),
        _createMsAppBarTheme(colorScheme, textTheme),
        _createMsFloatingAppBarTheme(colorScheme, textTheme),
        _createSegmentedRowTheme(colorScheme, textTheme),
        _createMsBottomBarTheme(colorScheme, textTheme),
        _createLikeButtonTheme(colorScheme, textTheme),
        _createMovieCarouselTheme(colorScheme, textTheme),
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
      displayLarge: GoogleFonts.caprasimo(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        letterSpacing: -1.5,
      ),
      displayMedium: GoogleFonts.caprasimo(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -1,
      ),
      headlineMedium: GoogleFonts.caprasimo(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
      ),
      titleLarge: GoogleFonts.caprasimo(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
      ),
      titleMedium: GoogleFonts.caprasimo(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyLarge: GoogleFonts.caprasimo(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      bodyMedium: GoogleFonts.caprasimo(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2,
      ),
      labelLarge: GoogleFonts.caprasimo(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.4,
      ),
      labelSmall: GoogleFonts.caprasimo(
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
    return const MovieCardTheme(
      borderRadius: MsBorderRadius.extraLarge,
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

  static MsElevatedButtonTheme _createMsElevatedButtonTheme(
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

  static MsInputDecorationTheme _createMsInputDecorationTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    final enabledBorder = OutlineInputBorder(
      borderRadius: MsBorderRadius.regular,
      borderSide: BorderSide(
        color: colorScheme.outline,
      ),
    );

    final focusedBorder = OutlineInputBorder(
      borderRadius: MsBorderRadius.regular,
      borderSide: BorderSide(
        color: colorScheme.primary,
      ),
    );

    final errorBorder = OutlineInputBorder(
      borderRadius: MsBorderRadius.regular,
      borderSide: BorderSide(
        color: colorScheme.error,
      ),
    );

    final focusedErrorBorder = OutlineInputBorder(
      borderRadius: MsBorderRadius.regular,
      borderSide: BorderSide(
        color: colorScheme.error,
        width: 2,
      ),
    );

    final disabledBorder = OutlineInputBorder(
      borderRadius: MsBorderRadius.regular,
      borderSide: BorderSide(
        color: colorScheme.onSurface,
      ),
    );

    final border = OutlineInputBorder(
      borderRadius: MsBorderRadius.regular,
      borderSide: BorderSide(
        color: colorScheme.outline,
      ),
    );

    return MsInputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerLow,
      contentPadding: MsEdgeInsets.textFieldContent,
      border: border,
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: focusedErrorBorder,
      disabledBorder: disabledBorder,
      hintStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      labelStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      errorStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.error,
      ),
    );
  }

  static MsAppBarTheme _createMsAppBarTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return MsAppBarTheme(
      elevation: 4,
      centerTitle: true,
    );
  }

  static MsFloatingAppBarTheme _createMsFloatingAppBarTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return MsFloatingAppBarTheme(
      elevation: 4,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: colorScheme.onPrimary,
      ),
      expandedHeight: 350,
    );
  }

  static SegmentedRowTheme _createSegmentedRowTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return SegmentedRowTheme(
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        space: 16,
        thickness: 1,
        indent: 0,
        endIndent: 0,
        radius: MsBorderRadius.regular,
      ),
      segmentTheme: SegmentedRowEntryTheme(
        labelStyle: textTheme.bodyMedium,
        captionStyle: textTheme.labelMedium,
        contentPadding: MsEdgeInsets.regularContent,
      ),
    );
  }

  static MsBottomBarTheme _createMsBottomBarTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return MsBottomBarTheme(
      selectedItemColor: colorScheme.primary,
      itemPadding: MsEdgeInsets.bottomBarItem,
      margin: MsEdgeInsets.regularContent,
    );
  }

  static LikeButtonTheme _createLikeButtonTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return LikeButtonTheme(
      likedColor: colorScheme.error,
      unlikedColor: colorScheme.onInverseSurface,
      backgroundColor: _applyAlpha(colorScheme.inverseSurface),
    );
  }

  static MovieCarouselTheme _createMovieCarouselTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return MovieCarouselTheme(
      dotsIndicatorTheme: CarouselDotsIndicatorTheme(
        backgroundColor: _applyAlpha(colorScheme.inverseSurface),
        activeColor: colorScheme.primary,
        inactiveColor: colorScheme.onInverseSurface,
      ),
    );
  }

  static Color _applyAlpha(Color color) {
    return color.withValues(alpha: _recommendedAlpha);
  }
}
