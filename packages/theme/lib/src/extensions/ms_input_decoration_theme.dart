import 'package:flutter/material.dart';

@immutable
final class MsInputDecorationTheme
    extends ThemeExtension<MsInputDecorationTheme> {
  const MsInputDecorationTheme({
    this.fillColor,
    this.filled,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.borderRadius,
    this.contentPadding,
    this.border,
    this.disabledBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
  });

  final Color? fillColor;
  final bool? filled;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? border;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;

  @override
  MsInputDecorationTheme copyWith({
    Color? fillColor,
    bool? filled,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    TextStyle? errorStyle,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? contentPadding,
    InputBorder? border,
    InputBorder? disabledBorder,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
  }) {
    return MsInputDecorationTheme(
      fillColor: fillColor ?? this.fillColor,
      filled: filled ?? this.filled,
      hintStyle: hintStyle ?? this.hintStyle,
      labelStyle: labelStyle ?? this.labelStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      contentPadding: contentPadding ?? this.contentPadding,
      border: border ?? this.border,
      disabledBorder: disabledBorder ?? this.disabledBorder,
      enabledBorder: enabledBorder ?? this.enabledBorder,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      errorBorder: errorBorder ?? this.errorBorder,
      focusedErrorBorder: focusedErrorBorder ?? this.focusedErrorBorder,
    );
  }

  @override
  MsInputDecorationTheme lerp(
    covariant ThemeExtension<MsInputDecorationTheme>? other,
    double t,
  ) {
    if (other is! MsInputDecorationTheme) {
      return this;
    }

    return MsInputDecorationTheme(
      fillColor: Color.lerp(fillColor, other.fillColor, t),
      filled: filled,
      hintStyle: TextStyle.lerp(hintStyle, other.hintStyle, t),
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t),
      errorStyle: TextStyle.lerp(errorStyle, other.errorStyle, t),
      borderRadius: BorderRadiusGeometry.lerp(
        borderRadius,
        other.borderRadius,
        t,
      ),
      contentPadding: EdgeInsetsGeometry.lerp(
        contentPadding,
        other.contentPadding,
        t,
      ),
      border: ShapeBorder.lerp(border, other.border, t) as InputBorder?,
      disabledBorder:
          ShapeBorder.lerp(disabledBorder, other.disabledBorder, t)
              as InputBorder?,
      enabledBorder:
          ShapeBorder.lerp(enabledBorder, other.enabledBorder, t)
              as InputBorder?,
      focusedBorder:
          ShapeBorder.lerp(focusedBorder, other.focusedBorder, t)
              as InputBorder?,
      errorBorder:
          ShapeBorder.lerp(errorBorder, other.errorBorder, t) as InputBorder?,
      focusedErrorBorder:
          ShapeBorder.lerp(focusedErrorBorder, other.focusedErrorBorder, t)
              as InputBorder?,
    );
  }
}
