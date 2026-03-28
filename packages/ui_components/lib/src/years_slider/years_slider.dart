import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';

final class YearsSlider extends StatelessWidget {
  const YearsSlider({
    required this.startYear,
    required this.endYear,
    required this.minYear,
    required this.maxYear,
    this.activeColor,
    this.inactiveColor,
    this.headlineStyle,
    this.valuesStyle,
    this.onChanged,
    super.key,
  });

  final int startYear;
  final int endYear;
  final int minYear;
  final int maxYear;

  final Color? activeColor;
  final Color? inactiveColor;
  final TextStyle? headlineStyle;
  final TextStyle? valuesStyle;

  final void Function(int start, int end)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<YearsSliderTheme>();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final activeColor = this.activeColor ?? theme?.activeColor;
    final inactiveColor = this.inactiveColor ?? theme?.inactiveColor;

    final headlineStyle =
        this.headlineStyle ??
        theme?.headlineStyle ??
        textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        );

    final valuesStyle =
        this.valuesStyle ??
        theme?.valuesStyle ??
        textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: colorScheme.primary,
        );

    return Column(
      spacing: MsSpacings.medium,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Headline(
          startYear: startYear,
          endYear: endYear,
          headlineStyle: headlineStyle,
          valuesStyle: valuesStyle,
        ),
        SfRangeSlider(
          min: minYear.toDouble(),
          max: maxYear.toDouble(),
          values: SfRangeValues(
            startYear.toDouble(),
            endYear.toDouble(),
          ),
          enableTooltip: true,
          tooltipTextFormatterCallback: (dynamic actualValue, formattedText) {
            return '${(actualValue as num).round()}';
          },
          activeColor: activeColor ?? colorScheme.primary,
          inactiveColor:
              inactiveColor ?? colorScheme.outline.withValues(alpha: 0.3),
          onChanged: (values) => onChanged?.call(
            (values.start as double).round(),
            (values.end as double).round(),
          ),
        ),
      ],
    );
  }
}

final class _Headline extends StatelessWidget {
  const _Headline({
    required this.startYear,
    required this.endYear,
    this.headlineStyle,
    this.valuesStyle,
  });

  final int startYear;
  final int endYear;

  final TextStyle? headlineStyle;
  final TextStyle? valuesStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MsText(context.localizations.releaseYear, style: headlineStyle),
        MsText('$startYear - $endYear', style: valuesStyle),
      ],
    );
  }
}
