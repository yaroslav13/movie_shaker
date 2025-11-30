import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_icon/ms_icon.dart';
import 'package:ui_components/src/ms_icon_button/ms_icon_button.dart';

final class RoundedBackButton extends StatelessWidget {
  const RoundedBackButton({
    this.foregroundColor,
    this.backgroundColor,
    this.onPressed,
    super.key,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<RoundedBackButtonTheme>();

    final foregroundColor = this.foregroundColor ?? theme?.foregroundColor;
    final backgroundColor = this.backgroundColor ?? theme?.backgroundColor;

    return MsIconButton(
      padding: MsEdgeInsets.contentMedium,
      borderRadius: MsBorderRadius.round,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      icon: MsIcon.arrowLeft(),
      onPressed: onPressed,
    );
  }
}
