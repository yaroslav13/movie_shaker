import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:ui_components/src/loading_error_stub/loading_error_stub_theme.dart';
import 'package:ui_components/src/shared/ms_edge_insets.dart';

final class LoadingErrorStub extends StatelessWidget {
  const LoadingErrorStub({this.description, super.key});

  final String? description;

  @override
  Widget build(BuildContext context) {
    final materialTextTheme = Theme.of(context).textTheme;

    final theme = Theme.of(context).extension<LoadingErrorStubTheme>();
    final textStyle = theme?.textStyle ?? materialTextTheme.titleLarge;

    return Center(
      child: Padding(
        padding: MsEdgeInsets.scaffoldBody,
        child: Text(
          description ?? AppLocalizations.of(context)!.somethingWentWrong,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
