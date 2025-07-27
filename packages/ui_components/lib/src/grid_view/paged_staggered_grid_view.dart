import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ui_components/src/glasses_progress_indicator/glasses_progress_indicator.dart';
import 'package:ui_components/src/grid_view/entities/pagination_state.dart';
import 'package:ui_components/src/grid_view/staggered_grid_view_theme.dart';
import 'package:ui_components/src/loading_error_stub/loading_error_stub.dart';
import 'package:ui_components/src/shared/ms_spacings.dart';

const _defaultCrossAxisCount = 2;

final class PagedStaggeredGridView<T> extends StatelessWidget {
  const PagedStaggeredGridView({
    required this.paginationState,
    required this.itemBuilder,
    required this.fetchNextPage,
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

  final PaginationState<T> paginationState;

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

  final Widget Function(BuildContext context, T item, int index) itemBuilder;

  final VoidCallback fetchNextPage;

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

    final state = PagingState<int, T>(
      pages: paginationState.pages,
      keys: paginationState.keys,
      error: paginationState.error,
      hasNextPage: paginationState.hasNextPage,
      isLoading: paginationState.isLoading,
    );

    // TODO(yhalivets): Handle edge cases like empty state, errors, etc.
    return PagedMasonryGridView<int, T>.count(
      state: state,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisCount: crossAxisCount,
      padding: padding,
      scrollDirection: scrollDirection,
      reverse: reverse,
      shrinkWrap: shrinkWrap,
      primary: primary,
      scrollController: controller,
      fetchNextPage: fetchNextPage,
      builderDelegate: PagedChildBuilderDelegate(
        animateTransitions: true,
        itemBuilder: itemBuilder,
        firstPageErrorIndicatorBuilder: (_) => const LoadingErrorStub(),
        firstPageProgressIndicatorBuilder: (context) => const Center(
          child: GlassesProgressIndicator(),
        ),
        noItemsFoundIndicatorBuilder: (_) => const SizedBox.shrink(),
        noMoreItemsIndicatorBuilder: (_) => const SizedBox.shrink(),
      ),
    );
  }
}
