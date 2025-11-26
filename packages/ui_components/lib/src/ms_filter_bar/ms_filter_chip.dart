import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';

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
        colorScheme.surfaceContainerLowest;

    final borderRadius =
        this.borderRadius ?? theme?.borderRadius ?? MsBorderRadius.round;
    final padding =
        this.padding ?? theme?.padding ?? MsEdgeInsets.contentMedium;
    final labelStyle = this.labelStyle ?? theme?.labelStyle;

    final onSelected = this.onSelected;

    final effectiveBackgroundColor = selected
        ? selectedBackgroundColor
        : backgroundColor;
    final effectiveForegroundColor = selected
        ? selectedForegroundColor
        : foregroundColor;

    return Semantics(
      selected: selected,
      button: true,
      child: AnimatedContainer(
        duration: MsAnimationDurations.short,
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: borderRadius,
          border: Border.all(color: colorScheme.outlineVariant),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: borderRadius is BorderRadius ? borderRadius : null,
            onTap: onSelected != null ? () => onSelected(!selected) : null,
            splashColor: colorScheme.primary.withValues(alpha: 0.10),
            child: Padding(
              padding: padding,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultTextStyle.merge(
                    style: labelStyle?.copyWith(
                      color: effectiveForegroundColor,
                    ),
                    child: label,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
