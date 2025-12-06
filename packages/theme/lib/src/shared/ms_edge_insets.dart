import 'package:flutter/material.dart';

abstract final class MsEdgeInsets {
  const MsEdgeInsets._();

  static const contentSmall = EdgeInsets.all(6);
  static const contentMedium = EdgeInsets.all(12);
  static const contentLarge = EdgeInsets.all(24);

  static const scrollableContentPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  );

  static const scaffoldBodyPadding = EdgeInsets.symmetric(horizontal: 16);

  static const horizontalLarge = EdgeInsets.symmetric(horizontal: 24);
  static const horizontalMedium = EdgeInsets.symmetric(horizontal: 12);
  static const horizontalSmall = EdgeInsets.symmetric(horizontal: 6);

  static const verticalLarge = EdgeInsets.symmetric(vertical: 24);
  static const verticalMedium = EdgeInsets.symmetric(vertical: 12);
  static const verticalSmall = EdgeInsets.symmetric(vertical: 6);

  static const iconButtonPadding = EdgeInsets.all(16);
  static const chipPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const bottomBarItemPadding = EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 16,
  );

  static const textFieldPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  );
  static const textFieldPaddingDense = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 8,
  );
  static const textFieldPaddingRelaxed = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 16,
  );

  static const zero = EdgeInsets.zero;
}
