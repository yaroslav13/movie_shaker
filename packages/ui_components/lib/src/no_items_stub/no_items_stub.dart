import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:lottie/lottie.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';
import 'package:ui_components/src/shared/assets.gen.dart';

final class NoItemsStub extends StatelessWidget {
  factory NoItemsStub.noFavorites({
    bool useSafeArea = true,
    TextStyle? descriptionStyle,
    TextStyle? captionStyle,
    Key? key,
  }) {
    return NoItemsStub._(
      animationJson: MsAssets.animations.noFavoritesMoviesAnimation,
      descriptionBuilder: (context) =>
          context.localizations.needsMoreBlockbusters,
      captionBuilder: (context) => context.localizations.tapTheHeart,
      useSafeArea: useSafeArea,
      descriptionStyle: descriptionStyle,
      captionStyle: captionStyle,
      key: key,
    );
  }

  factory NoItemsStub.noMovies({
    bool useSafeArea = true,
    TextStyle? descriptionStyle,
    TextStyle? captionStyle,
    Key? key,
  }) {
    return NoItemsStub._(
      animationJson: MsAssets.animations.noMoviesFoundAnimation,
      descriptionBuilder: (context) =>
          context.localizations.itSeemsSomebodyStoleAllMovies,
      captionBuilder: (context) => context.localizations.noCluesFound,
      useSafeArea: useSafeArea,
      descriptionStyle: descriptionStyle,
      captionStyle: captionStyle,
      key: key,
    );
  }

  factory NoItemsStub.noCollections({
    bool useSafeArea = true,
    TextStyle? descriptionStyle,
    TextStyle? captionStyle,
    Key? key,
  }) {
    return NoItemsStub._(
      animationJson: MsAssets.animations.noCollectionsAnimation,
      descriptionBuilder: (context) =>
          context.localizations.doNotLetYourFavoritesGatherDust,
      captionBuilder: (context) =>
          context.localizations.startCuratingMustWatchLists,
      useSafeArea: useSafeArea,
      descriptionStyle: descriptionStyle,
      captionStyle: captionStyle,
      key: key,
    );
  }

  factory NoItemsStub.noSelectionAvailable({
    bool useSafeArea = true,
    TextStyle? descriptionStyle,
    TextStyle? captionStyle,
    Key? key,
  }) {
    return NoItemsStub._(
      animationJson: MsAssets.animations.noChoiceAnimation,
      descriptionBuilder: (context) =>
          context.localizations.itSeemsWeDoNotHaveAChoice,
      captionBuilder: (context) =>
          context.localizations.createACollectionToSaveMovies,
      useSafeArea: useSafeArea,
      descriptionStyle: descriptionStyle,
      captionStyle: captionStyle,
      key: key,
    );
  }

  const NoItemsStub._({
    required this.animationJson,
    required this.descriptionBuilder,
    required this.captionBuilder,
    this.useSafeArea = true,
    this.descriptionStyle,
    this.captionStyle,
    super.key,
  });

  final String animationJson;

  final String Function(BuildContext context) descriptionBuilder;
  final String Function(BuildContext context) captionBuilder;

  final bool useSafeArea;
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
      top: useSafeArea,
      bottom: useSafeArea,
      child: Padding(
        padding: MsEdgeInsets.scaffoldBodyPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: MsSpacings.large,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: _CentralContent(
                  description: descriptionBuilder(context),
                  animationJson: animationJson,
                  descriptionStyle: descriptionStyle,
                ),
              ),
            ),
            MsText(
              captionBuilder(context),
              textAlign: TextAlign.center,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}

final class _CentralContent extends StatelessWidget {
  const _CentralContent({
    required this.description,
    required this.animationJson,
    this.descriptionStyle,
  });

  final String description;
  final String animationJson;

  final TextStyle? descriptionStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: MsSpacings.medium,
      children: [
        Flexible(
          child: Padding(
            padding: MsEdgeInsets.horizontalLarge,
            child: Lottie.asset(animationJson),
          ),
        ),
        MsText(
          description,
          textAlign: TextAlign.center,
          style: descriptionStyle,
        ),
      ],
    );
  }
}
