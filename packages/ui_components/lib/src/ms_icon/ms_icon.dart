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

  factory MsIcon.add({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedAdd01,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.outlinedPlay({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedPlay,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.outlinedError({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedSettingsError01,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.outlinedBookmark({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedAllBookmark,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.cancel({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedCancel01,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.refresh({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedRefresh,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.arrowLeft({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedArrowLeft01,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.arrowRight({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedArrowRight01,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.outlinedCheckmark({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedCheckmarkBadge01,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.outlinedStar({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedStarAward01,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.outlinedSchedule({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedTimeSchedule,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.outlinedClock({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedClock01,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.trendingUp({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedTradeUp,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.outlinedHome({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedHome01,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.outlinedCollections({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedShapeCollection,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.outlinedFavorite({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedFavourite,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.outlinedProfile({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedProfile,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.outlinedFolder({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedFolder01,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.outlinedTrash({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedDelete03,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsIcon.menu({
    double? size,
    Color? color,
    String? semanticLabel,
    Key? key,
  }) {
    return MsIcon(
      HugeIcons.strokeRoundedMenu03,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      key: key,
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
