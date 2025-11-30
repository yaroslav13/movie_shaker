import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

const _columnFraction = 0.8;
const _rowFraction = 0.6;
const _spacing = MsSpacings.medium;

final class TwoDimensionalScrollableView extends StatefulWidget {
  const TwoDimensionalScrollableView({
    required this.itemCount,
    required this.columns,
    required this.itemBuilder,
    this.physics,
    super.key,
  }) : assert(columns > 0, 'itemAxisCount must be greater than 0');

  final int itemCount;
  final int columns;

  final ScrollPhysics? physics;
  final IndexedWidgetBuilder itemBuilder;

  @override
  State<TwoDimensionalScrollableView> createState() =>
      _TwoDimensionalScrollableViewState();
}

final class _TwoDimensionalScrollableViewState
    extends State<TwoDimensionalScrollableView> {
  final _verticalController = ScrollController();
  final _horizontalController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => _jumpToCenter());
  }

  void _jumpToCenter() {
    if (!_verticalController.hasClients || !_horizontalController.hasClients) {
      return;
    }

    if (widget.itemCount == 0) {
      return;
    }

    final actualRowCount = (widget.itemCount / widget.columns).ceil();
    final strideHorizontal =
        _horizontalController.position.viewportDimension * _columnFraction +
        _spacing;
    final strideVertical =
        _verticalController.position.viewportDimension * _rowFraction +
        _spacing;

    final middleRow = (actualRowCount / 2).floor();
    final middleCol = (widget.columns / 2).floor();

    if (actualRowCount > 1) {
      _verticalController.jumpTo(middleRow * strideVertical);
    }
    if (widget.itemCount > widget.columns) {
      _horizontalController.jumpTo(middleCol * strideHorizontal);
    }
  }

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rowCount = (widget.itemCount / widget.columns).ceil();
    final columnCount = rowCount <= 1 ? widget.itemCount : widget.columns;

    return LayoutBuilder(
      builder: (context, constraints) {
        final viewportWidth = constraints.maxWidth;
        final viewportHeight = constraints.maxHeight;

        final itemWidth = viewportWidth * _columnFraction;
        final itemHeight = viewportHeight * _rowFraction;

        final centerPaddingHorizontal = (viewportWidth - itemWidth) / 2;
        final centerPaddingVertical = (viewportHeight - itemHeight) / 2;

        return TableView.builder(
          diagonalDragBehavior: DiagonalDragBehavior.free,
          verticalDetails: ScrollableDetails.vertical(
            controller: _verticalController,
            physics: _FractionalSnappingPhysics(
              stride: itemHeight + _spacing,
              parent: widget.physics ?? const BouncingScrollPhysics(),
            ),
          ),
          horizontalDetails: ScrollableDetails.horizontal(
            controller: _horizontalController,
            physics: _FractionalSnappingPhysics(
              stride: itemWidth + _spacing,
              parent: widget.physics ?? const BouncingScrollPhysics(),
            ),
          ),
          columnCount: columnCount,
          rowCount: rowCount,
          columnBuilder: (index) => TableSpan(
            extent: const FractionalSpanExtent(_columnFraction),
            padding: TableSpanPadding(
              leading: index == 0 ? centerPaddingHorizontal : 0,
              trailing: _spacing,
            ),
          ),
          rowBuilder: (index) => TableSpan(
            extent: const FractionalSpanExtent(_rowFraction),
            padding: TableSpanPadding(
              leading: index == 0 ? centerPaddingVertical : 0,
              trailing: _spacing,
            ),
          ),

          cellBuilder: (context, vicinity) {
            final index = (vicinity.row * widget.columns) + vicinity.column;

            if (index >= widget.itemCount) {
              return const TableViewCell(
                child: SizedBox.shrink(),
              );
            }

            return TableViewCell(
              child: widget.itemBuilder(context, index),
            );
          },
        );
      },
    );
  }
}

final class _FractionalSnappingPhysics extends ScrollPhysics {
  const _FractionalSnappingPhysics({
    required this.stride,
    super.parent,
  });

  final double stride;

  @override
  _FractionalSnappingPhysics applyTo(ScrollPhysics? ancestor) {
    return _FractionalSnappingPhysics(
      stride: stride,
      parent: buildParent(ancestor),
    );
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    final currentPixels = position.pixels;
    final currentCycle = (currentPixels / stride).round();

    var targetCycle = currentCycle.toDouble();

    if (velocity < -100) {
      targetCycle = (currentPixels + velocity * 0.3) / stride;
    } else if (velocity > 100) {
      targetCycle = (currentPixels + velocity * 0.3) / stride;
    }

    final targetPixels = targetCycle.round() * stride;

    final clampedTarget = targetPixels.clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );

    if (clampedTarget != currentPixels) {
      return ScrollSpringSimulation(
        spring,
        currentPixels,
        clampedTarget,
        velocity,
        tolerance: toleranceFor(position),
      );
    }

    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
