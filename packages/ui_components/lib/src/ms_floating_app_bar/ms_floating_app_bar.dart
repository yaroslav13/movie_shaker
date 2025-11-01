import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class MsFloatingAppBar extends StatelessWidget {
  const MsFloatingAppBar({
    required this.imageUrl,
    this.title,
    this.toolbarHeight,
    this.expandedHeight,
    this.bottom,
    this.backgroundColor,
    this.elevation,
    this.titleTextStyle,
    this.iconTheme,
    this.centerTitle,
    super.key,
  });

  final String? title;
  final String imageUrl;

  final double? toolbarHeight;
  final double? expandedHeight;

  final PreferredSizeWidget? bottom;

  final Color? backgroundColor;
  final double? elevation;
  final TextStyle? titleTextStyle;
  final IconThemeData? iconTheme;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    final title = this.title;

    final theme = Theme.of(context).extension<MsFloatingAppBarTheme>();
    final backgroundColor = this.backgroundColor ?? theme?.backgroundColor;
    final elevation = this.elevation ?? theme?.elevation;
    final titleTextStyle = this.titleTextStyle ?? theme?.titleTextStyle;
    final iconTheme = this.iconTheme ?? theme?.iconTheme;
    final centerTitle = this.centerTitle ?? theme?.centerTitle ?? false;

    final toolbarHeight = this.toolbarHeight ?? theme?.toolbarHeight;
    final expandedHeight = this.expandedHeight ?? theme?.expandedHeight;

    return SliverAppBar(
      pinned: true,
      elevation: elevation,
      stretch: true,
      backgroundColor: backgroundColor,
      iconTheme: iconTheme,
      titleTextStyle: titleTextStyle,
      toolbarHeight: toolbarHeight ?? kToolbarHeight,
      expandedHeight: expandedHeight,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: centerTitle,
        title: title != null ? MsText(title, style: titleTextStyle) : null,
        background: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
