import 'package:flutter/material.dart';

abstract final class MsEdgeInsets {
  const MsEdgeInsets._();

  static const smallContent = EdgeInsets.all(6);
  static const regularContent = EdgeInsets.all(12);
  static const largeContent = EdgeInsets.all(24);

  static const scrollableContent = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  );

  static const textFieldContent = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 8,
  );

  static const scaffoldBody = EdgeInsets.symmetric(horizontal: 16);

  static const horizontalLarge = EdgeInsets.symmetric(horizontal: 24);
  static const horizontalRegular = EdgeInsets.symmetric(horizontal: 12);
  static const horizontalSmall = EdgeInsets.symmetric(horizontal: 6);
}
