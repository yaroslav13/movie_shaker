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
    this.tileIconTheme,
    this.placeholderIconTheme,
  });

  final Color? backgroundColor;

  final double? elevation;

  final BorderRadiusGeometry? borderRadius;

  final TextStyle? titleStyle;

  final TextStyle? subtitleStyle;

  final IconThemeData? tileIconTheme;

  final IconThemeData? placeholderIconTheme;

  @override
  MovieCollectionCardTheme copyWith({
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    IconThemeData? tileIconTheme,
    IconThemeData? placeholderIconTheme,
  }) {
    return MovieCollectionCardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      borderRadius: borderRadius ?? this.borderRadius,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      tileIconTheme: tileIconTheme ?? this.tileIconTheme,
      placeholderIconTheme: placeholderIconTheme ?? this.placeholderIconTheme,
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
      tileIconTheme: IconThemeData.lerp(tileIconTheme, other.tileIconTheme, t),
      placeholderIconTheme: IconThemeData.lerp(
        placeholderIconTheme,
        other.placeholderIconTheme,
        t,
      ),
    );
  }
}
