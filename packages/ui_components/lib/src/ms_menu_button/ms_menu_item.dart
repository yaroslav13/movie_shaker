import 'package:flutter/material.dart';

@immutable
final class MsMenuItem {
  const MsMenuItem({
    required this.title,
    this.onTap,
    this.icon,
  });

  final String title;
  final IconData? icon;
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
