import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class ProgressIndicatorTheme
    extends ThemeExtension<ProgressIndicatorTheme> {
  const ProgressIndicatorTheme({this.color, this.dotSize, this.spacing});

  final Color? color;
  final double? dotSize;
  final double? spacing;

  @override
  ProgressIndicatorTheme copyWith({
    Color? color,
    double? dotSize,
    double? spacing,
  }) {
    return ProgressIndicatorTheme(
      color: color ?? this.color,
      dotSize: dotSize ?? this.dotSize,
      spacing: spacing ?? this.spacing,
    );
  }

  @override
  ThemeExtension<ProgressIndicatorTheme> lerp(
    covariant ThemeExtension<ProgressIndicatorTheme>? other,
    double t,
  ) {
    if (other is! ProgressIndicatorTheme) {
      return this;
    }

    return ProgressIndicatorTheme(
      color: Color.lerp(color, other.color, t),
      dotSize: lerpDouble(dotSize, other.dotSize, t),
      spacing: lerpDouble(spacing, other.spacing, t),
    );
  }
}
