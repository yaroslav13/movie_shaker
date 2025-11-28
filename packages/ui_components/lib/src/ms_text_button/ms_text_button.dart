import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

final class MsTextButton extends StatelessWidget {
  const MsTextButton({
    required this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.padding,
    this.textStyle,
    this.icon,
    super.key,
  });

  factory MsTextButton.text({
    required String text,
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
    Widget? icon,
    Key? key,
  }) {
    return MsTextButton(
      key: key,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      borderRadius: borderRadius,
      padding: padding,
      textStyle: textStyle,
      icon: icon,
      child: MsText(text.toUpperCase()),
    );
  }

  final Widget child;
  final VoidCallback? onPressed;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MsTextButtonTheme>();
    final colorScheme = Theme.of(context).colorScheme;

    final backgroundColor = this.backgroundColor ?? theme?.backgroundColor;
    final foregroundColor =
        this.foregroundColor ?? theme?.foregroundColor ?? colorScheme.primary;
    final borderRadius =
        this.borderRadius ?? theme?.borderRadius ?? MsBorderRadius.regular;
    final padding = this.padding ?? theme?.padding ?? MsEdgeInsets.contentLarge;
    final textStyle = this.textStyle ?? theme?.textStyle;

    final style = TextButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      padding: padding,
      textStyle: textStyle,
    );

    if (icon != null) {
      return TextButton.icon(
        style: style,
        onPressed: onPressed,
        icon: icon,
        label: child,
      );
    }

    return TextButton(
      style: style,
      onPressed: onPressed,
      child: child,
    );
  }
}
