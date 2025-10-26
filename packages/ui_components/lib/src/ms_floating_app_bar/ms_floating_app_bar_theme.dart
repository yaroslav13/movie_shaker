import 'dart:ui';

import 'package:flutter/material.dart';

final class MsFloatingAppBarTheme
    extends ThemeExtension<MsFloatingAppBarTheme> {
  MsFloatingAppBarTheme({
    this.backgroundColor,
    this.elevation,
    this.titleTextStyle,
    this.iconTheme,
    this.centerTitle,
    this.expandedHeight,
    this.toolbarHeight,
  });

  final Color? backgroundColor;
  final double? elevation;
  final TextStyle? titleTextStyle;
  final IconThemeData? iconTheme;
  final bool? centerTitle;

  final double? expandedHeight;
  final double? toolbarHeight;

  @override
  ThemeExtension<MsFloatingAppBarTheme> copyWith({
    Color? backgroundColor,
    double? elevation,
    TextStyle? titleTextStyle,
    IconThemeData? iconTheme,
    bool? centerTitle,
    double? expandedHeight,
    double? toolbarHeight,
  }) {
    return MsFloatingAppBarTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      iconTheme: iconTheme ?? this.iconTheme,
      centerTitle: centerTitle ?? this.centerTitle,
      expandedHeight: expandedHeight ?? this.expandedHeight,
      toolbarHeight: toolbarHeight ?? this.toolbarHeight,
    );
  }

  @override
  ThemeExtension<MsFloatingAppBarTheme> lerp(
    covariant ThemeExtension<MsFloatingAppBarTheme>? other,
    double t,
  ) {
    if (other is! MsFloatingAppBarTheme) {
      return this;
    }

    return MsFloatingAppBarTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      elevation: lerpDouble(elevation, other.elevation, t),
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t),
      iconTheme: IconThemeData.lerp(iconTheme, other.iconTheme, t),
      centerTitle: t < 0.5 ? centerTitle : other.centerTitle,
      expandedHeight: lerpDouble(expandedHeight, other.expandedHeight, t),
      toolbarHeight: lerpDouble(toolbarHeight, other.toolbarHeight, t),
    );
  }
}
