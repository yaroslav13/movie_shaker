import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

final class WatchButton extends StatelessWidget {
  const WatchButton({
    this.foregroundColor,
    this.textStyle,
    this.onPressed,
    super.key,
  });

  final Color? foregroundColor;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<WatchButtonTheme>();

    final foregroundColor = this.foregroundColor ?? theme?.foregroundColor;
    final textStyle = this.textStyle ?? theme?.textStyle;

    return GlassmorphicCard(
      onTap: onPressed,
      child: Row(
        spacing: MsSpacings.xSmall,
        mainAxisSize: MainAxisSize.min,
        children: [
          MsIcon.outlinedPlay(color: foregroundColor),
          MsText(
            context.localizations.watchNow.toUpperCase(),
            style: textStyle?.copyWith(color: foregroundColor),
          ),
        ],
      ),
    );
  }
}
