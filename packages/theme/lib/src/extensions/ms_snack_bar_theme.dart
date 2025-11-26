import 'dart:ui';

import 'package:flutter/material.dart';

enum MsSnackBarVariant { info, success, warning, error }

@immutable
final class MsSnackBarTheme extends ThemeExtension<MsSnackBarTheme> {
  const MsSnackBarTheme({
    this.textStyle,
    this.padding,
    this.elevation,
    this.shape,
    this.duration,
    this.variantStyles = const {},
  });

  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final ShapeBorder? shape;
  final Duration? duration;
  final Map<MsSnackBarVariant, MsSnackBarVariantStyle> variantStyles;

  @override
  MsSnackBarTheme copyWith({
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    double? elevation,
    ShapeBorder? shape,
    Duration? duration,
    Map<MsSnackBarVariant, MsSnackBarVariantStyle>? variantStyles,
  }) {
    return MsSnackBarTheme(
      textStyle: textStyle ?? this.textStyle,
      padding: padding ?? this.padding,
      elevation: elevation ?? this.elevation,
      shape: shape ?? this.shape,
      duration: duration ?? this.duration,
      variantStyles: variantStyles ?? this.variantStyles,
    );
  }

  @override
  MsSnackBarTheme lerp(
    covariant ThemeExtension<MsSnackBarTheme>? other,
    double t,
  ) {
    if (other is! MsSnackBarTheme) {
      return this;
    }

    final variantKeys = <MsSnackBarVariant>{
      ...variantStyles.keys,
      ...other.variantStyles.keys,
    };

    final lerpVariants = <MsSnackBarVariant, MsSnackBarVariantStyle>{};
    for (final key in variantKeys) {
      final variant = MsSnackBarVariantStyle.lerp(
        variantStyles[key],
        other.variantStyles[key],
        t,
      );
      if (variant != null) {
        lerpVariants[key] = variant;
      }
    }

    return MsSnackBarTheme(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
      padding: t < 0.5 ? padding : other.padding,
      elevation: lerpDouble(elevation, other.elevation, t),
      shape: ShapeBorder.lerp(shape, other.shape, t),
      duration: t < 0.5 ? duration : other.duration,
      variantStyles: lerpVariants,
    );
  }
}

@immutable
final class MsSnackBarVariantStyle {
  const MsSnackBarVariantStyle({
    this.backgroundColor,
    this.foregroundColor,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;

  static MsSnackBarVariantStyle? lerp(
    MsSnackBarVariantStyle? a,
    MsSnackBarVariantStyle? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return MsSnackBarVariantStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
    );
  }

  MsSnackBarVariantStyle copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    return MsSnackBarVariantStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
    );
  }
}
