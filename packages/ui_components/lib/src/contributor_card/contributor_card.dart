import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_card/ms_card.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';

final class ContributorCard extends StatelessWidget {
  const ContributorCard({
    required this.photoUrl,
    required this.name,
    this.character,
    this.nameStyle,
    this.characterStyle,
    this.captionBackgroundColor,
    this.captionForegroundColor,
    this.elevation,
    this.borderRadius,
    super.key,
  });

  final String photoUrl;
  final String name;
  final String? character;

  final TextStyle? nameStyle;
  final TextStyle? characterStyle;

  final Color? captionBackgroundColor;
  final Color? captionForegroundColor;

  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ContributorCardTheme>();
    final nameStyle = this.nameStyle ?? theme?.nameTextStyle;
    final characterStyle = this.characterStyle ?? theme?.characterTextStyle;
    final captionBackgroundColor =
        this.captionBackgroundColor ?? theme?.captionBackgroundColor;
    final captionForegroundColor =
        this.captionForegroundColor ?? theme?.captionForegroundColor;
    final elevation = this.elevation ?? theme?.elevation ?? 0.0;
    final borderRadius =
        this.borderRadius ?? theme?.borderRadius ?? BorderRadius.zero;

    return MsCard(
      margin: MsEdgeInsets.zero,
      elevation: elevation,
      borderRadius: borderRadius,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          CachedNetworkImage(
            imageUrl: photoUrl,
            fit: BoxFit.fitHeight,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _CaptionBar(
              name: name,
              character: character,
              nameStyle: nameStyle,
              characterStyle: characterStyle,
              captionBackgroundColor: captionBackgroundColor,
              captionForegroundColor: captionForegroundColor,
            ),
          ),
        ],
      ),
    );
  }
}

final class _CaptionBar extends StatelessWidget {
  const _CaptionBar({
    required this.name,
    this.character,
    this.nameStyle,
    this.characterStyle,
    this.captionBackgroundColor,
    this.captionForegroundColor,
  });

  final String name;
  final String? character;

  final TextStyle? nameStyle;
  final TextStyle? characterStyle;

  final Color? captionBackgroundColor;
  final Color? captionForegroundColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: captionBackgroundColor),
      child: Padding(
        padding: EdgeInsets.only(
          left: MsEdgeInsets.contentMedium.left,
          right: MsEdgeInsets.contentMedium.right,
          top: MsEdgeInsets.contentSmall.top,
          bottom: MsEdgeInsets.contentSmall.bottom,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              MsText(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: nameStyle?.copyWith(
                  color: captionForegroundColor,
                ),
                textAlign: TextAlign.center,
              ),
              if (character case final character?)
                MsText(
                  character,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: characterStyle?.copyWith(
                    color: captionForegroundColor,
                  ),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
