import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/src/movie_card/movie_card_theme.dart';
import 'package:ui_components/src/shared/ms_edge_insets.dart';

const _defaultImageSize = Size(177, 265.5);

final class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.imageUrl,
    this.size = _defaultImageSize,
    this.action,
    this.margin = EdgeInsets.zero,
    this.elevation,
    this.borderRadius,
    this.onTap,
    super.key,
  });

  const MovieCard.expanded({
    required this.imageUrl,
    this.action,
    this.margin = EdgeInsets.zero,
    this.elevation,
    this.borderRadius,
    this.onTap,
    super.key,
  }) : size = Size.infinite;

  final Size size;

  final String imageUrl;
  final Widget? action;
  final EdgeInsetsGeometry margin;

  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MovieCardTheme>();
    final borderRadius = this.borderRadius ?? theme?.borderRadius;
    final elevation = this.elevation ?? theme?.elevation;

    return Card(
      margin: margin,
      elevation: elevation,
      shape: borderRadius != null
          ? RoundedRectangleBorder(borderRadius: borderRadius)
          : null,
      child: SizedBox.fromSize(
        size: size,
        child: Stack(
          children: [
            _MoviePosterWidget(
              imageUrl: imageUrl,
              borderRadius: borderRadius,
              onTap: onTap,
            ),
            if (action case final action?)
              Positioned(
                top: MsEdgeInsets.smallContent.top,
                right: MsEdgeInsets.smallContent.right,
                child: action,
              ),
          ],
        ),
      ),
    );
  }
}

final class _MoviePosterWidget extends StatelessWidget {
  const _MoviePosterWidget({
    required this.imageUrl,
    this.borderRadius,
    this.onTap,
  });

  final String imageUrl;

  final BorderRadiusGeometry? borderRadius;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            borderRadius: borderRadius is BorderRadius ? borderRadius : null,
          ),
        ),
      ],
    );
  }
}
