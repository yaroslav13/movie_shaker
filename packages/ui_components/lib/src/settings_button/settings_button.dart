import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_icon_button/ms_icon_button.dart';
import 'package:ui_components/ui_components.dart';

final class SettingsButton extends StatelessWidget {
  const SettingsButton({
    this.padding,
    this.backgroundColor,
    this.onPressed,
    super.key,
  });

  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SettingsButtonTheme>();
    final colorScheme = Theme.of(context).colorScheme;

    final backgroundColor =
        this.backgroundColor ??
        theme?.backgroundColor ??
        colorScheme.surfaceContainerHigh.withValues(alpha: 0.8);

    final padding = this.padding ?? theme?.padding ?? MsEdgeInsets.contentSmall;

    return MsIconButton(
      borderRadius: MsBorderRadius.round,
      padding: padding,
      backgroundColor: backgroundColor,
      icon: MsIcon.outlinedSettings(),
      onPressed: onPressed,
    );
  }
}
