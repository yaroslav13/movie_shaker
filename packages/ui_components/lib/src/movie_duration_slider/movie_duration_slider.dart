import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';

final class MovieDurationSlider extends StatelessWidget {
  const MovieDurationSlider({
    required this.minutes,
    required this.minMinutes,
    required this.maxMinutes,
    this.activeColor,
    this.inactiveColor,
    this.headlineStyle,
    this.valuesStyle,
    this.onChanged,
    super.key,
  });

  final int minutes;
  final int minMinutes;
  final int maxMinutes;

  final Color? activeColor;
  final Color? inactiveColor;
  final TextStyle? headlineStyle;
  final TextStyle? valuesStyle;

  final ValueChanged<int>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MovieDurationSliderTheme>();
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
          minutes: minutes,
          headlineStyle: headlineStyle,
          valuesStyle: valuesStyle,
        ),
        SfSlider(
          min: minMinutes.toDouble(),
          max: maxMinutes.toDouble(),
          value: minutes.toDouble(),
          enableTooltip: true,
          tooltipTextFormatterCallback: (dynamic actualValue, formattedText) {
            final value = (actualValue as num).round();
            return '< ${_formatDuration(value)}';
          },
          showLabels: true,
          labelFormatterCallback: (dynamic actualValue, formattedText) {
            final value = (actualValue as num).round();
            if (value >= maxMinutes) {
              return '${maxMinutes ~/ 60}h+';
            }
            return _formatDuration(value);
          },
          interval: (maxMinutes - minMinutes) / 2,
          activeColor: activeColor ?? colorScheme.primary,
          inactiveColor:
              inactiveColor ?? colorScheme.outline.withValues(alpha: 0.3),
          onChanged: (dynamic value) =>
              onChanged?.call((value as double).round()),
        ),
      ],
    );
  }
}

String _formatDuration(int totalMinutes) {
  final hours = totalMinutes ~/ 60;
  final minutes = totalMinutes % 60;

  if (hours == 0) {
    return '${minutes}m';
  }
  if (minutes == 0) {
    return '${hours}h';
  }
  return '${hours}h ${minutes}m';
}

final class _Headline extends StatelessWidget {
  const _Headline({
    required this.minutes,
    this.headlineStyle,
    this.valuesStyle,
  });

  final int minutes;

  final TextStyle? headlineStyle;
  final TextStyle? valuesStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MsText(context.localizations.movieDuration, style: headlineStyle),
        MsText('< ${_formatDuration(minutes)}', style: valuesStyle),
      ],
    );
  }
}
