import 'dart:ui';

import 'package:flutter/material.dart';

final class MsAppBarTheme extends ThemeExtension<MsAppBarTheme> {
  MsAppBarTheme({
    this.backgroundColor,
    this.elevation,
    this.titleTextStyle,
    this.iconTheme,
    this.centerTitle,
  });

  final Color? backgroundColor;
  final double? elevation;
  final TextStyle? titleTextStyle;
  final IconThemeData? iconTheme;
  final bool? centerTitle;

  @override
  ThemeExtension<MsAppBarTheme> copyWith({
    Color? backgroundColor,
    double? elevation,
    TextStyle? titleTextStyle,
    IconThemeData? iconTheme,
    bool? centerTitle,
  }) {
    return MsAppBarTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      iconTheme: iconTheme ?? this.iconTheme,
      centerTitle: centerTitle ?? this.centerTitle,
    );
  }

  @override
  MsAppBarTheme lerp(
    covariant ThemeExtension<MsAppBarTheme>? other,
    double t,
  ) {
    if (other is! MsAppBarTheme) {
      return this;
    }

    return MsAppBarTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      elevation: lerpDouble(elevation, other.elevation, t),
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t),
      iconTheme: IconThemeData.lerp(iconTheme, other.iconTheme, t),
      centerTitle: t < 0.5 ? centerTitle : other.centerTitle,
    );
  }
}
