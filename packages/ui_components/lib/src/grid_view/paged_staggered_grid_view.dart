import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/grid_view/entities/pagination_state.dart';
import 'package:ui_components/src/loading_error_stub/entities/loading_error_stub_type.dart';
import 'package:ui_components/src/loading_error_stub/loading_error_stub.dart';
import 'package:ui_components/src/ms_progress_indicator/ms_progress_indicator.dart';
import 'package:ui_components/src/no_items_stub/no_items_stub.dart';

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
    this.physics,
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
  final ScrollPhysics? physics;
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
          : physics ?? const BouncingScrollPhysics(),
      showNewPageErrorIndicatorAsGridChild: false,
      showNewPageProgressIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: itemBuilder,
        firstPageErrorIndicatorBuilder: (_) => LoadingErrorStub(
          textStyle: largeTextStyle,
          onRetry: onReload,
        ),
        firstPageProgressIndicatorBuilder: (context) => Center(
          child: MsProgressIndicator.moviePosters(),
        ),
        newPageProgressIndicatorBuilder: (context) => _FooterTile(
          child: MsProgressIndicator.moviePosters(),
        ),
        newPageErrorIndicatorBuilder: (context) => _FooterTile(
          child: LoadingErrorStub(
            textStyle: smallTextStyle,
            type: LoadingErrorStubType.horizontal,
            onRetry: onNextPage,
          ),
        ),
        noItemsFoundIndicatorBuilder: (_) => NoItemsStub.noMovies(),
        noMoreItemsIndicatorBuilder: (_) => const SizedBox.shrink(),
      ),
    );
  }
}
