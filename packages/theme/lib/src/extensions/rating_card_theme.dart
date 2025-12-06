import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:theme/src/extensions/score_arc_theme.dart';

@immutable
final class RatingCardTheme extends ThemeExtension<RatingCardTheme> {
  const RatingCardTheme({
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.descriptionStyle,
    this.scoreArcTheme,
  });

  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  final TextStyle? descriptionStyle;

  final ScoreArcTheme? scoreArcTheme;

  @override
  RatingCardTheme copyWith({
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    TextStyle? descriptionStyle,
    ScoreArcTheme? scoreArcTheme,
  }) {
    return RatingCardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      borderRadius: borderRadius ?? this.borderRadius,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      scoreArcTheme: scoreArcTheme ?? this.scoreArcTheme,
    );
  }

  @override
  RatingCardTheme lerp(
    covariant ThemeExtension<RatingCardTheme>? other,
    double t,
  ) {
    if (other is! RatingCardTheme) {
      return this;
    }

    return RatingCardTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
      elevation: lerpDouble(elevation, other.elevation, t),
      descriptionStyle: TextStyle.lerp(
        descriptionStyle,
        other.descriptionStyle,
        t,
      ),
      scoreArcTheme: scoreArcTheme?.lerp(other.scoreArcTheme, t),
    );
  }
}
