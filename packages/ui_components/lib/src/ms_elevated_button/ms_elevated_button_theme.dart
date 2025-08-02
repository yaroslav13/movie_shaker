import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class MsElevatedButtonTheme
    extends ThemeExtension<MsElevatedButtonTheme> {
  const MsElevatedButtonTheme({
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.elevation,
    this.padding,
    this.textStyle,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  @override
  MsElevatedButtonTheme copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    BorderRadiusGeometry? borderRadius,
    double? elevation,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
  }) {
    return MsElevatedButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  MsElevatedButtonTheme lerp(
    covariant ThemeExtension<MsElevatedButtonTheme>? other,
    double t,
  ) {
    if (other is! MsElevatedButtonTheme) {
      return this;
    }

    return MsElevatedButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
      elevation: lerpDouble(elevation, other.elevation, t),
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t),
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
    );
  }
}
