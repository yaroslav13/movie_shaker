import 'package:example/src/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:theme/theme.dart';

final class UiKitApplication extends StatelessWidget {
  const UiKitApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UiComponents Demo',
      theme: MsTheme.light(),
      localizationsDelegates: context.localizationsDelegates,
      supportedLocales: context.supportedLocales,
      home: const MainScreen(title: 'UiComponents Demo'),
    );
  }
}
