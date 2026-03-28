import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class MovieDurationSliderExampleView extends StatefulWidget
    with LabeledWidgetMixin {
  const MovieDurationSliderExampleView({super.key});

  @override
  State<MovieDurationSliderExampleView> createState() =>
      _MovieDurationSliderExampleViewState();

  @override
  String get label => 'Movie Duration Slider Example';
}

final class _MovieDurationSliderExampleViewState
    extends State<MovieDurationSliderExampleView> {
  int _selectedMinutes = 120;
  final int _minMinutes = 30;
  final int _maxMinutes = 240;

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
            MovieDurationSlider(
              minutes: _selectedMinutes,
              minMinutes: _minMinutes,
              maxMinutes: _maxMinutes,
              onChanged: (minutes) {
                setState(() {
                  _selectedMinutes = minutes;
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
                    'Selected Duration',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Up to $_selectedMinutes minutes',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${_selectedMinutes ~/ 60}h ${_selectedMinutes % 60}m',
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
