import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/glassmorphic_card/glassmorphic_card.dart';
import 'package:ui_components/src/ms_icon/ms_icon.dart';
import 'package:ui_components/src/ms_menu_button/ms_menu_item.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';

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

    final left = topLeft.dx;
    final top = topLeft.dy - renderBox.size.height - MsSpacings.regular;
    final right = overlayBox.size.width - bottomRight.dx;
    final bottom = overlayBox.size.height - topLeft.dy + MsSpacings.regular;

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
      color: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: MsBorderRadius.extraLarge,
      ),
      items: items.map((item) {
        return _MsMenuEntry(
          item: item,
          foregroundColor: foregroundColor,
          textStyle: textStyle,
        );
      }).toList(),
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
    final resolvedStyle = widget.textStyle?.copyWith(
      color: widget.foregroundColor,
    );

    return GlassmorphicCard(
      onTap: () => Navigator.of(context).pop<MsMenuItem>(widget.item),
      child: Row(
        spacing: MsSpacings.regular,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon case final icon?)
            MsIcon(
              icon,
              color: widget.foregroundColor,
            ),
          MsText(
            widget.item.title,
            style: resolvedStyle,
          ),
        ],
      ),
    );
  }
}
