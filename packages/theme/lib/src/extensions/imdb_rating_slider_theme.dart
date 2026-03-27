import 'package:flutter/material.dart';

@immutable
final class ImdbRatingSliderTheme
    extends ThemeExtension<ImdbRatingSliderTheme> {
  const ImdbRatingSliderTheme({
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
  ImdbRatingSliderTheme copyWith({
    Color? activeColor,
    Color? inactiveColor,
    TextStyle? headlineStyle,
    TextStyle? valuesStyle,
  }) {
    return ImdbRatingSliderTheme(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      headlineStyle: headlineStyle ?? this.headlineStyle,
      valuesStyle: valuesStyle ?? this.valuesStyle,
    );
  }

  @override
  ImdbRatingSliderTheme lerp(
    covariant ThemeExtension<ImdbRatingSliderTheme>? other,
    double t,
  ) {
    if (other is! ImdbRatingSliderTheme) {
      return this;
    }

    return ImdbRatingSliderTheme(
      activeColor: Color.lerp(activeColor, other.activeColor, t),
      inactiveColor: Color.lerp(inactiveColor, other.inactiveColor, t),
      headlineStyle: TextStyle.lerp(headlineStyle, other.headlineStyle, t),
      valuesStyle: TextStyle.lerp(valuesStyle, other.valuesStyle, t),
    );
  }
}
