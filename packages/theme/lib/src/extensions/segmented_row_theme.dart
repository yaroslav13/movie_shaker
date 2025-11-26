import 'package:flutter/material.dart';
import 'package:theme/src/extensions/segmented_row_entry_theme.dart';

@immutable
final class SegmentedRowTheme extends ThemeExtension<SegmentedRowTheme> {
  const SegmentedRowTheme({
    this.dividerTheme,
    this.segmentTheme,
  });

  final SegmentedRowEntryTheme? segmentTheme;
  final DividerThemeData? dividerTheme;

  @override
  SegmentedRowTheme copyWith({
    SegmentedRowEntryTheme? segmentTheme,
    DividerThemeData? dividerTheme,
  }) {
    return SegmentedRowTheme(
      segmentTheme: segmentTheme ?? this.segmentTheme,
      dividerTheme: dividerTheme ?? this.dividerTheme,
    );
  }

  @override
  SegmentedRowTheme lerp(
    covariant ThemeExtension<SegmentedRowTheme>? other,
    double t,
  ) {
    if (other is! SegmentedRowTheme) {
      return this;
    }

    return SegmentedRowTheme(
      segmentTheme: segmentTheme?.lerp(other.segmentTheme, t),
      dividerTheme: DividerThemeData.lerp(dividerTheme, other.dividerTheme, t),
    );
  }
}
