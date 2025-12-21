import 'package:flutter/material.dart';

@immutable
final class LikeButtonTheme extends ThemeExtension<LikeButtonTheme> {
  const LikeButtonTheme({
    this.likedColor,
    this.unlikedColor,
    this.backgroundColor,
    this.padding,
  });

  final Color? likedColor;
  final Color? unlikedColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  LikeButtonTheme copyWith({
    Color? likedColor,
    Color? unlikedColor,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
  }) {
    return LikeButtonTheme(
      likedColor: likedColor ?? this.likedColor,
      unlikedColor: unlikedColor ?? this.unlikedColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
    );
  }

  @override
  LikeButtonTheme lerp(
    covariant ThemeExtension<LikeButtonTheme>? other,
    double t,
  ) {
    if (other is! LikeButtonTheme) {
      return this;
    }

    return LikeButtonTheme(
      likedColor: Color.lerp(
        likedColor,
        other.likedColor,
        t,
      ),
      unlikedColor: Color.lerp(
        unlikedColor,
        other.unlikedColor,
        t,
      ),
      backgroundColor: Color.lerp(
        backgroundColor,
        other.backgroundColor,
        t,
      ),
      padding: EdgeInsetsGeometry.lerp(
        padding,
        other.padding,
        t,
      ),
    );
  }
}
