import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class MsFloatingActionButtonTheme
    extends ThemeExtension<MsFloatingActionButtonTheme> {
  const MsFloatingActionButtonTheme({
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.shape,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final ShapeBorder? shape;

  @override
  MsFloatingActionButtonTheme copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    return MsFloatingActionButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      elevation: elevation ?? this.elevation,
      shape: shape ?? this.shape,
    );
  }

  @override
  MsFloatingActionButtonTheme lerp(
    covariant ThemeExtension<MsFloatingActionButtonTheme>? other,
    double t,
  ) {
    if (other is! MsFloatingActionButtonTheme) {
      return this;
    }

    return MsFloatingActionButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      elevation: lerpDouble(elevation, other.elevation, t),
      shape: ShapeBorder.lerp(shape, other.shape, t),
    );
  }
}
