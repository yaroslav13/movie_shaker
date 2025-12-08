import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
final class ContributorCardTheme extends ThemeExtension<ContributorCardTheme> {
  const ContributorCardTheme({
    this.nameTextStyle,
    this.characterTextStyle,
    this.captionBackgroundColor,
    this.captionForegroundColor,
    this.borderRadius,
    this.elevation,
  });

  final TextStyle? nameTextStyle;
  final TextStyle? characterTextStyle;

  final Color? captionBackgroundColor;
  final Color? captionForegroundColor;

  final BorderRadiusGeometry? borderRadius;
  final double? elevation;

  @override
  ContributorCardTheme copyWith({
    TextStyle? nameTextStyle,
    TextStyle? characterTextStyle,
    Color? captionBackgroundColor,
    Color? captionForegroundColor,
    BorderRadiusGeometry? borderRadius,
    double? elevation,
  }) {
    return ContributorCardTheme(
      nameTextStyle: nameTextStyle ?? this.nameTextStyle,
      characterTextStyle: characterTextStyle ?? this.characterTextStyle,
      captionBackgroundColor:
          captionBackgroundColor ?? this.captionBackgroundColor,
      captionForegroundColor:
          captionForegroundColor ?? this.captionForegroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
    );
  }

  @override
  ContributorCardTheme lerp(
    covariant ThemeExtension<ContributorCardTheme>? other,
    double t,
  ) {
    if (other is! ContributorCardTheme) {
      return this;
    }

    return ContributorCardTheme(
      nameTextStyle: TextStyle.lerp(nameTextStyle, other.nameTextStyle, t),
      characterTextStyle: TextStyle.lerp(
        characterTextStyle,
        other.characterTextStyle,
        t,
      ),
      captionBackgroundColor: Color.lerp(
        captionBackgroundColor,
        other.captionBackgroundColor,
        t,
      ),
      captionForegroundColor: Color.lerp(
        captionForegroundColor,
        other.captionForegroundColor,
        t,
      ),
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
      elevation: lerpDouble(elevation, other.elevation, t),
    );
  }
}
