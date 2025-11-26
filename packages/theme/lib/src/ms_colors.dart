import 'dart:ui';

import 'package:meta/meta.dart';

@immutable
final class MsColors {
  factory MsColors.light() => const MsColors._(
    brand: _rebeccaPurple,
    accent: _pistachio,
    supportive: _tropicalIndigo,
    error: _chillRed,
  );

  const MsColors._({
    required this.brand,
    required this.accent,
    required this.supportive,
    required this.error,
  });

  final Color brand;
  final Color accent;
  final Color supportive;
  final Color error;

  static const _rebeccaPurple = Color(0xff593C8F);
  static const _pistachio = Color(0xff88D18A);
  static const _tropicalIndigo = Color(0xffA997DF);
  static const _chillRed = Color(0xffE3170A);
}
