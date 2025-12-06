import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_card/ms_card.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';
import 'package:ui_components/src/shared/assets.gen.dart';

const _animationSize = Size.square(60);

final class GenreCard extends StatelessWidget {
  const GenreCard({
    required this.genre,
    this.margin = MsEdgeInsets.zero,
    this.titleStyle,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    super.key,
  });

  final EdgeInsetsGeometry? margin;
  final String genre;

  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  String _pickAnimationJson() {
    final snakeCaseGenre = genre.toLowerCase().replaceAll(' ', '_');

    return MsAssets.animations.genreAnimations.values.firstWhere(
      (animationJsonPath) {
        final fileName = animationJsonPath.split('/').last;
        final nameWithoutExtension = fileName.split('.').first;

        return nameWithoutExtension == snakeCaseGenre;
      },
      orElse: () => MsAssets.animations.genreAnimations.genreDefault,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<GenreCardTheme>();

    final backgroundColor = this.backgroundColor ?? theme?.backgroundColor;

    final elevation = this.elevation ?? theme?.elevation;

    final borderRadius = this.borderRadius ?? theme?.borderRadius;

    final titleStyle = this.titleStyle ?? theme?.titleStyle;

    return MsCard.icon(
      margin: margin,
      backgroundColor: backgroundColor,
      elevation: elevation,
      borderRadius: borderRadius,
      icon: Lottie.asset(
        _pickAnimationJson(),
        height: _animationSize.height,
        width: _animationSize.width,
        fit: BoxFit.contain,
      ),
      title: MsText(genre, style: titleStyle),
    );
  }
}
