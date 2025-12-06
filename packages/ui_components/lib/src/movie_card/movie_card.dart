import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_card/ms_card.dart';

const _defaultImageSize = Size(177, 265.5);

final class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.imageUrl,
    this.size = _defaultImageSize,
    this.margin = EdgeInsets.zero,
    this.action,
    this.leading,
    this.elevation,
    this.borderRadius,
    this.onTap,
    super.key,
  });

  const MovieCard.expanded({
    required this.imageUrl,
    this.margin = EdgeInsets.zero,
    this.action,
    this.leading,
    this.elevation,
    this.borderRadius,
    this.onTap,
    super.key,
  }) : size = Size.infinite;

  final Size size;

  final String imageUrl;
  final Widget? action;
  final Widget? leading;
  final EdgeInsetsGeometry margin;

  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MovieCardTheme>();
    final borderRadius = this.borderRadius ?? theme?.borderRadius;
    final elevation = this.elevation ?? theme?.elevation;

    return MsCard(
      margin: margin,
      elevation: elevation,
      borderRadius: borderRadius,
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
                top: MsEdgeInsets.contentSmall.top,
                right: MsEdgeInsets.contentSmall.right,
                child: action,
              ),
            if (leading case final leading?)
              Positioned(
                top: MsEdgeInsets.contentSmall.top,
                left: MsEdgeInsets.contentSmall.left,
                child: leading,
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
