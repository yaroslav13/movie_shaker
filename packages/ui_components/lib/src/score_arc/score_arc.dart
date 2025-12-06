import 'dart:math';

import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';

final class ScoreArc extends StatelessWidget {
  const ScoreArc({
    required this.value,
    this.labelBuilder,
    this.trackColor,
    this.strokeWidth,
    this.valueColors,
    this.labelStyle,
    super.key,
  }) : assert(
         value >= 0 && value <= 10,
         'Value must be between 0.0 and 10.0. Provided: $value',
       ),
       assert(
         valueColors == null || valueColors.length > 0,
         'valueColors list cannot be empty if provided.',
       );

  final double value;
  final String Function(double)? labelBuilder;

  final Color? trackColor;
  final double? strokeWidth;
  final List<Color>? valueColors;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ScoreArcTheme>();
    final colorScheme = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 1,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: value),
        duration: MsAnimationDurations.medium,
        curve: Curves.easeOutCubic,
        builder: (context, value, child) {
          final valueColors =
              this.valueColors ??
              theme?.valueColors ??
              [colorScheme.error, colorScheme.secondary];

          final trackColor =
              this.trackColor ??
              theme?.trackColor ??
              colorScheme.surfaceContainerLow;

          final strokeWidth = this.strokeWidth ?? theme?.strokeWidth ?? 10.0;

          final labelStyle =
              this.labelStyle ??
              theme?.labelStyle ??
              Theme.of(context).textTheme.labelLarge;

          final index = ((value / 10) * valueColors.length).floor();

          final barColor = valueColors[index.clamp(0, valueColors.length - 1)];

          return Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(
                painter: _OpenArcPainter(
                  score: value,
                  barColor: barColor,
                  backgroundColor: trackColor,
                  strokeWidth: strokeWidth,
                ),
              ),
              Center(
                child: MsText(
                  labelBuilder?.call(value) ?? value.toStringAsFixed(1),
                  style: labelStyle,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

final class _OpenArcPainter extends CustomPainter {
  _OpenArcPainter({
    required this.score,
    required this.barColor,
    required this.backgroundColor,
    required this.strokeWidth,
  });

  final double score;
  final Color barColor;
  final Color backgroundColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - (strokeWidth / 2);

    const startAngle = 135 * (pi / 180);
    const fullSweep = 270 * (pi / 180);

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      fullSweep,
      false,
      backgroundPaint,
    );

    final progressPaint = Paint()
      ..color = barColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final progressSweep = (score / 10) * fullSweep;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      progressSweep,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
