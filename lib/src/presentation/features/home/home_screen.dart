import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';
import 'package:movie_shaker/src/presentation/features/home/home_state_notifier.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:ui_components/ui_components.dart';

final class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();

    useEffect(() {
      ref.read(homeStateNotifierProvider.notifier).onStart();

      return;
    }, const []);

    useEffect(
      () {
        final searchInputListener = () {
          ref
              .read(homeStateNotifierProvider.notifier)
              .onSearchInputChanged(searchController.text);
        };

        searchController.addListener(searchInputListener);

        return () {
          searchController.removeListener(searchInputListener);
        };
      },
      const [],
    );

    return Scaffold(
      appBar: MsAppBar.searchBar(
        title: context.localizations.movieShaker,
        controller: searchController,
      ),
      body: const SafeArea(
        child: _MoviesGridView(),
      ),
    );
  }
}

final class _MoviesGridView extends HookConsumerWidget {
  const _MoviesGridView();

  void _onMovieSelected(BuildContext context, Movie movie) {
    MovieDetailsRoute(id: movie.id).go(context);
  }

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

    return PullToRefreshWidget(
      onRefresh: () async =>
          ref.read(homeStateNotifierProvider.notifier).onPullToRefresh(),
      child: PagedStaggeredGridView<Movie>(
        paginationState: state.paginationState,
        onNextPage: () => ref
            .read(homeStateNotifierProvider.notifier)
            .onMoviesGridViewBottomReached(),
        onReload: () =>
            ref.read(homeStateNotifierProvider.notifier).onReloadPressed(),
        itemBuilder: (_, movie, index) {
          return MovieCard(
            imageUrl: movie.posterUrl,
            title: movie.title,
            onTap: () => _onMovieSelected(context, movie),
          );
        },
      ),
    );
  }
}
