import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

final class MsIcon extends StatelessWidget {
  const MsIcon(
    this.icon, {
    this.size,
    this.fill,
    this.weight,
    this.grade,
    this.opticalSize,
    this.color,
    this.shadows,
    this.semanticLabel,
    this.textDirection,
    super.key,
  });

  factory MsIcon.cancel({
    double? size,
    Color? color,
    String? semanticLabel,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedCancel01,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }

  factory MsIcon.refresh({
    double? size,
    Color? color,
    String? semanticLabel,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedRefresh,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }

  factory MsIcon.arrowLeft({
    double? size,
    Color? color,
    String? semanticLabel,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedArrowLeft01,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }

  factory MsIcon.arrowRight({
    double? size,
    Color? color,
    String? semanticLabel,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedArrowRight01,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }

  factory MsIcon.star({
    double? size,
    Color? color,
    String? semanticLabel,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedStarAward01,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }

  factory MsIcon.schedule({
    double? size,
    Color? color,
    String? semanticLabel,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedTimeSchedule,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }

  factory MsIcon.clock({
    double? size,
    Color? color,
    String? semanticLabel,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedClock01,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }

  factory MsIcon.trendingUp({
    double? size,
    Color? color,
    String? semanticLabel,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedTradeUp,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }

  final IconData? icon;
  final double? size;
  final double? fill;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final Color? color;
  final List<Shadow>? shadows;
  final String? semanticLabel;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).iconTheme;
    final color = this.color ?? theme.color;
    final size = this.size ?? theme.size;
    final shadows = this.shadows ?? theme.shadows;
    final fill = this.fill ?? theme.fill;
    final weight = this.weight ?? theme.weight;
    final grade = this.grade ?? theme.grade;
    final opticalSize = this.opticalSize ?? theme.opticalSize;

    return Icon(
      icon,
      size: size,
      fill: fill,
      weight: weight,
      grade: grade,
      opticalSize: opticalSize,
      color: color,
      shadows: shadows,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}
