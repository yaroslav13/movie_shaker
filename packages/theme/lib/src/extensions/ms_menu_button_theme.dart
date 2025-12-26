import 'package:flutter/material.dart';

@immutable
final class MsMenuButtonTheme extends ThemeExtension<MsMenuButtonTheme> {
  const MsMenuButtonTheme({
    this.textStyle,
    this.foregroundColor,
  });

  final TextStyle? textStyle;
  final Color? foregroundColor;

  @override
  MsMenuButtonTheme copyWith({
    TextStyle? textStyle,
    Color? foregroundColor,
  }) {
    return MsMenuButtonTheme(
      textStyle: textStyle ?? this.textStyle,
      foregroundColor: foregroundColor ?? this.foregroundColor,
    );
  }

  @override
  MsMenuButtonTheme lerp(
    covariant ThemeExtension<MsMenuButtonTheme>? other,
    double t,
  ) {
    if (other is! MsMenuButtonTheme) {
      return this;
    }

    return MsMenuButtonTheme(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
    );
  }
}
