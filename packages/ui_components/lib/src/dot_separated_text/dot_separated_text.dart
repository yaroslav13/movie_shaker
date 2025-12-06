import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

final class DotSeparatedText extends StatelessWidget {
  const DotSeparatedText({
    required this.fragments,
    this.style,
    this.dotColor,
    super.key,
  });

  final List<String> fragments;
  final TextStyle? style;
  final Color? dotColor;

  Iterable<InlineSpan> _buildChildren({
    required double dotDimension,
    Color? dotColor,
  }) sync* {
    for (var i = 0; i < fragments.length; i++) {
      yield TextSpan(text: fragments[i]);

      if (i < fragments.length - 1) {
        yield WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Padding(
            padding: MsEdgeInsets.horizontalSmall,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
              child: SizedBox.square(dimension: dotDimension),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (fragments.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context).extension<DotSeparatedTextTheme>();
    final textStyle = style ?? theme?.textStyle;
    final dotColor = this.dotColor ?? theme?.dotColor;

    final fontSize = textStyle?.fontSize ?? 14.0;
    final dotDimension = fontSize * 0.25;
    final clampedDotDimension = dotDimension.clamp(2.0, fontSize / 2);

    return Text.rich(
      TextSpan(
        style: textStyle,
        children: _buildChildren(
          dotColor: dotColor,
          dotDimension: clampedDotDimension,
        ).toList(),
      ),
    );
  }
}
