import 'package:flutter/material.dart';
import 'package:ui_components/src/shared/ms_border_radius.dart';
import 'package:ui_components/ui_components.dart';

final class MsAppBarDelegate<T> extends SliverPersistentHeaderDelegate {
  MsAppBarDelegate({
    required this.title,
    required this.context,
    this.bottom,
    this.forceElevated = false,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
  });

  factory MsAppBarDelegate.withSearchAndFilter({
    required BuildContext context,
    TextEditingController? controller,
    FocusNode? focusNode,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    List<T>? filterItems,
    Widget Function(BuildContext, T)? filterLabelBuilder,
    bool forceElevated = false,
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
  }) {
    final searchBar = MsSearchBar(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );

    final filterBar = (filterItems != null && filterLabelBuilder != null)
        ? MsFilterBar<T>(
            padding: MsEdgeInsets.horizontalRegular,
            items: filterItems,
            labelBuilder: filterLabelBuilder,
          )
        : null;

    return MsAppBarDelegate<T>(
      context: context,
      title: searchBar,
      bottom: filterBar,
      forceElevated: forceElevated,
      backgroundColor: backgroundColor,
      elevation: elevation,
      borderRadius: borderRadius,
    );
  }

  final BuildContext context;

  final PreferredSizeWidget title;
  final PreferredSizeWidget? bottom;

  final bool forceElevated;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  double get _searchBarHeight => title.preferredSize.height;

  double get _filterBarHeight => bottom?.preferredSize.height ?? 0.0;

  @override
  double get maxExtent =>
      _searchBarHeight +
      _filterBarHeight +
      MediaQuery.viewPaddingOf(context).top;

  @override
  double get minExtent =>
      _filterBarHeight + MediaQuery.viewPaddingOf(context).top;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context).extension<MsAppBarDelegateTheme>();

    final backgroundColor = this.backgroundColor ?? theme?.backgroundColor;
    final elevation = this.elevation ?? theme?.elevation ?? 8.0;
    final borderRadius =
        this.borderRadius ??
        theme?.borderRadius ??
        const BorderRadius.vertical(bottom: MsRadius.extraLarge);

    final topPadding = MediaQuery.viewPaddingOf(context).top;

    final currentHeight = (maxExtent - shrinkOffset).clamp(
      minExtent,
      maxExtent,
    );

    final collapsibleHeight = (currentHeight - topPadding - _filterBarHeight)
        .clamp(0.0, _searchBarHeight);

    final heightFactor = _searchBarHeight == 0
        ? 0.0
        : (collapsibleHeight / _searchBarHeight).clamp(0.0, 1.0);

    final shouldTitleBeShown = shrinkOffset == 0.0;

    final overlapContent =
        shrinkOffset > 0.0 || overlapsContent || forceElevated;

    return Material(
      color: overlapContent ? backgroundColor : null,
      elevation: overlapContent ? elevation : 0.0,
      borderRadius: borderRadius,
      child: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (collapsibleHeight > 0)
              SizedBox(
                height: collapsibleHeight,
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: heightFactor,
                  child: shouldTitleBeShown ? title : const SizedBox.shrink(),
                ),
              ),
            ?bottom,
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant MsAppBarDelegate<T> oldDelegate) {
    return oldDelegate.forceElevated != forceElevated ||
        oldDelegate.title != title ||
        oldDelegate.bottom != bottom ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.elevation != elevation ||
        oldDelegate.borderRadius != borderRadius;
  }
}
