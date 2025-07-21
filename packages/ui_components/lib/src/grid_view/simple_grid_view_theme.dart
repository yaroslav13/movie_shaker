import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_components/src/utils/int_lerp.dart';

@immutable
final class SimpleGridViewTheme extends ThemeExtension<SimpleGridViewTheme> {
  const SimpleGridViewTheme({
    this.crossAxisCount,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.childAspectRatio,
    this.mainAxisExtent,
    this.padding,
  });

  final int? crossAxisCount;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  final double? childAspectRatio;
  final double? mainAxisExtent;

  final EdgeInsetsGeometry? padding;

  @override
  SimpleGridViewTheme copyWith({
    int? crossAxisCount,
    double? crossAxisSpacing,
    double? mainAxisSpacing,
    double? childAspectRatio,
    double? mainAxisExtent,
    EdgeInsetsGeometry? padding,
  }) {
    return SimpleGridViewTheme(
      crossAxisCount: crossAxisCount ?? this.crossAxisCount,
      crossAxisSpacing: crossAxisSpacing ?? this.crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing ?? this.mainAxisSpacing,
      childAspectRatio: childAspectRatio ?? this.childAspectRatio,
      mainAxisExtent: mainAxisExtent ?? this.mainAxisExtent,
      padding: padding ?? this.padding,
    );
  }

  @override
  ThemeExtension<SimpleGridViewTheme> lerp(
    covariant ThemeExtension<SimpleGridViewTheme>? other,
    double t,
  ) {
    if (other is! SimpleGridViewTheme) {
      return this;
    }

    return SimpleGridViewTheme(
      crossAxisCount: lerpInt(crossAxisCount, other.crossAxisCount, t),
      crossAxisSpacing: lerpDouble(crossAxisSpacing, other.crossAxisSpacing, t),
      mainAxisSpacing: lerpDouble(mainAxisSpacing, other.mainAxisSpacing, t),
      childAspectRatio: lerpDouble(childAspectRatio, other.childAspectRatio, t),
      mainAxisExtent: lerpDouble(mainAxisExtent, other.mainAxisExtent, t),
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t),
    );
  }
}
