import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

@immutable
final class GlassmorphicCardTheme
    extends ThemeExtension<GlassmorphicCardTheme> {
  const GlassmorphicCardTheme({
    this.blurSigma,
    this.borderRadius,
    this.elevation,
  });

  final double? blurSigma;

  final BorderRadiusGeometry? borderRadius;

  final double? elevation;

  @override
  GlassmorphicCardTheme copyWith({
    double? blurSigma,
    BorderRadiusGeometry? borderRadius,
    double? elevation,
  }) {
    return GlassmorphicCardTheme(
      blurSigma: blurSigma ?? this.blurSigma,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
    );
  }

  @override
  GlassmorphicCardTheme lerp(
    covariant ThemeExtension<GlassmorphicCardTheme>? other,
    double t,
  ) {
    if (other is! GlassmorphicCardTheme) {
      return this;
    }

    return GlassmorphicCardTheme(
      blurSigma: lerpDouble(blurSigma, other.blurSigma, t),
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
      elevation: lerpDouble(elevation, other.elevation, t),
    );
  }
}
