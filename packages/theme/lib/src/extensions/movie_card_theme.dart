import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class MovieCardTheme extends ThemeExtension<MovieCardTheme> {
  const MovieCardTheme({
    this.borderRadius,
    this.elevation,
    this.actionPadding,
    this.leadingPadding,
  });

  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? leadingPadding;
  final EdgeInsetsGeometry? actionPadding;

  @override
  MovieCardTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? elevation,
    EdgeInsetsGeometry? leadingPadding,
    EdgeInsetsGeometry? actionPadding,
  }) {
    return MovieCardTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      leadingPadding: leadingPadding ?? this.leadingPadding,
      actionPadding: actionPadding ?? this.actionPadding,
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
      leadingPadding: EdgeInsetsGeometry.lerp(
        leadingPadding,
        other.leadingPadding,
        t,
      ),
      actionPadding: EdgeInsetsGeometry.lerp(
        actionPadding,
        other.actionPadding,
        t,
      ),
    );
  }
}
