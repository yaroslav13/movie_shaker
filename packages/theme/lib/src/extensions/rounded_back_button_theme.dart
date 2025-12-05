import 'package:flutter/material.dart';

@immutable
final class RoundedBackButtonTheme
    extends ThemeExtension<RoundedBackButtonTheme> {
  const RoundedBackButtonTheme({
    this.foregroundColor,
    this.backgroundColor,
    this.padding,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  RoundedBackButtonTheme copyWith({
    Color? foregroundColor,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
  }) {
    return RoundedBackButtonTheme(
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
    );
  }

  @override
  RoundedBackButtonTheme lerp(
    covariant ThemeExtension<RoundedBackButtonTheme>? other,
    double t,
  ) {
    if (other is! RoundedBackButtonTheme) {
      return this;
    }

    return RoundedBackButtonTheme(
      foregroundColor: Color.lerp(
        foregroundColor,
        other.foregroundColor,
        t,
      ),
      backgroundColor: Color.lerp(
        backgroundColor,
        other.backgroundColor,
        t,
      ),
      padding: EdgeInsetsGeometry.lerp(
        padding,
        other.padding,
        t,
      ),
    );
  }
}
