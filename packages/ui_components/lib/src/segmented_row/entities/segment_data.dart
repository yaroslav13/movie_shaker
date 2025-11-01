import 'package:flutter/material.dart';

@immutable
final class SegmentData {
  const SegmentData({
    this.icon,
    this.label,
    this.caption,
  });

  final Widget? icon;
  final String? label;
  final String? caption;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is SegmentData &&
        other.icon == icon &&
        other.label == label &&
        other.caption == caption;
  }

  @override
  int get hashCode => icon.hashCode ^ label.hashCode ^ caption.hashCode;
}
