import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class MovieCardTheme extends ThemeExtension<MovieCardTheme> {
  const MovieCardTheme({
    this.borderRadius,
    this.elevation,
  });

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
      elevation: elevation ?? this.elevation,
    );
  }

  @override
  MovieCardTheme lerp(
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
      elevation: lerpDouble(elevation, other.elevation, t) ?? 0,
    );
  }
}
