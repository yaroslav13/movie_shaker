import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

const _toolbarHeight = 80.0;

final class MsFloatingAppBar extends StatelessWidget {
  const MsFloatingAppBar({
    this.title,
    this.toolbarHeight,
    this.collapsedHeight,
    this.expandedHeight,
    this.bottom,
    this.backgroundColor,
    this.elevation,
    this.titleTextStyle,
    this.iconTheme,
    this.shape,
    this.centerTitle,
    this.flexibleSpace,
    this.floating,
    this.pinned,
    this.stretch,
    this.primary,
    this.forceElevated,
    this.snap,
    super.key,
  });

  factory MsFloatingAppBar.backgroundImage({
    required String imageUrl,
    String? title,
    double? toolbarHeight,
    double? expandedHeight,
    PreferredSizeWidget? bottom,
    Color? backgroundColor,
    double? elevation,
    TextStyle? titleTextStyle,
    IconThemeData? iconTheme,
    bool? centerTitle,
    Key? key,
  }) {
    return MsFloatingAppBar(
      toolbarHeight: toolbarHeight,
      expandedHeight: expandedHeight,
      bottom: bottom,
      backgroundColor: backgroundColor,
      elevation: elevation,
      titleTextStyle: titleTextStyle,
      iconTheme: iconTheme,
      centerTitle: centerTitle,
      pinned: true,
      stretch: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: centerTitle,
        title: title != null ? MsText(title, style: titleTextStyle) : null,
        background: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      key: key,
    );
  }

  final Widget? title;

  final double? toolbarHeight;
  final double? collapsedHeight;
  final double? expandedHeight;

  final PreferredSizeWidget? bottom;

  final Color? backgroundColor;
  final double? elevation;
  final TextStyle? titleTextStyle;
  final IconThemeData? iconTheme;
  final ShapeBorder? shape;
  final bool? centerTitle;
  final bool? pinned;
  final bool? stretch;
  final bool? floating;
  final bool? forceElevated;
  final bool? primary;
  final bool? snap;

  final Widget? flexibleSpace;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MsFloatingAppBarTheme>();

    final backgroundColor = this.backgroundColor ?? theme?.backgroundColor;
    final elevation = this.elevation ?? theme?.elevation;
    final titleTextStyle = this.titleTextStyle ?? theme?.titleTextStyle;
    final iconTheme = this.iconTheme ?? theme?.iconTheme;
    final centerTitle = this.centerTitle ?? theme?.centerTitle ?? false;

    final toolbarHeight = this.toolbarHeight ?? theme?.toolbarHeight;
    final expandedHeight = this.expandedHeight ?? theme?.expandedHeight;

    return SliverAppBar(
      title: title,
      pinned: pinned ?? false,
      elevation: elevation,
      stretch: stretch ?? false,
      floating: floating ?? false,
      primary: primary ?? true,
      snap: snap ?? false,
      backgroundColor: backgroundColor,
      forceElevated: forceElevated ?? false,
      iconTheme: iconTheme,
      centerTitle: centerTitle,
      titleTextStyle: titleTextStyle,
      toolbarHeight: toolbarHeight ?? _toolbarHeight,
      collapsedHeight: collapsedHeight,
      expandedHeight: expandedHeight,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      shape: shape,
    );
  }
}
