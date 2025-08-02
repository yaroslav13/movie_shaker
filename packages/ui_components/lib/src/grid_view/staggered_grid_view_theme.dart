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
    this.largeTextStyle,
    this.smallTextStyle,
  });

  final int? crossAxisCount;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;

  // Has effect only on paginated grid view
  final TextStyle? largeTextStyle;
  final TextStyle? smallTextStyle;

  final EdgeInsetsGeometry? padding;

  @override
  StaggeredGridViewTheme copyWith({
    int? crossAxisCount,
    double? crossAxisSpacing,
    double? mainAxisSpacing,
    EdgeInsetsGeometry? padding,
    TextStyle? largeTextStyle,
    TextStyle? smallTextStyle,
  }) {
    return StaggeredGridViewTheme(
      crossAxisCount: crossAxisCount ?? this.crossAxisCount,
      crossAxisSpacing: crossAxisSpacing ?? this.crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing ?? this.mainAxisSpacing,
      padding: padding ?? this.padding,
      largeTextStyle: largeTextStyle ?? this.largeTextStyle,
      smallTextStyle: smallTextStyle ?? this.smallTextStyle,
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
      largeTextStyle: TextStyle.lerp(largeTextStyle, other.largeTextStyle, t),
      smallTextStyle: TextStyle.lerp(smallTextStyle, other.smallTextStyle, t),
    );
  }
}
