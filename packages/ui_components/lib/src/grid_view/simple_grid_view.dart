import 'package:flutter/material.dart';
import 'package:ui_components/src/grid_view/simple_grid_view_theme.dart';
import 'package:ui_components/src/shared/ms_spacings.dart';

const _defaultCrossAxisCount = 2;
const _defaultAspectRatio = 0.5;

final class SimpleGridView extends StatelessWidget {
  const SimpleGridView({
    required this.itemBuilder,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.shrinkWrap = false,
    this.itemCount,
    this.primary,
    this.padding,
    this.controller,
    this.crossAxisCount,
    this.mainAxisExtent,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.childAspectRatio,
    super.key,
  });

  final ScrollController? controller;

  final Axis scrollDirection;
  final bool reverse;
  final bool shrinkWrap;

  final int? itemCount;
  final bool? primary;

  final int? crossAxisCount;
  final double? mainAxisExtent;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  final double? childAspectRatio;

  final EdgeInsetsGeometry? padding;

  final NullableIndexedWidgetBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SimpleGridViewTheme>();

    final crossAxisCount =
        this.crossAxisCount ?? theme?.crossAxisCount ?? _defaultCrossAxisCount;
    final crossAxisSpacing =
        this.crossAxisSpacing ?? theme?.crossAxisSpacing ?? MsSpacings.medium;
    final mainAxisSpacing =
        this.mainAxisSpacing ?? theme?.mainAxisSpacing ?? MsSpacings.medium;

    final childAspectRatio =
        this.childAspectRatio ?? theme?.childAspectRatio ?? _defaultAspectRatio;

    final mainAxisExtent = this.mainAxisExtent ?? theme?.mainAxisExtent;

    final padding = this.padding ?? theme?.padding ?? EdgeInsets.zero;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
        mainAxisExtent: mainAxisExtent,
      ),
      controller: controller,
      padding: padding,
      scrollDirection: scrollDirection,
      reverse: reverse,
      shrinkWrap: shrinkWrap,
      primary: primary,
      itemCount: itemCount,
      physics: const BouncingScrollPhysics(),
      itemBuilder: itemBuilder,
    );
  }
}
