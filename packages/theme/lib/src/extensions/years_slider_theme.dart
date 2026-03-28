import 'package:flutter/material.dart';

@immutable
final class YearsSliderTheme extends ThemeExtension<YearsSliderTheme> {
  const YearsSliderTheme({
    this.activeColor,
    this.inactiveColor,
    this.headlineStyle,
    this.valuesStyle,
  });

  final Color? activeColor;
  final Color? inactiveColor;
  final TextStyle? headlineStyle;
  final TextStyle? valuesStyle;

  @override
  YearsSliderTheme copyWith({
    Color? activeColor,
    Color? inactiveColor,
    TextStyle? headlineStyle,
    TextStyle? valuesStyle,
  }) {
    return YearsSliderTheme(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      headlineStyle: headlineStyle ?? this.headlineStyle,
      valuesStyle: valuesStyle ?? this.valuesStyle,
    );
  }

  @override
  YearsSliderTheme lerp(
    covariant ThemeExtension<YearsSliderTheme>? other,
    double t,
  ) {
    if (other is! YearsSliderTheme) {
      return this;
    }

    return YearsSliderTheme(
      activeColor: Color.lerp(activeColor, other.activeColor, t),
      inactiveColor: Color.lerp(inactiveColor, other.inactiveColor, t),
      headlineStyle: TextStyle.lerp(headlineStyle, other.headlineStyle, t),
      valuesStyle: TextStyle.lerp(valuesStyle, other.valuesStyle, t),
    );
  }
}
