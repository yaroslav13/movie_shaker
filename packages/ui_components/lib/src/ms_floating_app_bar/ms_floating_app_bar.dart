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
    final backgroundColor = theme?.backgroundColor ?? this.backgroundColor;
    final elevation = theme?.elevation ?? this.elevation;
    final titleTextStyle = theme?.titleTextStyle ?? this.titleTextStyle;
    final iconTheme = theme?.iconTheme ?? this.iconTheme;
    final centerTitle = theme?.centerTitle ?? this.centerTitle ?? false;

    final toolbarHeight = theme?.toolbarHeight ?? this.toolbarHeight;
    final expandedHeight = theme?.expandedHeight ?? this.expandedHeight;

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
        title: title != null ? Text(title, style: titleTextStyle) : null,
        background: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
