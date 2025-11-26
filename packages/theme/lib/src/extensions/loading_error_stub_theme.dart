import 'package:flutter/material.dart';

@immutable
final class LoadingErrorStubTheme
    extends ThemeExtension<LoadingErrorStubTheme> {
  const LoadingErrorStubTheme({
    this.textStyle,
  });

  final TextStyle? textStyle;

  @override
  LoadingErrorStubTheme copyWith({
    TextStyle? textStyle,
  }) {
    return LoadingErrorStubTheme(
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  LoadingErrorStubTheme lerp(
    covariant ThemeExtension<LoadingErrorStubTheme>? other,
    double t,
  ) {
    if (other is! LoadingErrorStubTheme) {
      return this;
    }

    return LoadingErrorStubTheme(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
    );
  }
}
