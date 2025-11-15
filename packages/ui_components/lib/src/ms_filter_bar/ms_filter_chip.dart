import 'package:flutter/material.dart';
import 'package:ui_components/src/ms_filter_bar/ms_filter_chip_theme.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';
import 'package:ui_components/src/shared/ms_border_radius.dart';
import 'package:ui_components/src/shared/ms_edge_insets.dart';

final class MsFilterChip extends StatelessWidget {
  const MsFilterChip({
    required this.label,
    required this.selected,
    this.onSelected,
    this.backgroundColor,
    this.foregroundColor,
    this.selectedBackgroundColor,
    this.selectedForegroundColor,
    this.borderRadius,
    this.padding,
    this.labelStyle,
    this.showCheckmark,
    super.key,
  });

  factory MsFilterChip.text(
    String text, {
    bool selected = false,
    ValueChanged<bool>? onSelected,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? selectedBackgroundColor,
    Color? selectedForegroundColor,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    TextStyle? labelStyle,
    bool? showCheckmark,
    Key? key,
  }) {
    return MsFilterChip(
      key: key,
      label: MsText(text),
      selected: selected,
      onSelected: onSelected,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      selectedBackgroundColor: selectedBackgroundColor,
      selectedForegroundColor: selectedForegroundColor,
      borderRadius: borderRadius,
      padding: padding,
      labelStyle: labelStyle,
      showCheckmark: showCheckmark,
    );
  }

  final Widget label;
  final bool selected;
  final ValueChanged<bool>? onSelected;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? selectedBackgroundColor;
  final Color? selectedForegroundColor;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? labelStyle;
  final bool? showCheckmark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MsFilterChipTheme>();
    final colorScheme = Theme.of(context).colorScheme;

    final backgroundColor =
        this.backgroundColor ??
        theme?.backgroundColor ??
        colorScheme.surfaceContainerLowest;
    final selectedBackgroundColor =
        this.selectedBackgroundColor ??
        theme?.selectedBackgroundColor ??
        colorScheme.primaryContainer;

    final foregroundColor =
        this.foregroundColor ??
        theme?.foregroundColor ??
        colorScheme.onSurfaceVariant;
    final selectedForegroundColor =
        this.selectedForegroundColor ??
        theme?.selectedForegroundColor ??
        colorScheme.onPrimaryContainer;

    final borderRadius =
        this.borderRadius ?? theme?.borderRadius ?? MsBorderRadius.round;
    final padding =
        this.padding ?? theme?.padding ?? MsEdgeInsets.scrollableContent;
    final labelStyle =
        this.labelStyle ??
        theme?.labelStyle ??
        Theme.of(context).textTheme.labelLarge;
    final showCheckmark = this.showCheckmark ?? theme?.showCheckmark ?? true;

    return FilterChip(
      label: DefaultTextStyle.merge(
        style: labelStyle?.copyWith(
          color: selected ? selectedForegroundColor : foregroundColor,
        ),
        child: label,
      ),
      selected: selected,
      onSelected: onSelected,
      showCheckmark: showCheckmark,
      checkmarkColor: selectedForegroundColor,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      padding: padding,
      backgroundColor: backgroundColor,
      selectedColor: selectedBackgroundColor,
    );
  }
}
