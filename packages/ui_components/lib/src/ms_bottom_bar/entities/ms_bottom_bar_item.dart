import 'package:flutter/material.dart';

@immutable
final class MsBottomBarItem {
  const MsBottomBarItem({
    required this.label,
    required this.icon,
    this.activeIcon,
    this.selectedColor,
    this.unselectedColor,
  });

  final String label;
  final Widget icon;
  final Widget? activeIcon;
  final Color? selectedColor;
  final Color? unselectedColor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MsBottomBarItem &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          icon == other.icon &&
          activeIcon == other.activeIcon &&
          selectedColor == other.selectedColor &&
          unselectedColor == other.unselectedColor;

  @override
  int get hashCode =>
      label.hashCode ^
      icon.hashCode ^
      activeIcon.hashCode ^
      selectedColor.hashCode ^
      unselectedColor.hashCode;
}
