import 'package:example/src/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

final class UiKitApplication extends StatelessWidget {
  const UiKitApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UiComponents Demo',
      theme: MsTheme.light(),
      home: const MainScreen(title: 'UiComponents Demo'),
    );
  }
}
