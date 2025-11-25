import 'package:flutter/material.dart';
import 'package:ui_components/src/ms_floating_action_button/ms_floating_action_button_theme.dart';
import 'package:ui_components/src/ms_icon/ms_icon.dart';

final class MsFloatingActionButton extends StatelessWidget {
  const MsFloatingActionButton({
    super.key,
    this.onPressed,
    this.child,
    this.elevation,
    this.backgroundColor,
    this.foregroundColor,
    this.shape,
  });

  // Might be related to HugeIcons issue that it ignore IconThemeData
  factory MsFloatingActionButton.add(
    BuildContext context, {
    VoidCallback? onPressed,
    double? elevation,
    Color? backgroundColor,
    Color? foregroundColor,
    ShapeBorder? shape,
    Key? key,
  }) {
    final theme = Theme.of(context).extension<MsFloatingActionButtonTheme>();
    final iconColor = foregroundColor ?? theme?.foregroundColor;

    return MsFloatingActionButton(
      key: key,
      onPressed: onPressed,
      elevation: elevation,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      shape: shape,
      child: MsIcon.add(color: iconColor),
    );
  }

  final VoidCallback? onPressed;
  final Widget? child;

  final double? elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MsFloatingActionButtonTheme>();

    final elevation = this.elevation ?? theme?.elevation;
    final backgroundColor = this.backgroundColor ?? theme?.backgroundColor;
    final foregroundColor = this.foregroundColor ?? theme?.foregroundColor;
    final shape = this.shape ?? theme?.shape;

    return FloatingActionButton(
      onPressed: onPressed,
      elevation: elevation,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      shape: shape,
      child: child,
    );
  }
}
