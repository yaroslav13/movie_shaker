import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class MovieCardTheme extends ThemeExtension<MovieCardTheme> {
  const MovieCardTheme({
    this.borderRadius,
    this.titleStyle,
    this.subtitleStyle,
    this.elevation,
    this.backgroundColor,
  });

  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  final Color? backgroundColor;

  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  @override
  MovieCardTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    double? elevation,
    Color? backgroundColor,
  }) {
    return MovieCardTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      elevation: elevation ?? this.elevation,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  ThemeExtension<MovieCardTheme> lerp(
    covariant ThemeExtension<MovieCardTheme>? other,
    double t,
  ) {
    if (other is! MovieCardTheme) {
      return this;
    }

    return MovieCardTheme(
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t),
      subtitleStyle: TextStyle.lerp(subtitleStyle, other.subtitleStyle, t),
      elevation: lerpDouble(elevation, other.elevation, t) ?? 0,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
    );
  }
}
