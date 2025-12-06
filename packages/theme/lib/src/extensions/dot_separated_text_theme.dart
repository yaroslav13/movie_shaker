import 'package:flutter/material.dart';

final class DotSeparatedTextTheme
    extends ThemeExtension<DotSeparatedTextTheme> {
  const DotSeparatedTextTheme({
    required this.textStyle,
    required this.dotColor,
  });

  final TextStyle? textStyle;
  final Color? dotColor;

  @override
  ThemeExtension<DotSeparatedTextTheme> copyWith({
    TextStyle? textStyle,
    Color? dotColor,
  }) {
    return DotSeparatedTextTheme(
      textStyle: textStyle ?? this.textStyle,
      dotColor: dotColor ?? this.dotColor,
    );
  }

  @override
  ThemeExtension<DotSeparatedTextTheme> lerp(
    covariant ThemeExtension<DotSeparatedTextTheme>? other,
    double t,
  ) {
    if (other is! DotSeparatedTextTheme) return this;

    return DotSeparatedTextTheme(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
      dotColor: Color.lerp(dotColor, other.dotColor, t),
    );
  }
}
