import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class MsAppBarDelegateTheme
    extends ThemeExtension<MsAppBarDelegateTheme> {
  const MsAppBarDelegateTheme({
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
  });

  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  @override
  MsAppBarDelegateTheme copyWith({
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
  }) {
    return MsAppBarDelegateTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  MsAppBarDelegateTheme lerp(
    covariant ThemeExtension<MsAppBarDelegateTheme>? other,
    double t,
  ) {
    if (other is! MsAppBarDelegateTheme) {
      return this;
    }

    return MsAppBarDelegateTheme(
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
