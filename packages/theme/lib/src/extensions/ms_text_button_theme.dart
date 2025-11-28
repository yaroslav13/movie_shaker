import 'package:flutter/material.dart';

@immutable
final class MsTextButtonTheme extends ThemeExtension<MsTextButtonTheme> {
  const MsTextButtonTheme({
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.padding,
    this.textStyle,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  @override
  MsTextButtonTheme copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
  }) => MsTextButtonTheme(
    backgroundColor: backgroundColor ?? this.backgroundColor,
    foregroundColor: foregroundColor ?? this.foregroundColor,
    borderRadius: borderRadius ?? this.borderRadius,
    padding: padding ?? this.padding,
    textStyle: textStyle ?? this.textStyle,
  );

  @override
  MsTextButtonTheme lerp(
    covariant ThemeExtension<MsTextButtonTheme>? other,
    double t,
  ) {
    if (other is! MsTextButtonTheme) {
      return this;
    }

    return MsTextButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t),
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
    );
  }
}
