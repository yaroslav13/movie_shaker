import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_components/src/utils/int_lerp.dart';

@immutable
final class StaggeredGridViewTheme
    extends ThemeExtension<StaggeredGridViewTheme> {
  const StaggeredGridViewTheme({
    this.crossAxisCount,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.padding,
  });

  final int? crossAxisCount;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;

  final EdgeInsetsGeometry? padding;

  @override
  StaggeredGridViewTheme copyWith({
    int? crossAxisCount,
    double? crossAxisSpacing,
    double? mainAxisSpacing,
    EdgeInsetsGeometry? padding,
  }) {
    return StaggeredGridViewTheme(
      crossAxisCount: crossAxisCount ?? this.crossAxisCount,
      crossAxisSpacing: crossAxisSpacing ?? this.crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing ?? this.mainAxisSpacing,
      padding: padding ?? this.padding,
    );
  }

  @override
  ThemeExtension<StaggeredGridViewTheme> lerp(
    covariant ThemeExtension<StaggeredGridViewTheme>? other,
    double t,
  ) {
    if (other is! StaggeredGridViewTheme) {
      return this;
    }

    return StaggeredGridViewTheme(
      crossAxisCount: lerpInt(crossAxisCount, other.crossAxisCount, t),
      crossAxisSpacing: lerpDouble(crossAxisSpacing, other.crossAxisSpacing, t),
      mainAxisSpacing: lerpDouble(mainAxisSpacing, other.mainAxisSpacing, t),
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t),
    );
  }
}
