import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';
import 'package:movie_shaker/src/presentation/features/home/home_state_notifier.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ui_components/ui_components.dart';

const _moviesSearchDebounceTime = Duration(milliseconds: 200);

final class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final inputStreamController = useStreamController<String>();

    useEffect(
      () {
        ref.read(homeStateNotifierProvider.notifier).onStart();

        return;
      },
      const [],
    );

    useEffect(
      () {
        final searchInputListener = () {
          final input = searchController.text;
          inputStreamController.add(input);
        };

        searchController.addListener(searchInputListener);

        return () {
          searchController.removeListener(searchInputListener);
        };
      },
      const [],
    );

    useEffect(
      () {
        final subscription = inputStreamController.stream
            .debounceTime(_moviesSearchDebounceTime)
            .listen((input) {
              ref
                  .read(homeStateNotifierProvider.notifier)
                  .onSearchInputChanged(input);
            });

        return () async {
          await subscription.cancel();
          await inputStreamController.close();
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

  void _onMovieSuggested(BuildContext context, Movie movie) {
    final isHomeOpened =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath ==
        const HomeRoute().location;

    if (!isHomeOpened) {
      return;
    }

    MovieDetailsRoute(id: movie.id).go(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateNotifierProvider);

    final suggestedMovie = state.suggestedMovie;
    useEffect(
      () {
        if (suggestedMovie != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _onMovieSuggested(context, suggestedMovie);
          });
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
            action: LikeButton(
              isLiked: true,
              onChanged: (isLiked) {
                /// TODO: Implement like/unlike functionality
              },
            ),
            imageUrl: movie.posterUrl,
            onTap: () => _onMovieSelected(context, movie),
          );
        },
      ),
    );
  }
}
