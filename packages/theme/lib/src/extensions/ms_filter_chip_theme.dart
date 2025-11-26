import 'package:flutter/material.dart';

@immutable
final class MsFilterChipTheme extends ThemeExtension<MsFilterChipTheme> {
  const MsFilterChipTheme({
    this.backgroundColor,
    this.foregroundColor,
    this.selectedBackgroundColor,
    this.selectedForegroundColor,
    this.borderRadius,
    this.padding,
    this.labelStyle,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? selectedBackgroundColor;
  final Color? selectedForegroundColor;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? labelStyle;

  @override
  MsFilterChipTheme copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? selectedBackgroundColor,
    Color? selectedForegroundColor,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    TextStyle? labelStyle,
  }) {
    return MsFilterChipTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      selectedBackgroundColor:
          selectedBackgroundColor ?? this.selectedBackgroundColor,
      selectedForegroundColor:
          selectedForegroundColor ?? this.selectedForegroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      labelStyle: labelStyle ?? this.labelStyle,
    );
  }

  @override
  MsFilterChipTheme lerp(
    covariant ThemeExtension<MsFilterChipTheme>? other,
    double t,
  ) {
    if (other is! MsFilterChipTheme) {
      return this;
    }

    return MsFilterChipTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      selectedBackgroundColor: Color.lerp(
        selectedBackgroundColor,
        other.selectedBackgroundColor,
        t,
      ),
      selectedForegroundColor: Color.lerp(
        selectedForegroundColor,
        other.selectedForegroundColor,
        t,
      ),
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t),
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t),
    );
  }
}
