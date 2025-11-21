import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ui_components/src/movie_carousel/movie_carousel_theme.dart';
import 'package:ui_components/src/shared/ms_border_radius.dart';
import 'package:ui_components/src/shared/ms_edge_insets.dart';

const _dotSize = Size(8, 8);

final class MovieCarousel extends StatefulWidget {
  const MovieCarousel({
    required this.itemBuilder,
    required this.itemCount,
    this.noItemsBuilder,
    super.key,
  });

  final IndexedWidgetBuilder itemBuilder;
  final WidgetBuilder? noItemsBuilder;
  final int itemCount;

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

final class _MovieCarouselState extends State<MovieCarousel> {
  final _carouselController = CarouselController();

  @override
  void dispose() {
    _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MovieCarouselTheme>();
    final dotsIndicatorTheme = theme?.dotsIndicatorTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemExtent = constraints.maxHeight * 0.85;

        final noItemsBuilder = widget.noItemsBuilder;

        return Stack(
          alignment: Alignment.centerRight,
          children: [
            if (widget.itemCount == 0 && noItemsBuilder != null)
              Center(
                child: noItemsBuilder(context),
              )
            else if (widget.itemCount == 1)
              Padding(
                padding: MsEdgeInsets.regularContent,
                child: widget.itemBuilder(context, 0),
              )
            else
              CarouselView(
                controller: _carouselController,
                padding: MsEdgeInsets.regularContent,
                scrollDirection: Axis.vertical,
                itemExtent: itemExtent,
                children: List.generate(
                  widget.itemCount,
                  (index) => widget.itemBuilder(context, index),
                ),
              ),
            if (widget.itemCount > 1)
              Positioned(
                right: MsEdgeInsets.horizontalLarge.right,
                child: _DotsIndicator(
                  controller: _carouselController,
                  itemCount: widget.itemCount,
                  itemExtent: itemExtent,
                  backgroundColor: dotsIndicatorTheme?.backgroundColor,
                  activeColor: dotsIndicatorTheme?.activeColor,
                  inactiveColor: dotsIndicatorTheme?.inactiveColor,
                ),
              ),
          ],
        );
      },
    );
  }
}

final class _DotsIndicator extends StatelessWidget {
  const _DotsIndicator({
    required this.controller,
    required this.itemCount,
    required this.itemExtent,
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
  });

  final CarouselController controller;
  final int itemCount;
  final double itemExtent;

  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final backgroundColor = this.backgroundColor ?? colorScheme.inverseSurface;
    final activeColor = this.activeColor ?? colorScheme.primary;
    final inactiveColor = this.inactiveColor ?? colorScheme.onInverseSurface;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        var position = 0.0;

        if (controller.hasClients && itemExtent > 0) {
          position = max(
            0,
            controller.offset / itemExtent,
          );
        }

        return DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: MsBorderRadius.round,
          ),
          child: Padding(
            padding: MsEdgeInsets.regularContent,
            child: AnimatedSmoothIndicator(
              activeIndex: position.round(),
              count: itemCount,
              axisDirection: Axis.vertical,
              effect: ScrollingDotsEffect(
                dotWidth: _dotSize.width,
                dotHeight: _dotSize.height,
                activeDotColor: activeColor,
                dotColor: inactiveColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
