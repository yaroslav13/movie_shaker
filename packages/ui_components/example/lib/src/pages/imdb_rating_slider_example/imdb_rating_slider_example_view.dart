import 'package:example/src/utils/labeled_widget_mixin.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class ImdbRatingSliderExampleView extends StatefulWidget
    with LabeledWidgetMixin {
  const ImdbRatingSliderExampleView({super.key});

  @override
  State<ImdbRatingSliderExampleView> createState() =>
      _ImdbRatingSliderExampleViewState();

  @override
  String get label => 'IMDB Rating Slider Example';
}

final class _ImdbRatingSliderExampleViewState
    extends State<ImdbRatingSliderExampleView> {
  double _selectedRating = 7.0;
  final double _minRating = 0;
  final double _maxRating = 10;

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
            ImdbRatingSlider(
              rating: _selectedRating,
              minRating: _minRating,
              maxRating: _maxRating,
              onChanged: (rating) {
                setState(() {
                  _selectedRating = rating;
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
                    'Selected Rating',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${_selectedRating.toStringAsFixed(1)}+ on IMDB',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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
