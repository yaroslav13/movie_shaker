import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/presentation/features/home/home_state_notifier.dart';
import 'package:ui_components/ui_components.dart';

final class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(homeStateNotifierProvider.notifier).onStart();

      return;
    }, const []);

    return const Scaffold(body: SafeArea(child: _MoviesGridView()));
  }
}

final class _MoviesGridView extends HookConsumerWidget {
  const _MoviesGridView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateNotifierProvider);

    final suggestedMovie = state.suggestedMovie;
    useEffect(
      () {
        if (suggestedMovie != null) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Suggested movie: ${suggestedMovie.title}',
                  ),
                ),
              );
            },
          );
        }

        return;
      },
      [suggestedMovie],
    );

    if (state.hasError) {
      return const LoadingErrorStub();
    } else if (state.isLoading) {
      return const Center(child: DotsProgressIndicator());
    }

    final movies = state.movies;

    return StaggeredGridView(
      itemCount: movies.length,
      itemBuilder: (_, i) {
        final movie = movies[i];

        return MovieCard(imageUrl: movie.posterUrl, title: movie.title);
      },
    );
  }
}
