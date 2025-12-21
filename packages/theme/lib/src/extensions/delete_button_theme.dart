import 'package:flutter/material.dart';

@immutable
final class DeleteButtonTheme extends ThemeExtension<DeleteButtonTheme> {
  const DeleteButtonTheme({
    this.foregroundColor,
    this.backgroundColor,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  DeleteButtonTheme copyWith({
    Color? foregroundColor,
    Color? backgroundColor,
  }) {
    return DeleteButtonTheme(
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  DeleteButtonTheme lerp(
    covariant ThemeExtension<DeleteButtonTheme>? other,
    double t,
  ) {
    if (other is! DeleteButtonTheme) {
      return this;
    }

    return DeleteButtonTheme(
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
