import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/glassmorphic_card/glassmorphic_card.dart';
import 'package:ui_components/src/ms_icon/ms_icon.dart';
import 'package:ui_components/src/ms_menu_button/ms_menu_item.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';

const _verticalMenuPadding = MsSpacings.regular;

final class MsMenuButton extends StatelessWidget {
  const MsMenuButton({
    required this.items,
    this.foregroundColor,
    this.itemTextStyle,
    super.key,
  });

  final List<MsMenuItem> items;
  final TextStyle? itemTextStyle;
  final Color? foregroundColor;

  Iterable<PopupMenuEntry<MsMenuItem>> _buildMenuEntryList(
    List<MsMenuItem> items, {
    Color? foregroundColor,
    TextStyle? textStyle,
  }) sync* {
    for (final item in items) {
      yield _MsMenuEntry(
        item: item,
        foregroundColor: foregroundColor,
        textStyle: textStyle,
      );

      if (item != items.last) {
        yield const _MsMenuDivider();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MsMenuButtonTheme>();
    final foregroundColor =
        this.foregroundColor ??
        theme?.foregroundColor ??
        Theme.of(context).colorScheme.onPrimary;

    return GlassmorphicCard(
      onTap: () => _showMenu(
        context,
        foregroundColor: foregroundColor,
      ).ignore(),
      child: MsIcon.menu(color: foregroundColor),
    );
  }

  Future<void> _showMenu(
    BuildContext context, {
    Color? foregroundColor,
  }) async {
    final renderObject = context.findRenderObject();

    if (renderObject is! RenderBox) {
      return;
    }

    final renderBox = renderObject;

    final overlayRenderObject = Overlay.of(context).context.findRenderObject();

    if (overlayRenderObject is! RenderBox) {
      return;
    }

    final overlayBox = overlayRenderObject;

    final topLeft = renderBox.localToGlobal(Offset.zero, ancestor: overlayBox);
    final bottomRight = renderBox.localToGlobal(
      renderBox.size.bottomRight(Offset.zero),
      ancestor: overlayBox,
    );

    const itemBaseHeight = kMinInteractiveDimension;
    final menuDesiredHeight =
        (itemBaseHeight + _verticalMenuPadding) * items.length;

    final availableAbove = topLeft.dy;
    final menuHeight = math.max(
      0,
      math.min(menuDesiredHeight, availableAbove),
    );

    final left = topLeft.dx;
    final top = topLeft.dy - menuHeight;
    final right = overlayBox.size.width - bottomRight.dx;
    final bottom = overlayBox.size.height - topLeft.dy;

    final position = RelativeRect.fromLTRB(
      left,
      top,
      right,
      bottom,
    );

    final theme = Theme.of(context).extension<MsMenuButtonTheme>();
    final textStyle = itemTextStyle ?? theme?.textStyle;

    final selectedItem = await showMenu<MsMenuItem>(
      context: context,
      position: position,
      menuPadding: EdgeInsets.zero,
      shadowColor: Colors.transparent,
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: MsBorderRadius.extraLarge,
      ),
      items: _buildMenuEntryList(
        items,
        foregroundColor: foregroundColor,
        textStyle: textStyle,
      ).toList(),
    );

    if (selectedItem != null) {
      selectedItem.onTap?.call();
    }
  }
}

final class _MsMenuEntry extends PopupMenuEntry<MsMenuItem> {
  const _MsMenuEntry({
    required this.item,
    this.foregroundColor,
    this.textStyle,
  });

  final MsMenuItem item;
  final Color? foregroundColor;
  final TextStyle? textStyle;

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(MsMenuItem? value) => value == item;

  @override
  State<StatefulWidget> createState() => _MsMenuEntryState();
}

final class _MsMenuEntryState extends State<_MsMenuEntry> {
  @override
  Widget build(BuildContext context) {
    final icon = widget.item.icon;
    final foregroundColor =
        widget.item.foregroundColor ?? widget.foregroundColor;

    final resolvedStyle = widget.textStyle?.copyWith(
      color: foregroundColor,
    );

    return SizedBox(
      height: widget.height,
      child: GlassmorphicCard(
        onTap: () => Navigator.of(context).pop<MsMenuItem>(widget.item),
        child: Row(
          spacing: MsSpacings.regular,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon case final icon?)
              MsIcon(
                icon,
                color: foregroundColor,
              ),
            MsText(
              widget.item.title,
              style: resolvedStyle,
            ),
          ],
        ),
      ),
    );
  }
}

final class _MsMenuDivider extends PopupMenuEntry<Never> {
  const _MsMenuDivider();

  @override
  double get height => _verticalMenuPadding;

  @override
  bool represents(void value) => false;

  @override
  State<StatefulWidget> createState() => _MsMenuDividerState();
}

final class _MsMenuDividerState extends State<_MsMenuDivider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: widget.height);
  }
}
