import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/router/router_provider.dart';
import 'package:movie_shaker/src/di/theme/theme_provider.dart';

final class MovieShakerApp extends HookConsumerWidget {
  const MovieShakerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final theme = ref.watch(lightThemeProvider);

    return MaterialApp.router(
      routerConfig: router,
      theme: theme,
    );
  }
}
