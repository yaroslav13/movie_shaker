import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:lottie/lottie.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/src/loading_error_stub/entities/loading_error_stub_type.dart';
import 'package:ui_components/src/ms_elevated_button/ms_elevated_button.dart';
import 'package:ui_components/src/ms_icon_button/ms_icon_button.dart';
import 'package:ui_components/src/ms_text/ms_text.dart';
import 'package:ui_components/src/shared/assets.gen.dart';

final class LoadingErrorStub extends StatelessWidget {
  const LoadingErrorStub({
    this.type = LoadingErrorStubType.vertical,
    this.useSafeArea = true,
    this.description,
    this.onRetry,
    this.textStyle,
    super.key,
  });

  final LoadingErrorStubType type;
  final String? description;
  final TextStyle? textStyle;
  final bool useSafeArea;

  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final materialTextTheme = Theme.of(context).textTheme;

    final theme = Theme.of(context).extension<LoadingErrorStubTheme>();
    final textStyle =
        this.textStyle ?? theme?.textStyle ?? materialTextTheme.titleLarge;

    final description = this.description ?? context.localizations.aChillingBooo;

    return SafeArea(
      top: useSafeArea,
      bottom: useSafeArea,
      child: switch (type) {
        LoadingErrorStubType.vertical => _VerticalLoadingErrorStub(
          description: description,
          onRetry: onRetry,
          textStyle: textStyle,
        ),
        LoadingErrorStubType.horizontal => _HorizontalLoadingErrorStub(
          description: description,
          onRetry: onRetry,
          textStyle: textStyle,
        ),
      },
    );
  }
}

final class _VerticalLoadingErrorStub extends StatelessWidget {
  const _VerticalLoadingErrorStub({
    required this.description,
    required this.onRetry,
    required this.textStyle,
  });

  final String description;
  final TextStyle? textStyle;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MsEdgeInsets.scaffoldBodyPadding,
      child: Column(
        spacing: MsSpacings.large,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: _VerticalContent(
                description: description,
                textStyle: textStyle,
              ),
            ),
          ),
          MsElevatedButton(
            onPressed: onRetry,
            child: MsText(context.localizations.tryAgain),
          ),
        ],
      ),
    );
  }
}

final class _HorizontalLoadingErrorStub extends StatelessWidget {
  const _HorizontalLoadingErrorStub({
    required this.description,
    required this.onRetry,
    required this.textStyle,
  });

  final String description;
  final TextStyle? textStyle;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MsEdgeInsets.scaffoldBodyPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: MsText(
              description,
              style: textStyle,
              textAlign: TextAlign.start,
            ),
          ),
          MsIconButton.retry(onPressed: onRetry),
        ],
      ),
    );
  }
}

class _VerticalContent extends StatelessWidget {
  const _VerticalContent({
    required this.description,
    required this.textStyle,
  });

  final String description;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: MsSpacings.medium,
      children: [
        Flexible(
          child: Padding(
            padding: MsEdgeInsets.horizontalLarge,
            child: Lottie.asset(MsAssets.animations.booAnimation),
          ),
        ),
        MsText(
          description,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
