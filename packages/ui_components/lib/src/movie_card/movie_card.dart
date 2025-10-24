import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ui_components/src/movie_card/movie_card_theme.dart';
import 'package:ui_components/src/shared/ms_edge_insets.dart';
import 'package:ui_components/src/shared/ms_spacings.dart';

final class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.title,
    this.margin = EdgeInsets.zero,
    this.imageUrl,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.onTap,
    super.key,
  });

  final String? imageUrl;
  final String title;
  final String? subtitle;

  final EdgeInsetsGeometry margin;

  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  final Color? backgroundColor;

  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MovieCardTheme>();
    final borderRadius = this.borderRadius ?? theme?.borderRadius;
    final titleStyle = this.titleStyle ?? theme?.titleStyle;
    final subtitleStyle = this.subtitleStyle ?? theme?.subtitleStyle;
    final backgroundColor = this.backgroundColor ?? theme?.backgroundColor;
    final elevation = this.elevation ?? theme?.elevation;

    final imageUrl = this.imageUrl;

    return Card(
      margin: margin,
      elevation: elevation,
      color: backgroundColor,
      shape: borderRadius != null
          ? RoundedRectangleBorder(borderRadius: borderRadius)
          : null,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius is BorderRadius ? borderRadius : null,
        child: Padding(
          padding: MsEdgeInsets.regularContent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: MsSpacings.medium,
            children: [
              ClipRRect(
                borderRadius: borderRadius ?? BorderRadius.zero,
                child: imageUrl != null
                    ? CachedNetworkImage(imageUrl: imageUrl)
                    : const _PosterPlaceholder(),
              ),
              _Hint(
                title: title,
                subtitle: subtitle,
                titleStyle: titleStyle,
                subtitleStyle: subtitleStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _Hint extends StatelessWidget {
  const _Hint({
    required this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
  });

  final String title;
  final String? subtitle;

  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MovieCardTheme>();

    final titleStyle = this.titleStyle ?? theme?.titleStyle;
    final subtitleStyle = this.subtitleStyle ?? theme?.subtitleStyle;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MsEdgeInsets.smallContent.horizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: MsSpacings.xxSmall,
        children: [
          Flexible(child: Text(title, style: titleStyle)),
          if (subtitle case final subtitle?) ...[
            Flexible(child: Text(subtitle, style: subtitleStyle)),
          ],
        ],
      ),
    );
  }
}

final class _PosterPlaceholder extends StatelessWidget {
  const _PosterPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: MsEdgeInsets.largeContent,
        child: Icon(
          HugeIcons.strokeRoundedSpam,
          size: 64,
        ),
      ),
    );
  }
}
