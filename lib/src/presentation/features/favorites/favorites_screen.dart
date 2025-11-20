import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/presentation/features/favorites/favorites_state.dart';
import 'package:movie_shaker/src/presentation/features/favorites/favorites_state_notifier.dart';
import 'package:ui_components/ui_components.dart';

final class FavoritesScreen extends HookConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(favoritesStateNotifierProvider);

    useEffect(
      () {
        ref.read(favoritesStateNotifierProvider.notifier).onStart();

        return;
      },
      const [],
    );

    return Scaffold(
      body: SafeArea(
        child: switch (state) {
          FavoritesStateLoading() => const Center(
            child: GlassesProgressIndicator(),
          ),
          FavoritesStateData(:final favoriteMovies) => MovieCarousel(
            itemCount: favoriteMovies.length,
            itemBuilder: (_, index) => MovieCard.expanded(
              imageUrl: favoriteMovies[index].posterUrl,
            ),
          ),
          FavoritesStateError() => const LoadingErrorStub(),
        },
      ),
    );
  }
}
