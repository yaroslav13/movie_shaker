import 'dart:math';

import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

part 'two_dimensional_scrollable_controller.dart';

const _columnFraction = 0.8;
const _rowFraction = 0.6;
const _spacing = MsSpacings.medium;

final class TwoDimensionalScrollableView extends StatefulWidget {
  const TwoDimensionalScrollableView({
    required this.itemCount,
    required this.columns,
    required this.itemBuilder,
    this.controller,
    this.verticalPhysics,
    this.horizontalPhysics,
    super.key,
  }) : assert(columns > 0, 'itemAxisCount must be greater than 0');

  final TwoDimensionalScrollableController? controller;

  final int itemCount;
  final int columns;

  final ScrollPhysics? verticalPhysics;
  final ScrollPhysics? horizontalPhysics;
  final IndexedWidgetBuilder itemBuilder;

  @override
  State<TwoDimensionalScrollableView> createState() =>
      _TwoDimensionalScrollableViewState();
}

final class _TwoDimensionalScrollableViewState
    extends State<TwoDimensionalScrollableView> {
  final _verticalController = ScrollController();
  final _horizontalController = ScrollController();

  Future<void> _scrollToIndex(
    int index, {
    required Duration duration,
    required Curve curve,
  }) async {
    if (!_verticalController.hasClients || !_horizontalController.hasClients) {
      return;
    }

    if (index < 0 || index >= widget.itemCount) {
      return;
    }

    final row = index ~/ widget.columns;
    final col = index % widget.columns;

    final verticalViewport = _verticalController.position.viewportDimension;
    final horizontalViewport = _horizontalController.position.viewportDimension;

    final calculatedItemWidth = horizontalViewport * _columnFraction;
    final calculatedItemHeight = verticalViewport * _rowFraction;

    final rowCount = (widget.itemCount / widget.columns).ceil();
    final columnCount = rowCount <= 1 ? widget.itemCount : widget.columns;

    final intrinsicHeight =
        rowCount * calculatedItemHeight + (max(0, rowCount - 1) * _spacing);
    final intrinsicWidth =
        columnCount * calculatedItemWidth +
        (max(0, columnCount - 1) * _spacing);

    final topPadding = intrinsicHeight < verticalViewport
        ? (verticalViewport - intrinsicHeight) / 2
        : _spacing;
    final leftPadding = intrinsicWidth < horizontalViewport
        ? (horizontalViewport - intrinsicWidth) / 2
        : _spacing;

    var targetY = 0.0;
    if (row == 0) {
      targetY = topPadding;

      targetY = 0.0;
    } else {
      targetY =
          (topPadding + calculatedItemHeight) +
          (row - 1) * (_spacing + calculatedItemHeight) +
          _spacing;
    }

    final targetX = col == 0
        ? leftPadding
        : (leftPadding + calculatedItemWidth) +
              (col - 1) * (_spacing + calculatedItemWidth) +
              _spacing;

    const alignment = 0.5;

    final finalY =
        targetY -
        (verticalViewport * alignment) +
        (calculatedItemHeight * alignment);
    final finalX =
        targetX -
        (horizontalViewport * alignment) +
        (calculatedItemWidth * alignment);

    await Future.wait(
      [
        _verticalController.animateTo(
          finalY.clamp(0, _verticalController.position.maxScrollExtent),
          duration: duration,
          curve: curve,
        ),
        _horizontalController.animateTo(
          finalX.clamp(0, _horizontalController.position.maxScrollExtent),
          duration: duration,
          curve: curve,
        ),
      ],
    );
  }

  void _jumpToCenter() {
    if (!_verticalController.hasClients || !_horizontalController.hasClients) {
      return;
    }

    if (widget.itemCount == 0) {
      return;
    }

    final viewportWidth = _horizontalController.position.viewportDimension;
    final viewportHeight = _verticalController.position.viewportDimension;

    final itemWidth = viewportWidth * _columnFraction;
    final itemHeight = viewportHeight * _rowFraction;

    final strideHorizontal = itemWidth + _spacing;
    final strideVertical = itemHeight + _spacing;

    final offsetHorizontal = (viewportWidth - itemWidth) / 2;
    final offsetVertical = (viewportHeight - itemHeight) / 2;

    final actualRowCount = (widget.itemCount / widget.columns).ceil();
    final actualColumnCount = actualRowCount <= 1
        ? widget.itemCount
        : widget.columns;

    final middleRow = (actualRowCount / 2).floor();
    final middleColumn = (actualColumnCount / 2).floor();

    if (actualRowCount * strideVertical > viewportHeight) {
      final targetVertical =
          (middleRow * strideVertical) + _spacing - offsetVertical;
      _verticalController.jumpTo(max(0, targetVertical));
    }

    if (actualColumnCount * strideHorizontal > viewportWidth) {
      final targetHorizontal =
          (middleColumn * strideHorizontal) + _spacing - offsetHorizontal;
      _horizontalController.jumpTo(max(0, targetHorizontal));
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => _jumpToCenter());

    widget.controller?._attach(this);
  }

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();

    widget.controller?._detach(this);
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

        final intrinsicHeight =
            rowCount * itemHeight + (max(0, rowCount - 1) * _spacing);
        final intrinsicWidth =
            columnCount * itemWidth + (max(0, columnCount - 1) * _spacing);

        final topPadding = intrinsicHeight < viewportHeight
            ? (viewportHeight - intrinsicHeight) / 2
            : _spacing;

        final leftPadding = intrinsicWidth < viewportWidth
            ? (viewportWidth - intrinsicWidth) / 2
            : _spacing;

        final centerOffsetHorizontal = (viewportWidth - itemWidth) / 2;
        final centerOffsetVertical = (viewportHeight - itemHeight) / 2;

        return TableView.builder(
          diagonalDragBehavior: DiagonalDragBehavior.free,
          verticalDetails: ScrollableDetails.vertical(
            controller: _verticalController,
            physics: _FractionalSnappingPhysics(
              stride: itemHeight + _spacing,
              centerOffset: centerOffsetVertical - _spacing,
              parent: widget.verticalPhysics ?? const BouncingScrollPhysics(),
            ),
          ),
          horizontalDetails: ScrollableDetails.horizontal(
            controller: _horizontalController,
            physics:
                widget.horizontalPhysics ??
                _FractionalSnappingPhysics(
                  stride: itemWidth + _spacing,
                  centerOffset: centerOffsetHorizontal - _spacing,
                  parent:
                      widget.horizontalPhysics ?? const BouncingScrollPhysics(),
                ),
          ),
          columnCount: columnCount,
          rowCount: rowCount,
          columnBuilder: (index) => TableSpan(
            extent: const FractionalSpanExtent(_columnFraction),
            padding: TableSpanPadding(
              leading: index == 0 ? leftPadding : _spacing,
              trailing: index == columnCount - 1 ? _spacing : 0,
            ),
          ),
          rowBuilder: (index) => TableSpan(
            extent: const FractionalSpanExtent(_rowFraction),
            padding: TableSpanPadding(
              leading: index == 0 ? topPadding : _spacing,
              trailing: index == rowCount - 1 ? _spacing : 0,
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
    required this.centerOffset,
    super.parent,
  });

  final double stride;

  final double centerOffset;

  @override
  _FractionalSnappingPhysics applyTo(ScrollPhysics? ancestor) {
    return _FractionalSnappingPhysics(
      stride: stride,
      centerOffset: centerOffset,
      parent: buildParent(ancestor),
    );
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    final currentPixels = position.pixels;
    final centeredPixels = currentPixels + centerOffset;
    final currentCycle = (centeredPixels / stride).round();

    var targetCycle = currentCycle.toDouble();

    if (velocity < -100) {
      targetCycle = (centeredPixels + velocity * 0.3) / stride;
    } else if (velocity > 100) {
      targetCycle = (centeredPixels + velocity * 0.3) / stride;
    }

    final targetPixels = (targetCycle.round() * stride) - centerOffset;

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
