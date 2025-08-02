import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ui_components/src/glasses_progress_indicator/glasses_progress_indicator.dart';
import 'package:ui_components/src/grid_view/entities/pagination_state.dart';
import 'package:ui_components/src/grid_view/staggered_grid_view_theme.dart';
import 'package:ui_components/src/loading_error_stub/enitities/loading_error_stub_type.dart';
import 'package:ui_components/src/loading_error_stub/loading_error_stub.dart';
import 'package:ui_components/src/shared/ms_edge_insets.dart';
import 'package:ui_components/src/shared/ms_spacings.dart';

part 'widgets/footer_tile.dart';

const _defaultCrossAxisCount = 2;

final class PagedStaggeredGridView<T> extends StatelessWidget {
  const PagedStaggeredGridView({
    required this.paginationState,
    required this.itemBuilder,
    required this.onNextPage,
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
    this.largeTextStyle,
    this.smallTextStyle,
    this.onReload,
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

  final TextStyle? largeTextStyle;
  final TextStyle? smallTextStyle;
  final EdgeInsetsGeometry? padding;

  final Widget Function(BuildContext context, T item, int index) itemBuilder;

  final VoidCallback onNextPage;
  final VoidCallback? onReload;

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

    final largeTextStyle = this.largeTextStyle ?? theme?.largeTextStyle;
    final smallTextStyle = this.smallTextStyle ?? theme?.smallTextStyle;

    final state = PagingState<int, T>(
      pages: paginationState.pages,
      keys: paginationState.keys,
      error: paginationState.error,
      hasNextPage: paginationState.hasNextPage,
      isLoading: paginationState.isLoading,
    );

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
      fetchNextPage: onNextPage,
      physics: state.pages == null && (state.error != null || state.isLoading)
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      showNewPageErrorIndicatorAsGridChild: false,
      showNewPageProgressIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: itemBuilder,
        firstPageErrorIndicatorBuilder: (_) => LoadingErrorStub(
          textStyle: largeTextStyle,
          onRetry: onReload,
        ),
        firstPageProgressIndicatorBuilder: (context) => const Center(
          child: GlassesProgressIndicator(),
        ),
        newPageProgressIndicatorBuilder: (context) => const _FooterTile(
          child: GlassesProgressIndicator(),
        ),
        newPageErrorIndicatorBuilder: (context) => _FooterTile(
          child: LoadingErrorStub(
            textStyle: smallTextStyle,
            type: LoadingErrorStubType.horizontal,
            onRetry: onNextPage,
          ),
        ),

        /// TODO(yhalivets): Handle empty state.
        noItemsFoundIndicatorBuilder: (_) => const SizedBox.shrink(),
        noMoreItemsIndicatorBuilder: (_) => const SizedBox.shrink(),
      ),
    );
  }
}
