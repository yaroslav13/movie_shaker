import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class ScoreArcTheme extends ThemeExtension<ScoreArcTheme> {
  const ScoreArcTheme({
    required this.trackColor,
    required this.strokeWidth,
    required this.valueColors,
    required this.labelStyle,
  });

  final Color? trackColor;
  final double? strokeWidth;
  final List<Color>? valueColors;
  final TextStyle? labelStyle;

  @override
  ScoreArcTheme copyWith({
    Color? trackColor,
    double? strokeWidth,
    List<Color>? valueColors,
    TextStyle? labelStyle,
  }) {
    return ScoreArcTheme(
      trackColor: trackColor ?? this.trackColor,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      valueColors: valueColors ?? this.valueColors,
      labelStyle: labelStyle ?? this.labelStyle,
    );
  }

  @override
  ScoreArcTheme lerp(
    covariant ThemeExtension<ScoreArcTheme>? other,
    double t,
  ) {
    if (other is! ScoreArcTheme) {
      return this;
    }

    return ScoreArcTheme(
      trackColor: Color.lerp(trackColor, other.trackColor, t),
      strokeWidth: lerpDouble(strokeWidth, other.strokeWidth, t),
      valueColors: t < 0.5 ? valueColors : other.valueColors,
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t),
    );
  }
}
