import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

const _toolbarHeight = 80.0;
const _leadingSize = Size.square(50);
const _leadingPadding = MsEdgeInsets.contentLarge;

final class MsFloatingAppBar extends StatelessWidget {
  const MsFloatingAppBar({
    this.title,
    this.toolbarHeight,
    this.collapsedHeight,
    this.expandedHeight,
    this.bottom,
    this.leading,
    this.leadingWidth,
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
    Widget? title,
    double? toolbarHeight,
    double? expandedHeight,
    PreferredSizeWidget? bottom,
    Widget? leading,
    double? leadingWidth,
    Color? backgroundColor,
    double? elevation,
    TextStyle? titleTextStyle,
    IconThemeData? iconTheme,
    bool? centerTitle,
    Key? key,
  }) {
    final appBarHeight = toolbarHeight ?? _toolbarHeight;

    return MsFloatingAppBar(
      toolbarHeight: appBarHeight,
      expandedHeight: expandedHeight,
      leading: leading,
      bottom: bottom,
      leadingWidth: leadingWidth,
      backgroundColor: backgroundColor,
      elevation: elevation,
      titleTextStyle: titleTextStyle,
      iconTheme: iconTheme,
      forceElevated: false,
      pinned: true,
      stretch: true,
      floating: true,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final viewPadding = MediaQuery.viewPaddingOf(context);
          final flexibleSpaceHeight = constraints.biggest.height;

          final shouldShowTitle =
              title != null &&
              flexibleSpaceHeight >
                  appBarHeight +
                      viewPadding.top +
                      _leadingSize.height +
                      _leadingPadding.bottom;

          return FlexibleSpaceBar(
            expandedTitleScale: 1,
            title: AnimatedSwitcher(
              duration: MsAnimationDurations.medium,
              child: shouldShowTitle
                  ? DefaultTextStyle.merge(style: titleTextStyle, child: title)
                  : null,
            ),
            centerTitle: centerTitle,
            titlePadding: MsEdgeInsets.contentLarge,
            background: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: MsRadius.round,
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
      key: key,
    );
  }

  final Widget? title;

  final double? toolbarHeight;
  final double? collapsedHeight;
  final double? expandedHeight;

  final Widget? leading;
  final double? leadingWidth;

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

    final leadingPadding = _leadingPadding.left;

    final leading = this.leading;
    final leadingWidth =
        (this.leadingWidth ?? _leadingSize.width) + leadingPadding;

    return SliverAppBar(
      title: title,
      pinned: pinned ?? false,
      elevation: elevation,
      stretch: stretch ?? false,
      floating: floating ?? false,
      primary: primary ?? true,
      snap: snap ?? false,
      leadingWidth: max(_leadingSize.width + leadingPadding, leadingWidth),
      leading: leading != null
          ? SizedBox(
              width: _leadingSize.width,
              height: _leadingSize.height,
              child: Center(child: leading),
            )
          : null,
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
