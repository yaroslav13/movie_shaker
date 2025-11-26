import 'package:flutter/material.dart';
import 'package:theme/src/extensions/carousel_dots_indicator_theme.dart';

@immutable
final class MovieCarouselTheme extends ThemeExtension<MovieCarouselTheme> {
  const MovieCarouselTheme({
    this.dotsIndicatorTheme,
  });

  final CarouselDotsIndicatorTheme? dotsIndicatorTheme;

  @override
  MovieCarouselTheme copyWith({
    CarouselDotsIndicatorTheme? dotsIndicatorTheme,
  }) {
    return MovieCarouselTheme(
      dotsIndicatorTheme: dotsIndicatorTheme ?? this.dotsIndicatorTheme,
    );
  }

  @override
  MovieCarouselTheme lerp(
    covariant ThemeExtension<MovieCarouselTheme>? other,
    double t,
  ) {
    if (other is! MovieCarouselTheme) {
      return this;
    }

    return MovieCarouselTheme(
      dotsIndicatorTheme: dotsIndicatorTheme?.lerp(
        other.dotsIndicatorTheme,
        t,
      ),
    );
  }
}
