import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

final class MsCarousel extends StatelessWidget {
  const MsCarousel({
    required this.itemCount,
    required this.itemBuilder,
    this.itemFraction = 1.0,
    this.scrollDirection = Axis.horizontal,
    this.enableSplash = true,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.padding,
    super.key,
  });

  final int itemCount;
  final double itemFraction;
  final IndexedWidgetBuilder itemBuilder;

  final Axis scrollDirection;

  final bool enableSplash;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MsCarouselTheme>();

    final backgroundColor = this.backgroundColor ?? theme?.backgroundColor;
    final elevation = this.elevation ?? theme?.elevation;
    final padding = this.padding ?? theme?.padding;
    final borderRadius = this.borderRadius ?? theme?.borderRadius;

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisSize = scrollDirection == Axis.horizontal
            ? constraints.maxHeight
            : constraints.maxWidth;

        final itemExtent = scrollDirection == Axis.horizontal
            ? crossAxisSize * itemFraction
            : crossAxisSize / itemFraction;

        return CarouselView(
          itemExtent: itemExtent,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shape: borderRadius != null
              ? RoundedRectangleBorder(borderRadius: borderRadius)
              : null,
          scrollDirection: scrollDirection,
          padding: padding,
          enableSplash: enableSplash,
          children: List<Widget>.generate(
            itemCount,
            (index) => itemBuilder(context, index),
          ),
        );
      },
    );
  }
}
