import 'package:flutter/material.dart';

abstract final class MsBorderRadius {
  const MsBorderRadius._();

  static const regular = BorderRadius.all(MsRadius.regular);
  static const large = BorderRadius.all(MsRadius.large);
  static const extraLarge = BorderRadius.all(MsRadius.extraLarge);
  static const round = BorderRadius.all(MsRadius.round);
}

abstract final class MsRadius {
  const MsRadius._();

  static const regular = Radius.circular(8);
  static const large = Radius.circular(16);
  static const extraLarge = Radius.circular(24);
  static const round = Radius.circular(50);
}
