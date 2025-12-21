import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

final class RemoveBottomSheet extends StatelessWidget {
  const RemoveBottomSheet({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MsTextButtonTheme>();
    final viewPadding = MediaQuery.viewPaddingOf(context);

    return SizedBox(
      width: double.infinity,
      child: MsTextButton.text(
        padding: theme?.padding?.add(
          EdgeInsets.only(bottom: viewPadding.bottom),
        ),
        onPressed: onPressed,
        text: context.localizations.remove,
      ),
    );
  }
}
