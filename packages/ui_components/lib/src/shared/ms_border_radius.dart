import 'package:flutter/material.dart';

abstract final class MsBorderRadius {
  const MsBorderRadius._();

  static const regular = BorderRadius.all(Radius.circular(8));
  static const large = BorderRadius.all(Radius.circular(16));
  static const extraLarge = BorderRadius.all(Radius.circular(24));
  static const round = BorderRadius.all(Radius.circular(50));
}
