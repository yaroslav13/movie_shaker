import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_card/ms_card.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';

enum _ScoreRepresentation {
  emoji,
  text,
}

const _peekDuration = Duration(seconds: 3);

final class PopularityScoreCard extends StatefulWidget {
  const PopularityScoreCard({
    required this.score,
    required this.description,
    this.scoreStyle,
    this.descriptionStyle,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    super.key,
  });

  final double score;
  final String description;

  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  final TextStyle? scoreStyle;
  final TextStyle? descriptionStyle;

  @override
  State<PopularityScoreCard> createState() => _PopularityScoreCardState();
}

final class _PopularityScoreCardState extends State<PopularityScoreCard> {
  final _scoreRepresentationNotifier = ValueNotifier(
    _ScoreRepresentation.emoji,
  );
  Timer? _revealTimer;

  void _onEmojiTap() {
    _revealTimer?.cancel();

    _scoreRepresentationNotifier.value = _ScoreRepresentation.text;

    _revealTimer ??= Timer(_peekDuration, _onRevealTimeout);
  }

  void _onRevealTimeout() {
    _scoreRepresentationNotifier.value = _ScoreRepresentation.emoji;
    _revealTimer = null;
  }

  (String, String) _getPopularityLevel(double score) {
    final localizations = context.localizations;

    return switch (score) {
      >= 500.0 => ('🌋', localizations.popularityViralLabel),
      >= 100.0 => ('🔥', localizations.popularityHighLabel),
      >= 40.0 => ('⚡', localizations.popularityMediumLabel),
      >= 10.0 => ('✨', localizations.popularityLowLabel),
      _ => ('🧊', localizations.popularityNoneLabel),
    };
  }

  Widget _transitionBuilder(Widget child, Animation<double> animation) {
    return ScaleTransition(scale: animation, child: child);
  }

  @override
  void dispose() {
    _scoreRepresentationNotifier.dispose();
    _revealTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PopularityScoreCardTheme>();
    final textTheme = Theme.of(context).textTheme;

    final backgroundColor =
        widget.backgroundColor ??
        theme?.backgroundColor ??
        Theme.of(context).colorScheme.surface;

    final elevation = widget.elevation ?? theme?.elevation ?? 8.0;
    final borderRadius =
        widget.borderRadius ?? theme?.borderRadius ?? MsBorderRadius.large;
    final descriptionStyle =
        widget.descriptionStyle ??
        theme?.descriptionStyle ??
        textTheme.titleLarge;

    final scoreStyle =
        widget.scoreStyle ?? theme?.scoreStyle ?? textTheme.displayMedium;

    final scoreFontSize =
        scoreStyle?.fontSize ?? textTheme.displayLarge?.fontSize ?? 48.0;

    return MsCard.icon(
      margin: MsEdgeInsets.zero,
      backgroundColor: backgroundColor,
      elevation: elevation,
      borderRadius: borderRadius,
      icon: ValueListenableBuilder(
        valueListenable: _scoreRepresentationNotifier,
        builder: (context, value, child) {
          final (emoji, label) = _getPopularityLevel(widget.score);

          return AnimatedSwitcher(
            duration: MsAnimationDurations.medium,
            transitionBuilder: _transitionBuilder,
            child: value == _ScoreRepresentation.emoji
                ? Center(
                    key: ValueKey<String>('Emoji_${widget.score}'),
                    child: GestureDetector(
                      onTap: _onEmojiTap,
                      child: MsText(
                        emoji,
                        style: scoreStyle?.copyWith(
                          fontSize: scoreFontSize * 2,
                        ),
                      ),
                    ),
                  )
                : Center(
                    key: ValueKey<String>('Text_${widget.score}'),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: MsText(
                        label,
                        style: scoreStyle,
                      ),
                    ),
                  ),
          );
        },
      ),
      title: MsText(
        widget.description,
        style: descriptionStyle,
      ),
    );
  }
}
