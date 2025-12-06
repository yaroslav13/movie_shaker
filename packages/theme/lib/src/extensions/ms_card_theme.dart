import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class MsCardTheme extends ThemeExtension<MsCardTheme> {
  const MsCardTheme({
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
  });

  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  @override
  MsCardTheme copyWith({
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
  }) {
    return MsCardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  MsCardTheme lerp(covariant ThemeExtension<MsCardTheme>? other, double t) {
    if (other is! MsCardTheme) {
      return this;
    }

    return MsCardTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      elevation: lerpDouble(elevation, other.elevation, t),
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
    );
  }
}
