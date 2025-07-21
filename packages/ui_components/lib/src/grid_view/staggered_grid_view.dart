import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ui_components/src/grid_view/staggered_grid_view_theme.dart';
import 'package:ui_components/src/shared/ms_spacings.dart';

const _defaultCrossAxisCount = 2;

final class StaggeredGridView extends StatelessWidget {
  const StaggeredGridView({
    required this.itemBuilder,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.shrinkWrap = false,
    this.itemCount,
    this.primary,
    this.padding,
    this.controller,
    this.crossAxisCount,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    super.key,
  });

  final ScrollController? controller;

  final Axis scrollDirection;
  final bool reverse;
  final bool shrinkWrap;

  final int? itemCount;
  final bool? primary;

  final int? crossAxisCount;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;

  final EdgeInsetsGeometry? padding;

  final IndexedWidgetBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<StaggeredGridViewTheme>();

    final crossAxisCount =
        this.crossAxisCount ?? theme?.crossAxisCount ?? _defaultCrossAxisCount;
    final crossAxisSpacing =
        this.crossAxisSpacing ?? theme?.crossAxisSpacing ?? MsSpacings.medium;
    final mainAxisSpacing =
        this.mainAxisSpacing ?? theme?.mainAxisSpacing ?? MsSpacings.medium;

    final padding = this.padding ?? theme?.padding ?? EdgeInsets.zero;

    return MasonryGridView.count(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
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
