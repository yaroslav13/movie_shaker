import 'package:flutter/material.dart';

@immutable
final class WatchButtonTheme extends ThemeExtension<WatchButtonTheme> {
  const WatchButtonTheme({
    this.textStyle,
    this.foregroundColor,
  });

  final TextStyle? textStyle;
  final Color? foregroundColor;

  @override
  WatchButtonTheme copyWith({
    TextStyle? textStyle,
    Color? foregroundColor,
  }) {
    return WatchButtonTheme(
      textStyle: textStyle ?? this.textStyle,
      foregroundColor: foregroundColor ?? this.foregroundColor,
    );
  }

  @override
  WatchButtonTheme lerp(
    covariant ThemeExtension<WatchButtonTheme>? other,
    double t,
  ) {
    if (other is! WatchButtonTheme) {
      return this;
    }

    return WatchButtonTheme(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
    );
  }
}
