import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class GenreCardTheme extends ThemeExtension<GenreCardTheme> {
  const GenreCardTheme({
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.titleStyle,
  });

  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? titleStyle;

  @override
  GenreCardTheme copyWith({
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
    TextStyle? titleStyle,
  }) {
    return GenreCardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      borderRadius: borderRadius ?? this.borderRadius,
      titleStyle: titleStyle ?? this.titleStyle,
    );
  }

  @override
  GenreCardTheme lerp(
    covariant ThemeExtension<GenreCardTheme>? other,
    double t,
  ) {
    if (other is! GenreCardTheme) {
      return this;
    }

    return GenreCardTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      elevation: lerpDouble(elevation, other.elevation, t),
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t),
    );
  }
}
