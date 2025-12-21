import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_icon_button/ms_icon_button.dart';

final class DeleteButton extends StatelessWidget {
  const DeleteButton({
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    super.key,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<DeleteButtonTheme>();
    final colorScheme = Theme.of(context).colorScheme;

    final foregroundColor =
        this.foregroundColor ??
        theme?.foregroundColor ??
        colorScheme.onInverseSurface;

    final backgroundColor =
        this.backgroundColor ??
        theme?.backgroundColor ??
        colorScheme.surfaceContainerHigh.withValues(alpha: 0.8);

    return MsIconButton.delete(
      padding: MsEdgeInsets.contentMedium,
      borderRadius: MsBorderRadius.round,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      onPressed: onPressed,
    );
  }
}
