import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

final class MsElevatedButton extends StatelessWidget {
  const MsElevatedButton({
    required this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.elevation,
    this.padding,
    this.textStyle,
    super.key,
  });

  factory MsElevatedButton.text({
    required String text,
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    BorderRadiusGeometry? borderRadius,
    double? elevation,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
    Key? key,
  }) {
    return MsElevatedButton(
      key: key,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      borderRadius: borderRadius,
      elevation: elevation,
      padding: padding,
      textStyle: textStyle,
      child: MsText(text),
    );
  }

  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MsElevatedButtonTheme>();
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

    final textStyle = this.textStyle ?? theme?.textStyle;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        elevation: elevation,
        padding: padding,
        textStyle: textStyle,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
