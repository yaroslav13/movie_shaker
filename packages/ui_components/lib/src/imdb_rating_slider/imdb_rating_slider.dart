import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';

final class ImdbRatingSlider extends StatelessWidget {
  const ImdbRatingSlider({
    required this.rating,
    required this.minRating,
    required this.maxRating,
    this.activeColor,
    this.inactiveColor,
    this.headlineStyle,
    this.valuesStyle,
    this.onChanged,
    super.key,
  });

  final double rating;
  final double minRating;
  final double maxRating;

  final Color? activeColor;
  final Color? inactiveColor;
  final TextStyle? headlineStyle;
  final TextStyle? valuesStyle;

  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ImdbRatingSliderTheme>();
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
          rating: rating,
          headlineStyle: headlineStyle,
          valuesStyle: valuesStyle,
        ),
        SfSlider(
          min: minRating,
          max: maxRating,
          value: rating,
          stepSize: 0.1,
          enableTooltip: true,
          tooltipTextFormatterCallback: (dynamic actualValue, formattedText) {
            return '${(actualValue as num).toStringAsFixed(1)}+';
          },
          showLabels: true,
          labelFormatterCallback: (dynamic actualValue, formattedText) {
            return (actualValue as num).toStringAsFixed(0);
          },
          interval: (maxRating - minRating) / 2,
          activeColor: activeColor ?? colorScheme.primary,
          inactiveColor:
              inactiveColor ?? colorScheme.outline.withValues(alpha: 0.3),
          onChanged: (dynamic value) =>
              onChanged?.call(_roundToOneDecimal(value as double)),
        ),
      ],
    );
  }
}

double _roundToOneDecimal(double value) {
  return (value * 10).roundToDouble() / 10;
}

final class _Headline extends StatelessWidget {
  const _Headline({
    required this.rating,
    this.headlineStyle,
    this.valuesStyle,
  });

  final double rating;

  final TextStyle? headlineStyle;
  final TextStyle? valuesStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MsText(context.localizations.imdbRating, style: headlineStyle),
        MsText('${rating.toStringAsFixed(1)}+', style: valuesStyle),
      ],
    );
  }
}
