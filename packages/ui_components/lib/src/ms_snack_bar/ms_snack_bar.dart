import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

final class MsSnackBar extends StatelessWidget {
  const MsSnackBar.content({
    required this.icon,
    required this.title,
    this.foregroundColor,
    this.titleStyle,
    super.key,
  });

  final Widget icon;
  final String title;

  final Color? foregroundColor;
  final TextStyle? titleStyle;

  static SnackBar error(BuildContext context, String title) {
    final theme = Theme.of(context).extension<MsSnackBarTheme>();
    final style = theme?.variantStyles[MsSnackBarVariant.error];

    return _createSnackBar(
      context: context,
      icon: MsIcon.outlinedError(),
      title: title,
      foregroundColor: style?.foregroundColor,
      backgroundColor: style?.backgroundColor,
    );
  }

  static SnackBar _createSnackBar({
    required BuildContext context,
    required Widget icon,
    required String title,
    Color? foregroundColor,
    Color? backgroundColor,
  }) {
    final theme = Theme.of(context).extension<MsSnackBarTheme>();
    final textStyle = theme?.textStyle;
    final shape =
        theme?.shape ??
        const RoundedRectangleBorder(borderRadius: MsBorderRadius.regular);

    final padding = theme?.padding ?? MsEdgeInsets.contentMedium;

    final elevation = theme?.elevation;

    return SnackBar(
      backgroundColor: backgroundColor,
      shape: shape,
      behavior: SnackBarBehavior.floating,
      padding: padding,
      elevation: elevation,
      showCloseIcon: false,
      content: MsSnackBar.content(
        icon: icon,
        title: title,
        foregroundColor: foregroundColor,
        titleStyle: textStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MsSnackBarTheme>();
    final iconTheme = Theme.of(context).iconTheme;

    final textStyle =
        titleStyle ??
        theme?.textStyle ??
        Theme.of(context).textTheme.bodyMedium;

    return Row(
      spacing: MsSpacings.medium,
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            iconTheme: iconTheme.copyWith(color: foregroundColor),
          ),
          child: icon,
        ),
        Expanded(
          child: DefaultTextStyle.merge(
            style: textStyle?.copyWith(color: foregroundColor),
            child: MsText(title),
          ),
        ),
      ],
    );
  }
}
