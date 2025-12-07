import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:movie_shaker/src/di/router/router_provider.dart';
import 'package:movie_shaker/src/di/theme/theme_provider.dart';

final class MovieShakerApp extends HookConsumerWidget {
  const MovieShakerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    ).ignore();

    final router = ref.watch(routerProvider);
    final theme = ref.watch(lightThemeProvider);

    return MaterialApp.router(
      routerConfig: router,
      localizationsDelegates: context.localizationsDelegates,
      supportedLocales: context.supportedLocales,
      theme: theme,
      builder: (_, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
