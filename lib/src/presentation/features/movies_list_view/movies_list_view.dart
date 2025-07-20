import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/presentation/features/movies_list_view/movie_list.dart';
import 'package:ui_components/ui_components.dart';

final class MoviesListView extends HookConsumerWidget {
  const MoviesListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(movieListProvider);

    // TODO(yhalivets): Update the UI for edge cases
    return switch (movies) {
      AsyncError() => const Center(
        child: Text('Oops, something unexpected happened'),
      ),
      AsyncData(:final value) => ListView.builder(
        padding: MsEdgeInsets.listViewMargin,
        itemBuilder: (_, index) {
          final movie = value[index];

          return MovieCard(
            margin: MsEdgeInsets.listViewItemMargin,
            imageUrl: movie.posterUrl,
            title: movie.title,
          );
        },
      ),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
