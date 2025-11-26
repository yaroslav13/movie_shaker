import 'package:flutter/material.dart';

@immutable
final class MsBottomBarTheme extends ThemeExtension<MsBottomBarTheme> {
  const MsBottomBarTheme({
    this.selectedItemColor,
    this.unselectedItemColor,
    this.itemPadding,
    this.margin,
  });

  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final EdgeInsets? itemPadding;
  final EdgeInsets? margin;

  @override
  MsBottomBarTheme copyWith({
    Color? selectedItemColor,
    Color? unselectedItemColor,
    EdgeInsets? itemPadding,
    EdgeInsets? margin,
  }) {
    return MsBottomBarTheme(
      selectedItemColor: selectedItemColor ?? this.selectedItemColor,
      unselectedItemColor: unselectedItemColor ?? this.unselectedItemColor,
      itemPadding: itemPadding ?? this.itemPadding,
      margin: margin ?? this.margin,
    );
  }

  @override
  MsBottomBarTheme lerp(
    covariant ThemeExtension<MsBottomBarTheme>? other,
    double t,
  ) {
    if (other is! MsBottomBarTheme) {
      return this;
    }

    return MsBottomBarTheme(
      selectedItemColor: Color.lerp(
        selectedItemColor,
        other.selectedItemColor,
        t,
      ),
      unselectedItemColor: Color.lerp(
        unselectedItemColor,
        other.unselectedItemColor,
        t,
      ),
      itemPadding: EdgeInsets.lerp(
        itemPadding,
        other.itemPadding,
        t,
      ),
      margin: EdgeInsets.lerp(
        margin,
        other.margin,
        t,
      ),
    );
  }
}
