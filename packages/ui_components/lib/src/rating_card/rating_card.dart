import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_card/ms_card.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';
import 'package:ui_components/src/score_arc/score_arc.dart';

final class RatingCard extends StatelessWidget {
  const RatingCard({
    required this.value,
    required this.description,
    this.descriptionStyle,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.scoreArcTheme,
    super.key,
  });

  final double value;
  final String description;

  final TextStyle? descriptionStyle;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  final ScoreArcTheme? scoreArcTheme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<RatingCardTheme>();

    final backgroundColor =
        this.backgroundColor ??
        theme?.backgroundColor ??
        Theme.of(context).colorScheme.surface;
    final elevation = this.elevation ?? theme?.elevation ?? 1.0;
    final borderRadius =
        this.borderRadius ?? theme?.borderRadius ?? MsBorderRadius.large;
    final descriptionStyle =
        this.descriptionStyle ??
        theme?.descriptionStyle ??
        Theme.of(context).textTheme.bodyMedium;

    final scoreArcTheme = this.scoreArcTheme ?? theme?.scoreArcTheme;

    return MsCard.icon(
      margin: MsEdgeInsets.zero,
      backgroundColor: backgroundColor,
      elevation: elevation,
      borderRadius: borderRadius,
      icon: ScoreArc(
        value: value,
        trackColor: scoreArcTheme?.trackColor,
        strokeWidth: scoreArcTheme?.strokeWidth,
        valueColors: scoreArcTheme?.valueColors,
        labelStyle: scoreArcTheme?.labelStyle,
      ),
      title: MsText(
        description,
        style: descriptionStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
