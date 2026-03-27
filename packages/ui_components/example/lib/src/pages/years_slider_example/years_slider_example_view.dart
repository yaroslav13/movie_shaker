import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class YearsSliderExampleView extends StatefulWidget
    with LabeledWidgetMixin {
  const YearsSliderExampleView({super.key});

  @override
  State<YearsSliderExampleView> createState() => _YearsSliderExampleViewState();

  @override
  String get label => 'Years Slider Example';
}

final class _YearsSliderExampleViewState extends State<YearsSliderExampleView> {
  int _selectedStartYear = 1990;
  int _selectedEndYear = 2024;
  final int _minYear = 1900;
  final int _maxYear = 2030;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.label),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YearsSlider(
              startYear: _selectedStartYear,
              endYear: _selectedEndYear,
              minYear: _minYear,
              maxYear: _maxYear,
              onChanged: (start, end) {
                setState(() {
                  _selectedStartYear = start;
                  _selectedEndYear = end;
                });
              },
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colorScheme.outline.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected Range',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'From $_selectedStartYear to $_selectedEndYear',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Range: ${_selectedEndYear - _selectedStartYear} years',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
