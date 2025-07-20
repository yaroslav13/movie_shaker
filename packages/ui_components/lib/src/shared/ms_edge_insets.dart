import 'package:flutter/material.dart';

abstract final class MsEdgeInsets {
  const MsEdgeInsets._();

  static const regularContent = EdgeInsets.all(12);
  static const largeContent = EdgeInsets.all(24);

  static const listViewMargin = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 12,
  );

  static const listViewItemMargin = EdgeInsets.symmetric(vertical: 8);
}
