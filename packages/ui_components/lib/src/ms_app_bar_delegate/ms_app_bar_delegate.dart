import 'package:flutter/material.dart';
import 'package:ui_components/src/shared/ms_border_radius.dart';
import 'package:ui_components/ui_components.dart';

final class MsAppBarDelegate extends SliverPersistentHeaderDelegate {
  const MsAppBarDelegate({
    required this.title,
    required this.context,
    this.bottom,
    this.forceElevated = false,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
  });

  final BuildContext context;

  final PreferredSizeWidget title;
  final PreferredSizeWidget? bottom;

  final bool forceElevated;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  static MsAppBarDelegate withSearchAndFilter<T>({
    required BuildContext context,
    T? selectedFilterItem,
    List<T>? filterItems,
    String Function(BuildContext, T)? filterLabelBuilder,
    ValueChanged<T?>? onFilterSelected,
    TextEditingController? searchController,
    FocusNode? searchFocusNode,
    ValueChanged<String>? onSearchChanged,
    ValueChanged<String>? onSearchSubmitted,
    bool forceElevated = false,
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
  }) {
    assert(
      searchController != null || onSearchChanged != null,
      'Either `searchController` or `onSearchChanged` must be provided for '
      'this search field. Both were null.',
    );

    assert(
      filterItems == null || filterLabelBuilder != null,
      'If `filterItems` is provided, `filterLabelBuilder` must also be '
      'provided. `filterItems` was not null, but `filterLabelBuilder` was '
      'null.',
    );

    final searchBar = MsSearchBar(
      controller: searchController,
      focusNode: searchFocusNode,
      onChanged: onSearchChanged,
      onSubmitted: onSearchSubmitted,
    );

    final isFilterBarVisible =
        filterItems != null &&
        filterLabelBuilder != null &&
        filterItems.isNotEmpty;

    final filterBar = isFilterBarVisible
        ? MsFilterBar<T>(
            padding: EdgeInsets.only(
              bottom: MsEdgeInsets.regularContent.bottom,
              left: MsEdgeInsets.scaffoldBody.left,
              right: MsEdgeInsets.scaffoldBody.right,
            ),
            items: filterItems,
            selectedItem: selectedFilterItem,
            labelBuilder: filterLabelBuilder,
            onSelected: onFilterSelected,
          )
        : null;

    return MsAppBarDelegate(
      context: context,
      title: searchBar,
      bottom: filterBar,
      forceElevated: forceElevated,
      backgroundColor: backgroundColor,
      elevation: elevation,
      borderRadius: borderRadius,
    );
  }

  double get _titleHeight => title.preferredSize.height;

  double get _bottomHeight => bottom?.preferredSize.height ?? 0.0;

  @override
  double get maxExtent =>
      _titleHeight + _bottomHeight + MediaQuery.viewPaddingOf(context).top;

  @override
  double get minExtent => _bottomHeight + MediaQuery.viewPaddingOf(context).top;

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

    final collapsibleHeight = (currentHeight - topPadding - _bottomHeight)
        .clamp(0.0, _titleHeight);

    final heightFactor = _titleHeight == 0
        ? 0.0
        : (collapsibleHeight / _titleHeight).clamp(0.0, 1.0);

    final shouldTitleBeShown = shrinkOffset == 0.0;

    final shouldBeElevated =
        shrinkOffset > 0.0 || overlapsContent || forceElevated;

    return Material(
      color: shouldBeElevated ? backgroundColor : null,
      elevation: shouldBeElevated ? elevation : 0.0,
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
  bool shouldRebuild(covariant MsAppBarDelegate oldDelegate) {
    return oldDelegate.forceElevated != forceElevated ||
        oldDelegate.title != title ||
        oldDelegate.bottom != bottom ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.elevation != elevation ||
        oldDelegate.borderRadius != borderRadius;
  }
}
