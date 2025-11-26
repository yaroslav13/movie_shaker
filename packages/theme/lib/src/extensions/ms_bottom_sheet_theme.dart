import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

@immutable
final class MsBottomSheetTheme extends ThemeExtension<MsBottomSheetTheme> {
  const MsBottomSheetTheme({
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.showDragHandle,
    this.constraints,
  });

  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final bool? showDragHandle;
  final BoxConstraints? constraints;

  @override
  MsBottomSheetTheme copyWith({
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    bool? showDragHandle,
    BoxConstraints? constraints,
  }) {
    return MsBottomSheetTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      shape: shape ?? this.shape,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      showDragHandle: showDragHandle ?? this.showDragHandle,
      constraints: constraints ?? this.constraints,
    );
  }

  @override
  MsBottomSheetTheme lerp(
    ThemeExtension<MsBottomSheetTheme>? other,
    double t,
  ) {
    if (other is! MsBottomSheetTheme) {
      return this;
    }

    return MsBottomSheetTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      elevation: lerpDouble(elevation, other.elevation, t),
      shape: ShapeBorder.lerp(shape, other.shape, t),
      clipBehavior: t < 0.5 ? clipBehavior : other.clipBehavior,
      showDragHandle: t < 0.5 ? showDragHandle : other.showDragHandle,
      constraints: BoxConstraints.lerp(constraints, other.constraints, t),
    );
  }
}
