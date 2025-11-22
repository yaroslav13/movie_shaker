import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:lottie/lottie.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';
import 'package:ui_components/src/no_items_stub/no_items_stub_theme.dart';
import 'package:ui_components/src/shared/assets.gen.dart';
import 'package:ui_components/src/shared/ms_edge_insets.dart';
import 'package:ui_components/src/shared/ms_spacings.dart';

final class NoItemsStub extends StatelessWidget {
  factory NoItemsStub.noFavorites({
    TextStyle? descriptionStyle,
    TextStyle? captionStyle,
    Key? key,
  }) {
    return NoItemsStub._(
      animationJson: MsAssets.animations.noFavoritesMoviesAnimation,
      descriptionBuilder: (context) =>
          context.localizations.needsMoreBlockbusters,
      captionBuilder: (context) => context.localizations.tapTheHeart,
      descriptionStyle: descriptionStyle,
      captionStyle: captionStyle,
      key: key,
    );
  }

  factory NoItemsStub.noMovies({
    TextStyle? descriptionStyle,
    TextStyle? captionStyle,
    Key? key,
  }) {
    return NoItemsStub._(
      animationJson: MsAssets.animations.noMoviesFoundAnimation,
      descriptionBuilder: (context) =>
          context.localizations.itSeemsSomebodyStoleAllMovies,
      captionBuilder: (context) => context.localizations.noCluesFound,
      descriptionStyle: descriptionStyle,
      captionStyle: captionStyle,
      key: key,
    );
  }

  const NoItemsStub._({
    required this.animationJson,
    required this.descriptionBuilder,
    required this.captionBuilder,
    this.descriptionStyle,
    this.captionStyle,
    super.key,
  });

  final String animationJson;

  final String Function(BuildContext context) descriptionBuilder;
  final String Function(BuildContext context) captionBuilder;

  final TextStyle? descriptionStyle;
  final TextStyle? captionStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<NoItemsStubTheme>();
    final descriptionStyle =
        this.descriptionStyle ??
        theme?.descriptionStyle ??
        Theme.of(context).textTheme.titleLarge;

    final captionStyle =
        this.captionStyle ??
        theme?.captionStyle ??
        Theme.of(context).textTheme.bodySmall;

    return SafeArea(
      child: Center(
        child: Padding(
          padding: MsEdgeInsets.scaffoldBody,
          child: Column(
            spacing: MsSpacings.large,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Padding(
                padding: MsEdgeInsets.horizontalLarge,
                child: Lottie.asset(animationJson),
              ),
              MsText(
                descriptionBuilder(context),
                textAlign: TextAlign.center,
                style: descriptionStyle,
              ),
              const Spacer(),
              MsText(
                captionBuilder(context),
                textAlign: TextAlign.center,
                style: captionStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
