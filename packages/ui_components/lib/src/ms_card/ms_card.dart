import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

final class MsCard extends StatelessWidget {
  const MsCard({
    this.margin,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.child,
    super.key,
  });

  factory MsCard.icon({
    required Widget icon,
    required Widget title,
    EdgeInsetsGeometry padding = MsEdgeInsets.contentLarge,
    double titleSpacing = MsSpacings.regular,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    Color? backgroundColor,
    double? elevation,
    Key? key,
  }) {
    return MsCard(
      key: key,
      margin: margin,
      backgroundColor: backgroundColor,
      elevation: elevation,
      borderRadius: borderRadius,
      child: Padding(
        padding: padding,
        child: Column(
          spacing: titleSpacing,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(child: icon),
            ),
            title,
          ],
        ),
      ),
    );
  }

  final Widget? child;

  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MsCardTheme>();
    final colorScheme = Theme.of(context).colorScheme;

    final backgroundColor =
        this.backgroundColor ?? theme?.backgroundColor ?? colorScheme.surface;

    final elevation = this.elevation ?? theme?.elevation ?? 8.0;

    final borderRadius =
        this.borderRadius ?? theme?.borderRadius ?? MsBorderRadius.large;

    return Card(
      margin: margin ?? MsEdgeInsets.scaffoldBodyPadding,
      color: backgroundColor,
      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: child,
    );
  }
}
