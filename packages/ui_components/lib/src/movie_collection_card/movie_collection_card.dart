import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/src/movie_collection_card/movie_collection_card_theme.dart';
import 'package:ui_components/src/ms_icon/ms_icon.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';
import 'package:ui_components/src/shared/ms_border_radius.dart';
import 'package:ui_components/src/shared/ms_edge_insets.dart';
import 'package:ui_components/src/shared/ms_spacings.dart';

const _maxPreviewsCount = 4;

final class MovieCollectionCard extends StatelessWidget {
  const MovieCollectionCard({
    required this.title,
    required this.posterUrls,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.backgroundColor,
    this.borderRadius,
    this.elevation,
    this.iconTheme,
    this.onTap,
    super.key,
  }) : assert(
         posterUrls.length > 0,
         'posterUrls must contain at least one URL',
       );

  final String title;
  final List<String> posterUrls;

  final String? subtitle;

  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double? elevation;
  final IconThemeData? iconTheme;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MovieCollectionCardTheme>();

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final elevation = this.elevation ?? theme?.elevation ?? 8.0;
    final backgroundColor =
        this.backgroundColor ??
        theme?.backgroundColor ??
        colorScheme.surfaceContainerHighest;
    final borderRadius =
        this.borderRadius ?? theme?.borderRadius ?? MsBorderRadius.extraLarge;

    final titleStyle =
        this.titleStyle ?? theme?.titleStyle ?? textTheme.titleMedium;

    final subtitleStyle =
        this.subtitleStyle ?? theme?.subtitleStyle ?? textTheme.bodyMedium;

    final iconTheme = this.iconTheme ?? theme?.iconTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius is BorderRadius ? borderRadius : null,
      child: Padding(
        padding: MsEdgeInsets.smallContent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: MsSpacings.medium,
          children: [
            Expanded(
              child: _MoviePostersGrid(
                posterUrls: posterUrls,
                elevation: elevation,
                backgroundColor: backgroundColor,
                borderRadius: borderRadius,
              ),
            ),
            Padding(
              padding: MsEdgeInsets.horizontalSmall,
              child: Row(
                spacing: MsSpacings.xSmall,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MsText(
                          title,
                          style: titleStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (subtitle case final subtitle?)
                          MsText(
                            subtitle,
                            style: subtitleStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(iconTheme: iconTheme),
                    child: MsIcon.arrowRight(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _MoviePostersGrid extends StatelessWidget {
  const _MoviePostersGrid({
    required this.posterUrls,
    this.elevation = 0.0,
    this.backgroundColor,
    this.borderRadius,
  });

  final List<String> posterUrls;
  final double elevation;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;

  Iterable<Widget> _buildGrid() sync* {
    final visibleCount = posterUrls.length.clamp(0, _maxPreviewsCount);

    if (visibleCount == 1) {
      yield Expanded(
        child: _MoviePoster(imageUrl: posterUrls.first),
      );

      return;
    }

    for (var i = 0; i < visibleCount; i += 2) {
      final firstPoster = _MoviePoster(imageUrl: posterUrls[i]);

      final hasSecond = i + 1 < visibleCount;

      final secondPoster = hasSecond
          ? _MoviePoster(imageUrl: posterUrls[i + 1])
          : const SizedBox.shrink();

      yield Expanded(
        child: Row(
          spacing: MsSpacings.xxSmall,
          children: [
            Expanded(child: firstPoster),
            Expanded(child: secondPoster),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      color: backgroundColor,
      borderRadius: borderRadius,
      clipBehavior: Clip.hardEdge,
      child: Column(
        spacing: MsSpacings.xxSmall,
        children: _buildGrid().toList(),
      ),
    );
  }
}

final class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
