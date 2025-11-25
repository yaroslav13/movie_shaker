import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:movie_shaker/src/presentation/features/movie_collections/movie_collections_state.dart';
import 'package:movie_shaker/src/presentation/features/movie_collections/movie_collections_state_notifier.dart';
import 'package:ui_components/ui_components.dart';

final class MovieCollectionsScreen extends HookConsumerWidget {
  const MovieCollectionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(movieCollectionsStateNotifierProvider);

    useEffect(
      () {
        ref.read(movieCollectionsStateNotifierProvider.notifier).onStart();

        return;
      },
      const [],
    );

    return Scaffold(
      floatingActionButton: MsFloatingActionButton.add(context),
      body: SafeArea(
        child: switch (state) {
          MovieCollectionsStateLoading() => Center(
            child: MsProgressIndicator.moviePosters(),
          ),
          MovieCollectionsStateError() => const LoadingErrorStub(),
          MovieCollectionsStateData() => StaggeredGridView.largeSpacing(
            noItemsBuilder: (_) => NoItemsStub.noCollections(),
            itemCount: state.collections.length,
            itemBuilder: (_, index) {
              final collection = state.collections[index];

              return MovieCollectionCard(
                title: collection.name,
                subtitle: context.localizations.moviesCount(
                  collection.moviesCount,
                ),
                posterUrls: collection.movies
                    .map((movie) => movie.posterUrl)
                    .toList(),
              );
            },
          ),
        },
      ),
    );
  }
}
