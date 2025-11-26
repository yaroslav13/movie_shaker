import 'package:flutter/material.dart';

@immutable
final class NoItemsStubTheme extends ThemeExtension<NoItemsStubTheme> {
  const NoItemsStubTheme({
    this.descriptionStyle,
    this.captionStyle,
  });

  final TextStyle? descriptionStyle;
  final TextStyle? captionStyle;

  @override
  NoItemsStubTheme copyWith({
    TextStyle? descriptionStyle,
    TextStyle? captionStyle,
  }) {
    return NoItemsStubTheme(
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      captionStyle: captionStyle ?? this.captionStyle,
    );
  }

  @override
  NoItemsStubTheme lerp(
    covariant ThemeExtension<NoItemsStubTheme>? other,
    double t,
  ) {
    if (other is! NoItemsStubTheme) {
      return this;
    }

    return NoItemsStubTheme(
      descriptionStyle: TextStyle.lerp(
        descriptionStyle,
        other.descriptionStyle,
        t,
      ),
      captionStyle: TextStyle.lerp(
        captionStyle,
        other.captionStyle,
        t,
      ),
    );
  }
}
