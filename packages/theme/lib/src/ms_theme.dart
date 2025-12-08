import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme/src/extensions/bookmark_button_theme.dart';
import 'package:theme/src/extensions/carousel_dots_indicator_theme.dart';
import 'package:theme/src/extensions/contributor_card_theme.dart';
import 'package:theme/src/extensions/dot_separated_text_theme.dart';
import 'package:theme/src/extensions/dots_progress_indicator_theme.dart';
import 'package:theme/src/extensions/genre_card_theme.dart';
import 'package:theme/src/extensions/glassmorphic_card_theme.dart';
import 'package:theme/src/extensions/like_button_theme.dart';
import 'package:theme/src/extensions/loading_error_stub_theme.dart';
import 'package:theme/src/extensions/movie_card_theme.dart';
import 'package:theme/src/extensions/movie_carousel_theme.dart';
import 'package:theme/src/extensions/movie_collection_card_theme.dart';
import 'package:theme/src/extensions/ms_app_bar_delegate_theme.dart';
import 'package:theme/src/extensions/ms_app_bar_theme.dart';
import 'package:theme/src/extensions/ms_bottom_bar_theme.dart';
import 'package:theme/src/extensions/ms_bottom_sheet_theme.dart';
import 'package:theme/src/extensions/ms_card_theme.dart';
import 'package:theme/src/extensions/ms_carousel_theme.dart';
import 'package:theme/src/extensions/ms_elevated_button_theme.dart';
import 'package:theme/src/extensions/ms_filter_chip_theme.dart';
import 'package:theme/src/extensions/ms_floating_action_button_theme.dart';
import 'package:theme/src/extensions/ms_floating_app_bar_theme.dart';
import 'package:theme/src/extensions/ms_icon_button_theme.dart';
import 'package:theme/src/extensions/ms_input_decoration_theme.dart';
import 'package:theme/src/extensions/ms_list_tile_theme.dart';
import 'package:theme/src/extensions/ms_snack_bar_theme.dart';
import 'package:theme/src/extensions/ms_text_button_theme.dart';
import 'package:theme/src/extensions/no_items_stub_theme.dart';
import 'package:theme/src/extensions/popularity_score_card_theme.dart';
import 'package:theme/src/extensions/rating_card_theme.dart';
import 'package:theme/src/extensions/rounded_back_button_theme.dart';
import 'package:theme/src/extensions/score_arc_theme.dart';
import 'package:theme/src/extensions/segmented_row_entry_theme.dart';
import 'package:theme/src/extensions/segmented_row_theme.dart';
import 'package:theme/src/extensions/staggered_grid_view_theme.dart';
import 'package:theme/src/extensions/watch_button_theme.dart';
import 'package:theme/src/ms_colors.dart';
import 'package:theme/src/shared/ms_border_radius.dart';
import 'package:theme/src/shared/ms_edge_insets.dart';
import 'package:theme/src/shared/ms_icon_sizes.dart';
import 'package:theme/src/shared/ms_spacings.dart';

extension type MsTheme._(ThemeData data) implements ThemeData {
  factory MsTheme.light() {
    final data = _createThemeData(MsColors.light(), Brightness.light);

    return MsTheme._(data);
  }

  static const _recommendedAlpha = 0.8;
  static const _recommendedElevation = 8.0;

