import 'package:flutter/material.dart';

@immutable
final class CarouselDotsIndicatorTheme
    extends ThemeExtension<CarouselDotsIndicatorTheme> {
  const CarouselDotsIndicatorTheme({
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
  });

  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;

  @override
  CarouselDotsIndicatorTheme copyWith({
    Color? backgroundColor,
    Color? activeColor,
    Color? inactiveColor,
  }) {
    return CarouselDotsIndicatorTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
    );
  }

  @override
  CarouselDotsIndicatorTheme lerp(
    covariant ThemeExtension<CarouselDotsIndicatorTheme>? other,
    double t,
  ) {
    if (other is! CarouselDotsIndicatorTheme) {
      return this;
    }

    return CarouselDotsIndicatorTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      activeColor: Color.lerp(activeColor, other.activeColor, t),
      inactiveColor: Color.lerp(inactiveColor, other.inactiveColor, t),
    );
  }
}
