import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class MsIconButtonTheme extends ThemeExtension<MsIconButtonTheme> {
  const MsIconButtonTheme({
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.elevation,
    this.padding,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final EdgeInsetsGeometry? padding;

  @override
  MsIconButtonTheme copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    BorderRadiusGeometry? borderRadius,
    double? elevation,
    EdgeInsetsGeometry? padding,
  }) {
    return MsIconButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      padding: padding ?? this.padding,
    );
  }

  @override
  MsIconButtonTheme lerp(
    covariant ThemeExtension<MsIconButtonTheme>? other,
    double t,
  ) {
    if (other is! MsIconButtonTheme) {
      return this;
    }

    return MsIconButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
      elevation: lerpDouble(elevation, other.elevation, t),
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t),
    );
  }
}
