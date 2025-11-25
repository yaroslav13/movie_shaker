import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class MovieCollectionCardTheme
    extends ThemeExtension<MovieCollectionCardTheme> {
  const MovieCollectionCardTheme({
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.titleStyle,
    this.subtitleStyle,
    this.iconTheme,
  });

  final Color? backgroundColor;

  final double? elevation;

  final BorderRadiusGeometry? borderRadius;

  final TextStyle? titleStyle;

  final TextStyle? subtitleStyle;

  final IconThemeData? iconTheme;

  @override
  MovieCollectionCardTheme copyWith({
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    IconThemeData? iconTheme,
  }) {
    return MovieCollectionCardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      borderRadius: borderRadius ?? this.borderRadius,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      iconTheme: iconTheme ?? this.iconTheme,
    );
  }

  @override
  MovieCollectionCardTheme lerp(
    covariant ThemeExtension<MovieCollectionCardTheme>? other,
    double t,
  ) {
    if (other is! MovieCollectionCardTheme) {
      return this;
    }

    return MovieCollectionCardTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      elevation: lerpDouble(elevation, other.elevation, t),
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t),
      subtitleStyle: TextStyle.lerp(subtitleStyle, other.subtitleStyle, t),
      iconTheme: IconThemeData.lerp(iconTheme, other.iconTheme, t),
    );
  }
}
