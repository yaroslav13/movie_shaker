import 'package:flutter/material.dart';

@immutable
final class SegmentedRowEntryTheme
    extends ThemeExtension<SegmentedRowEntryTheme> {
  const SegmentedRowEntryTheme({
    this.labelStyle,
    this.captionStyle,
    this.contentPadding,
  });

  final TextStyle? labelStyle;
  final TextStyle? captionStyle;
  final EdgeInsetsGeometry? contentPadding;

  @override
  SegmentedRowEntryTheme copyWith({
    TextStyle? labelStyle,
    TextStyle? captionStyle,
    EdgeInsetsGeometry? contentPadding,
  }) {
    return SegmentedRowEntryTheme(
      labelStyle: labelStyle ?? this.labelStyle,
      captionStyle: captionStyle ?? this.captionStyle,
      contentPadding: contentPadding ?? this.contentPadding,
    );
  }

  @override
  SegmentedRowEntryTheme lerp(
    covariant ThemeExtension<SegmentedRowEntryTheme>? other,
    double t,
  ) {
    if (other is! SegmentedRowEntryTheme) {
      return this;
    }

    return SegmentedRowEntryTheme(
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t),
      captionStyle: TextStyle.lerp(captionStyle, other.captionStyle, t),
      contentPadding: EdgeInsetsGeometry.lerp(
        contentPadding,
        other.contentPadding,
        t,
      ),
    );
  }
}
