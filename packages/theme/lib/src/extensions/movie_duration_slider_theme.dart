import 'package:flutter/material.dart';

@immutable
final class MovieDurationSliderTheme
    extends ThemeExtension<MovieDurationSliderTheme> {
  const MovieDurationSliderTheme({
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
  MovieDurationSliderTheme copyWith({
    Color? activeColor,
    Color? inactiveColor,
    TextStyle? headlineStyle,
    TextStyle? valuesStyle,
  }) {
    return MovieDurationSliderTheme(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      headlineStyle: headlineStyle ?? this.headlineStyle,
      valuesStyle: valuesStyle ?? this.valuesStyle,
    );
  }

  @override
  MovieDurationSliderTheme lerp(
    covariant ThemeExtension<MovieDurationSliderTheme>? other,
    double t,
  ) {
    if (other is! MovieDurationSliderTheme) {
      return this;
    }

    return MovieDurationSliderTheme(
      activeColor: Color.lerp(activeColor, other.activeColor, t),
      inactiveColor: Color.lerp(inactiveColor, other.inactiveColor, t),
      headlineStyle: TextStyle.lerp(headlineStyle, other.headlineStyle, t),
      valuesStyle: TextStyle.lerp(valuesStyle, other.valuesStyle, t),
    );
  }
}