  static ThemeData _createThemeData(MsColors colors, Brightness brightness) {
    final theme = _setupThemeFoundation(colors, brightness);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return theme.copyWith(
      extensions: [
        _createMovieCardTheme(),
        _createStaggeredGridViewTheme(textTheme),
        _createDotsProgressIndicatorTheme(colorScheme),
        _createLoadingErrorStubTheme(textTheme),
        _createMsElevatedButtonTheme(colorScheme, textTheme),
        _createMsIconButtonTheme(colorScheme),
        _createMsInputDecorationTheme(colorScheme, textTheme),
        _createMsAppBarTheme(),
        _createMsFloatingAppBarTheme(colorScheme),
        _createSegmentedRowTheme(colorScheme, textTheme),
        _createMsBottomBarTheme(colorScheme),
        _createLikeButtonTheme(colorScheme),
        _createBookmarkButtonTheme(colorScheme),
        _createMsListTileTheme(colorScheme, textTheme),
        _createMovieCarouselTheme(colorScheme),
        _createMsFilterChipTheme(colorScheme, textTheme),
        _createAppBarDelegateTheme(colorScheme),
        _createNoItemsStubTheme(textTheme),
        _createMovieCollectionCardTheme(colorScheme, textTheme),
        _createMsFloatingActionButtonTheme(colorScheme),
        _createMsBottomSheetTheme(colorScheme),
        _createMsSnackBarTheme(colorScheme, textTheme),
        _createMsTextButtonTheme(colorScheme, textTheme),
        _createRoundedBackButtonTheme(colorScheme),
        _createGlassmorphicCardTheme(colorScheme),
        _createWatchButtonTheme(textTheme, colorScheme),
        _createDotSeparatedTextTheme(textTheme, colorScheme),
        _createScoreArcTheme(colorScheme, textTheme),
        _createMsCardTheme(colorScheme),
        _createRatingCardTheme(colorScheme, textTheme),
        _createEmojiScoreCardTheme(colorScheme, textTheme),
        _createGenreCardTheme(colorScheme, textTheme),
        _createMsCarouselTheme(colorScheme),
        _createContributorCardTheme(colorScheme, textTheme),
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

  static MovieCardTheme _createMovieCardTheme() {
    return const MovieCardTheme(
      borderRadius: MsBorderRadius.extraLarge,
      elevation: _recommendedElevation,
    );
  }

  static StaggeredGridViewTheme _createStaggeredGridViewTheme(
    TextTheme textTheme,
  ) {
    return StaggeredGridViewTheme(
      crossAxisCount: 2,
      crossAxisSpacing: MsSpacings.medium,
      mainAxisSpacing: MsSpacings.medium,
      padding: MsEdgeInsets.scrollableContentPadding,
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
      elevation: _recommendedElevation,
      padding: MsEdgeInsets.contentLarge,
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
      elevation: _recommendedElevation,
      padding: MsEdgeInsets.iconButtonPadding,
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
      contentPadding: MsEdgeInsets.textFieldPadding,
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

  static MsAppBarTheme _createMsAppBarTheme() {
    return MsAppBarTheme(
      elevation: _recommendedElevation,
      centerTitle: true,
    );
  }

  static MsFloatingAppBarTheme _createMsFloatingAppBarTheme(
    ColorScheme colorScheme,
  ) {
    return MsFloatingAppBarTheme(
      elevation: _recommendedElevation,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: colorScheme.onPrimary,
      ),
      expandedHeight: 400,
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
        contentPadding: MsEdgeInsets.contentMedium,
      ),
    );
  }

  static MsBottomBarTheme _createMsBottomBarTheme(
    ColorScheme colorScheme,
  ) {
    return MsBottomBarTheme(
      selectedItemColor: colorScheme.primary,
      itemPadding: MsEdgeInsets.bottomBarItemPadding,
      margin: MsEdgeInsets.contentMedium,
    );
  }

  static LikeButtonTheme _createLikeButtonTheme(
    ColorScheme colorScheme,
  ) {
    return LikeButtonTheme(
      likedColor: colorScheme.error,
      unlikedColor: colorScheme.onInverseSurface,
      backgroundColor: _applyAlpha(colorScheme.inverseSurface),
    );
  }

  static BookmarkButtonTheme _createBookmarkButtonTheme(
    ColorScheme colorScheme,
  ) {
    return BookmarkButtonTheme(
      foregroundColor: colorScheme.onInverseSurface,
      backgroundColor: _applyAlpha(colorScheme.inverseSurface),
    );
  }

  static MsListTileTheme _createMsListTileTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return MsListTileTheme(
      backgroundColor: colorScheme.surface,
      padding: MsEdgeInsets.contentLarge,
      borderRadius: MsBorderRadius.regular,
      titleStyle: textTheme.titleMedium,
      subtitleStyle: textTheme.bodySmall,
    );
  }

  static MovieCarouselTheme _createMovieCarouselTheme(
    ColorScheme colorScheme,
  ) {
    return MovieCarouselTheme(
      dotsIndicatorTheme: CarouselDotsIndicatorTheme(
        backgroundColor: _applyAlpha(colorScheme.inverseSurface),
        activeColor: colorScheme.primary,
        inactiveColor: colorScheme.onInverseSurface,
      ),
    );
  }

  static MsFilterChipTheme _createMsFilterChipTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return MsFilterChipTheme(
      backgroundColor: colorScheme.surfaceContainerLowest,
      foregroundColor: colorScheme.onSecondary,
      selectedBackgroundColor: colorScheme.secondary,
      selectedForegroundColor: colorScheme.surfaceContainerLowest,
      borderRadius: MsBorderRadius.regular,
      padding: MsEdgeInsets.chipPadding,
      labelStyle: textTheme.bodyMedium,
    );
  }

  static MsAppBarDelegateTheme _createAppBarDelegateTheme(
    ColorScheme colorScheme,
  ) {
    return MsAppBarDelegateTheme(
      backgroundColor: colorScheme.surface,
      elevation: _recommendedElevation,
      borderRadius: MsBorderRadius.extraLarge,
    );
  }

  static NoItemsStubTheme _createNoItemsStubTheme(
    TextTheme textTheme,
  ) {
    return NoItemsStubTheme(
      descriptionStyle: textTheme.titleLarge,
      captionStyle: textTheme.bodySmall,
    );
  }

  static MovieCollectionCardTheme _createMovieCollectionCardTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return MovieCollectionCardTheme(
      elevation: _recommendedElevation,
      backgroundColor: colorScheme.surfaceContainerHighest,
      borderRadius: MsBorderRadius.extraLarge,
      titleStyle: textTheme.titleMedium,
      subtitleStyle: textTheme.bodySmall,
      tileIconTheme: IconThemeData(
        color: colorScheme.onSurface,
        size: MsIconSizes.small,
      ),
      placeholderIconTheme: IconThemeData(
        color: colorScheme.onSurface,
        size: MsIconSizes.large,
      ),
    );
  }

