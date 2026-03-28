import 'package:flutter/material.dart';

@immutable
final class SettingsButtonTheme extends ThemeExtension<SettingsButtonTheme> {
  const SettingsButtonTheme({
    this.backgroundColor,
    this.padding,
  });

  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  SettingsButtonTheme copyWith({
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
  }) {
    return SettingsButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
    );
  }

  @override
  SettingsButtonTheme lerp(
    covariant ThemeExtension<SettingsButtonTheme>? other,
    double t,
  ) {
    if (other is! SettingsButtonTheme) {
      return this;
    }

    return SettingsButtonTheme(
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
