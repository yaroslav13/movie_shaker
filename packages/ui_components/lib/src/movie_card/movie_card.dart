import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/src/movie_card/movie_card_theme.dart';

const _defaultImageSize = Size(177, 265.5);

final class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.imageUrl,
    this.margin = EdgeInsets.zero,
    this.elevation,
    this.borderRadius,
    this.onTap,
    super.key,
  });

  final String imageUrl;
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
        size: _defaultImageSize,
        child: Stack(
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
                borderRadius: borderRadius is BorderRadius
                    ? borderRadius
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
