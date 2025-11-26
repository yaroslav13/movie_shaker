import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_icon/ms_icon.dart';

final class MsIconButton extends StatelessWidget {
  const MsIconButton({
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.elevation,
    this.padding,
    super.key,
  });

  factory MsIconButton.close({
    EdgeInsetsGeometry? padding,
    VoidCallback? onPressed,
  }) {
    return MsIconButton(
      padding: padding,
      icon: MsIcon.cancel(),
      onPressed: onPressed,
    );
  }

  factory MsIconButton.retry({
    VoidCallback? onPressed,
  }) {
    return MsIconButton(
      icon: MsIcon.refresh(),
      onPressed: onPressed,
    );
  }

  factory MsIconButton.back({
    EdgeInsetsGeometry? padding,
    VoidCallback? onPressed,
  }) {
    return MsIconButton(
      padding: padding,
      icon: MsIcon.arrowLeft(),
      onPressed: onPressed,
    );
  }

  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final EdgeInsetsGeometry? padding;

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MsIconButtonTheme>();
    final colorScheme = Theme.of(context).colorScheme;

    final backgroundColor =
        this.backgroundColor ?? theme?.backgroundColor ?? colorScheme.primary;
    final foregroundColor =
        this.foregroundColor ?? theme?.foregroundColor ?? colorScheme.onPrimary;

    final borderRadius =
        this.borderRadius ??
        theme?.borderRadius ??
        const BorderRadius.all(Radius.circular(8));

    final padding = this.padding ?? theme?.padding ?? const EdgeInsets.all(16);

    final elevation = this.elevation ?? theme?.elevation ?? 8.0;

    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        elevation: elevation,
        padding: padding,
      ),
      onPressed: onPressed,
      icon: icon,
    );
  }
}
