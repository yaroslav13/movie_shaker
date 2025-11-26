import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_bottom_bar/entities/ms_bottom_bar_item.dart';

const _defaultItemPadding = EdgeInsets.symmetric(vertical: 10, horizontal: 16);

const _defaultMargin = EdgeInsets.all(8);

final class MsBottomBar extends StatelessWidget {
  const MsBottomBar({
    required this.items,
    required this.currentTabIndex,
    required this.onTabSelected,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.itemPadding,
    this.margin,
    super.key,
  });

  final List<MsBottomBarItem> items;
  final int currentTabIndex;
  final ValueChanged<int> onTabSelected;

  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final EdgeInsets? itemPadding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MsBottomBarTheme>();

    final selectedItemColor =
        this.selectedItemColor ?? theme?.selectedItemColor;
    final unselectedItemColor =
        this.unselectedItemColor ?? theme?.unselectedItemColor;

    final itemPadding = this.itemPadding ?? theme?.itemPadding;
    final margin = this.margin ?? theme?.margin;

    return Theme(
      data: Theme.of(
        context,
      ).copyWith(iconTheme: IconThemeData(color: selectedItemColor)),
      child: SalomonBottomBar(
        currentIndex: currentTabIndex,
        onTap: onTabSelected,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        itemPadding: itemPadding ?? _defaultItemPadding,
        margin: margin ?? _defaultMargin,
        items: items
            .map(
              (item) => SalomonBottomBarItem(
                icon: item.icon,
                title: Text(item.label),
                selectedColor: item.selectedColor,
                unselectedColor: item.unselectedColor,
                activeIcon: item.activeIcon,
              ),
            )
            .toList(),
      ),
    );
  }
}
