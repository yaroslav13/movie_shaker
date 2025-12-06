import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class PopularityScoreCardTheme
    extends ThemeExtension<PopularityScoreCardTheme> {
  const PopularityScoreCardTheme({
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.scoreStyle,
    this.descriptionStyle,
  });

  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? scoreStyle;
  final TextStyle? descriptionStyle;

  @override
  PopularityScoreCardTheme copyWith({
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
    TextStyle? scoreStyle,
    TextStyle? descriptionStyle,
  }) {
    return PopularityScoreCardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      borderRadius: borderRadius ?? this.borderRadius,
      scoreStyle: scoreStyle ?? this.scoreStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
    );
  }

  @override
  PopularityScoreCardTheme lerp(
    covariant ThemeExtension<PopularityScoreCardTheme>? other,
    double t,
  ) {
    if (other is! PopularityScoreCardTheme) {
      return this;
    }

    return PopularityScoreCardTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      elevation: lerpDouble(elevation, other.elevation, t),
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
      scoreStyle: TextStyle.lerp(
        scoreStyle,
        other.scoreStyle,
        t,
      ),
      descriptionStyle: TextStyle.lerp(
        descriptionStyle,
        other.descriptionStyle,
        t,
      ),
    );
  }
}
