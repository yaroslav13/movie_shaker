import 'package:flutter/material.dart';

@immutable
final class MsListTileTheme extends ThemeExtension<MsListTileTheme> {
  const MsListTileTheme({
    this.backgroundColor,
    this.padding,
    this.borderRadius,
    this.titleStyle,
    this.subtitleStyle,
  });

  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  MsListTileTheme copyWith({
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
  }) {
    return MsListTileTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
    );
  }

  @override
  MsListTileTheme lerp(
    covariant ThemeExtension<MsListTileTheme>? other,
    double t,
  ) {
    if (other is! MsListTileTheme) {
      return this;
    }

    return MsListTileTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t),
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t),
      subtitleStyle: TextStyle.lerp(subtitleStyle, other.subtitleStyle, t),
    );
  }
}
