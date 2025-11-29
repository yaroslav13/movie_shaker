import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';

final class MsListTile extends StatelessWidget {
  const MsListTile({
    required this.title,
    this.leading,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.titleStyle,
    this.subtitleStyle,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.semanticLabel,
    super.key,
  });

  factory MsListTile.simple({
    required String title,
    Widget? leading,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    String? semanticLabel,
    Key? key,
  }) {
    return MsListTile(
      title: MsText(title),
      leading: leading,
      subtitle: subtitle != null ? MsText(subtitle) : null,
      trailing: trailing,
      onTap: onTap,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      padding: padding,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  factory MsListTile.rectangular({
    required String title,
    Widget? leading,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    String? semanticLabel,
    Key? key,
  }) {
    return MsListTile.simple(
      title: title,
      leading: leading,
      subtitle: subtitle,
      trailing: trailing,
      onTap: onTap,
      backgroundColor: backgroundColor,
      borderRadius: MsBorderRadius.zero,
      padding: padding,
      semanticLabel: semanticLabel,
      key: key,
    );
  }

  final Widget title;
  final Widget? leading;
  final Widget? subtitle;
  final Widget? trailing;

  final VoidCallback? onTap;

  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;

  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MsListTileTheme>();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final borderRadius =
        this.borderRadius ?? theme?.borderRadius ?? MsBorderRadius.regular;
    final padding =
        this.padding ?? theme?.padding ?? MsEdgeInsets.contentMedium;
    final backgroundColor =
        this.backgroundColor ??
        theme?.backgroundColor ??
        colorScheme.surfaceContainerHighest;

    final titleStyle =
        this.titleStyle ?? theme?.titleStyle ?? textTheme.bodyLarge;
    final subtitleStyle =
        this.subtitleStyle ?? theme?.subtitleStyle ?? textTheme.bodyMedium;

    final leading = this.leading;
    final subtitle = this.subtitle;
    final trailing = this.trailing;

    return Semantics(
      label: semanticLabel,
      button: onTap != null,
      enabled: onTap != null,
      child: AnimatedOpacity(
        duration: MsAnimationDurations.medium,
        opacity: onTap != null ? 1.0 : 0.6,
        child: Stack(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: borderRadius as BorderRadius?,
              ),
              child: Padding(
                padding: padding,
                child: Row(
                  children: [
                    if (leading != null) ...[
                      leading,
                      const SizedBox(width: MsSpacings.regular),
                    ],
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DefaultTextStyle.merge(
                            style: titleStyle,
                            child: title,
                          ),
                          if (subtitle != null) ...[
                            const SizedBox(height: MsSpacings.xxSmall),
                            DefaultTextStyle.merge(
                              style: subtitleStyle,
                              child: subtitle,
                            ),
                          ],
                        ],
                      ),
                    ),
                    if (trailing != null) ...[
                      const SizedBox(width: MsSpacings.regular),
                      trailing,
                    ],
                  ],
                ),
              ),
            ),
            if (onTap != null)
              Positioned.fill(
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    borderRadius: borderRadius is BorderRadius
                        ? borderRadius
                        : null,
                    onTap: onTap,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
