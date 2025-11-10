import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class DotsProgressIndicatorTheme
    extends ThemeExtension<DotsProgressIndicatorTheme> {
  const DotsProgressIndicatorTheme({this.color, this.dotSize, this.spacing});

  final Color? color;
  final double? dotSize;
  final double? spacing;

  @override
  DotsProgressIndicatorTheme copyWith({
    Color? color,
    double? dotSize,
    double? spacing,
  }) {
    return DotsProgressIndicatorTheme(
      color: color ?? this.color,
      dotSize: dotSize ?? this.dotSize,
      spacing: spacing ?? this.spacing,
    );
  }

  @override
  DotsProgressIndicatorTheme lerp(
    covariant ThemeExtension<DotsProgressIndicatorTheme>? other,
    double t,
  ) {
    if (other is! DotsProgressIndicatorTheme) {
      return this;
    }

    return DotsProgressIndicatorTheme(
      color: Color.lerp(color, other.color, t),
      dotSize: lerpDouble(dotSize, other.dotSize, t),
      spacing: lerpDouble(spacing, other.spacing, t),
    );
  }
}
