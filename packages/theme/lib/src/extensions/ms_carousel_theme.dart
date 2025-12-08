import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class MsCarouselTheme extends ThemeExtension<MsCarouselTheme> {
  const MsCarouselTheme({
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.padding,
  });

  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets? padding;

  @override
  MsCarouselTheme copyWith({
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
    EdgeInsets? padding,
  }) {
    return MsCarouselTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
    );
  }

  @override
  MsCarouselTheme lerp(
    covariant ThemeExtension<MsCarouselTheme>? other,
    double t,
  ) {
    if (other is! MsCarouselTheme) {
      return this;
    }

    return MsCarouselTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      elevation: lerpDouble(elevation, other.elevation, t),
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
      padding: EdgeInsets.lerp(padding, other.padding, t),
    );
  }
}
