import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_icon_button/ms_icon_button.dart';
import 'package:ui_components/ui_components.dart';

final class LikeButton extends StatelessWidget {
  const LikeButton({
    required this.isLiked,
    this.onChanged,
    this.likedColor,
    this.unlikedColor,
    this.backgroundColor,
    super.key,
  });

  final bool isLiked;
  final ValueChanged<bool>? onChanged;

  final Color? likedColor;
  final Color? unlikedColor;
  final Color? backgroundColor;

  Widget _transitionBuilder(Widget child, Animation<double> animation) {
    return ScaleTransition(
      key: ValueKey<Key?>(child.key),
      scale: animation,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<LikeButtonTheme>();
    final colorScheme = Theme.of(context).colorScheme;

    final likedColor =
        this.likedColor ?? theme?.likedColor ?? colorScheme.error;
    final unlikedColor =
        this.unlikedColor ??
        theme?.unlikedColor ??
        colorScheme.onInverseSurface;
    final backgroundColor =
        this.backgroundColor ??
        theme?.backgroundColor ??
        colorScheme.surfaceContainerHigh.withValues(alpha: 0.8);

    final onChanged = this.onChanged;

    return MsIconButton(
      borderRadius: MsBorderRadius.round,
      padding: MsEdgeInsets.contentSmall,
      backgroundColor: backgroundColor,
      icon: AnimatedSwitcher(
        duration: MsAnimationDurations.medium,
        transitionBuilder: _transitionBuilder,
        child: MsIcon.outlinedFavorite(
          key: ValueKey<bool>(isLiked),
          color: isLiked ? likedColor : unlikedColor,
        ),
      ),
      onPressed: onChanged != null ? () => onChanged.call(!isLiked) : null,
    );
  }
}