  static MsFloatingActionButtonTheme _createMsFloatingActionButtonTheme(
    ColorScheme colorScheme,
  ) {
    return MsFloatingActionButtonTheme(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: _recommendedElevation,
    );
  }

  static MsBottomSheetTheme _createMsBottomSheetTheme(
    ColorScheme colorScheme,
  ) {
    return MsBottomSheetTheme(
      backgroundColor: colorScheme.surface,
      elevation: _recommendedElevation,
      shape: const RoundedRectangleBorder(
        borderRadius: MsBorderRadius.extraLarge,
      ),
      clipBehavior: Clip.hardEdge,
      showDragHandle: true,
    );
  }

  static MsSnackBarTheme _createMsSnackBarTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return MsSnackBarTheme(
      textStyle: textTheme.bodyMedium,
      shape: const RoundedRectangleBorder(
        borderRadius: MsBorderRadius.regular,
      ),
      elevation: _recommendedElevation,
      padding: MsEdgeInsets.contentMedium,
      duration: const Duration(seconds: 1),
      variantStyles: {
        MsSnackBarVariant.error: MsSnackBarVariantStyle(
          backgroundColor: colorScheme.error,
          foregroundColor: colorScheme.onError,
        ),
      },
    );
  }

  static MsTextButtonTheme _createMsTextButtonTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return MsTextButtonTheme(
      foregroundColor: colorScheme.primary,
      borderRadius: MsBorderRadius.regular,
      padding: MsEdgeInsets.contentLarge,
      textStyle: textTheme.labelLarge,
    );
  }

  static RoundedBackButtonTheme _createRoundedBackButtonTheme(
    ColorScheme colorScheme,
  ) {
    return RoundedBackButtonTheme(
      foregroundColor: colorScheme.onInverseSurface,
      backgroundColor: _applyAlpha(colorScheme.inverseSurface),
      padding: MsEdgeInsets.contentMedium,
    );
  }

  static GlassmorphicCardTheme _createGlassmorphicCardTheme(
    ColorScheme colorScheme,
  ) {
    return const GlassmorphicCardTheme(
      blurSigma: 10,
      borderRadius: MsBorderRadius.extraLarge,
      elevation: _recommendedElevation,
    );
  }

  static WatchButtonTheme _createWatchButtonTheme(
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return WatchButtonTheme(
      textStyle: textTheme.labelLarge,
      foregroundColor: colorScheme.onPrimary,
    );
  }

  static DotSeparatedTextTheme _createDotSeparatedTextTheme(
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return DotSeparatedTextTheme(
      textStyle: textTheme.bodyMedium,
      dotColor: colorScheme.outline,
    );
  }

  static ScoreArcTheme _createScoreArcTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return ScoreArcTheme(
      strokeWidth: 20,
      trackColor: colorScheme.surfaceContainerLow,
      valueColors: [
        colorScheme.error,
        colorScheme.secondary,
      ],
      labelStyle: textTheme.displayLarge,
    );
  }

  static MsCardTheme _createMsCardTheme(ColorScheme colorScheme) {
    return MsCardTheme(
      backgroundColor: colorScheme.surface,
      elevation: _recommendedElevation,
      borderRadius: MsBorderRadius.large,
    );
  }

  static RatingCardTheme _createRatingCardTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return RatingCardTheme(
      backgroundColor: colorScheme.surface,
      elevation: _recommendedElevation,
      borderRadius: MsBorderRadius.extraLarge,
      descriptionStyle: textTheme.titleLarge,
    );
  }

  static PopularityScoreCardTheme _createEmojiScoreCardTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return PopularityScoreCardTheme(
      backgroundColor: colorScheme.surface,
      elevation: _recommendedElevation,
      borderRadius: MsBorderRadius.extraLarge,
      scoreStyle: textTheme.displayLarge,
      descriptionStyle: textTheme.titleLarge,
    );
  }

  static GenreCardTheme _createGenreCardTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return GenreCardTheme(
      backgroundColor: colorScheme.surface,
      elevation: _recommendedElevation,
      borderRadius: MsBorderRadius.extraLarge,
      titleStyle: textTheme.bodyMedium,
    );
  }

  static MsCarouselTheme _createMsCarouselTheme(
    ColorScheme colorScheme,
  ) {
    return MsCarouselTheme(
      backgroundColor: colorScheme.surface,
      elevation: _recommendedElevation,
      borderRadius: MsBorderRadius.large,
      padding: MsEdgeInsets.contentSmall,
    );
  }

  static ContributorCardTheme _createContributorCardTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return ContributorCardTheme(
      captionBackgroundColor: _applyAlpha(colorScheme.inverseSurface),
      captionForegroundColor: colorScheme.onInverseSurface,
      elevation: _recommendedElevation,
      borderRadius: MsBorderRadius.large,
      nameTextStyle: textTheme.titleMedium,
      characterTextStyle: textTheme.bodySmall,
    );
  }

  static Color _applyAlpha(Color color, [double alpha = _recommendedAlpha]) {
    return color.withValues(alpha: alpha);
  }
}
