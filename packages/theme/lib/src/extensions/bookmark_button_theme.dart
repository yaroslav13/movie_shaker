import 'package:flutter/material.dart';

@immutable
final class BookmarkButtonTheme extends ThemeExtension<BookmarkButtonTheme> {
  const BookmarkButtonTheme({
    this.foregroundColor,
    this.backgroundColor,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  BookmarkButtonTheme copyWith({
    Color? foregroundColor,
    Color? backgroundColor,
  }) {
    return BookmarkButtonTheme(
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  BookmarkButtonTheme lerp(
    covariant ThemeExtension<BookmarkButtonTheme>? other,
    double t,
  ) {
    if (other is! BookmarkButtonTheme) {
      return this;
    }

    return BookmarkButtonTheme(
      foregroundColor: Color.lerp(
        foregroundColor,
        other.foregroundColor,
        t,
      ),
      backgroundColor: Color.lerp(
        backgroundColor,
        other.backgroundColor,
        t,
      ),
    );
  }
}
