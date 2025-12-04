import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

final class GlassmorphicCard extends StatefulWidget {
  const GlassmorphicCard({
    this.borderRadius,
    this.elevation,
    this.blurSigma,
    this.onTap,
    this.child,
    super.key,
  });

  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  final double? blurSigma;

  final VoidCallback? onTap;
  final Widget? child;

  @override
  State<GlassmorphicCard> createState() => _GlassmorphicCardState();
}

final class _GlassmorphicCardState extends State<GlassmorphicCard> {
  final _isPressedNotifier = ValueNotifier<bool>(false);

  void _handleTapDown(TapDownDetails details) {
    if (widget.onTap == null) {
      return;
    }

    _isPressedNotifier.value = true;
  }

  void _handleTapUp(TapUpDetails details) {
    if (widget.onTap == null) {
      return;
    }

    _isPressedNotifier.value = false;
  }

  void _handleTapCancel() {
    if (widget.onTap == null) {
      return;
    }

    _isPressedNotifier.value = false;
  }

  @override
  void dispose() {
    _isPressedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<GlassmorphicCardTheme>();

    final elevation = widget.elevation ?? theme?.elevation ?? 0;
    final borderRadius =
        widget.borderRadius ?? theme?.borderRadius ?? MsBorderRadius.large;

    final blurSigma = widget.blurSigma ?? theme?.blurSigma ?? 18;

    return ValueListenableBuilder(
      valueListenable: _isPressedNotifier,
      builder: (context, value, child) {
        return AnimatedScale(
          scale: value ? 0.96 : 1.0,
          duration: MsAnimationDurations.medium,
          curve: Curves.easeInOutCubic,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: Material(
          type: MaterialType.transparency,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: BorderSide(
              color: Theme.of(
                context,
              ).colorScheme.onInverseSurface.withValues(alpha: 0.2),
              width: 1.2,
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
            child: Padding(
              padding: MsEdgeInsets.contentMedium,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
