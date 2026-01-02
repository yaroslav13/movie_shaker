import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

@immutable
final class MsMenuItem {
  const MsMenuItem({
    required this.title,
    this.onTap,
    this.icon,
    this.foregroundColor,
  });

  factory MsMenuItem.like({
    required String title,
    VoidCallback? onTap,
    Color? foregroundColor,
  }) {
    return MsMenuItem(
      title: title,
      onTap: onTap,
      foregroundColor: foregroundColor,
      icon: HugeIcons.strokeRoundedFavourite,
    );
  }

  factory MsMenuItem.bookmark({
    required String title,
    VoidCallback? onTap,
    Color? foregroundColor,
  }) {
    return MsMenuItem(
      title: title,
      onTap: onTap,
      foregroundColor: foregroundColor,
      icon: HugeIcons.strokeRoundedAllBookmark,
    );
  }

  final String title;
  final IconData? icon;
  final Color? foregroundColor;
  final VoidCallback? onTap;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is MsMenuItem &&
        other.title == title &&
        other.icon == icon &&
        other.onTap == onTap;
  }

  @override
  int get hashCode => title.hashCode ^ icon.hashCode ^ onTap.hashCode;
}
