import 'dart:async';

import 'package:logger/logger.dart';
import 'package:movie_shaker/src/di/interactors/get_movies_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/search_movies_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/subscribe_movie_suggestions_interactor_provider.dart';
import 'package:movie_shaker/src/di/logger/logger_provider.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';
import 'package:movie_shaker/src/domain/entities/search_query/search_query.dart';
import 'package:movie_shaker/src/presentation/features/home/home_state.dart';
import 'package:movie_shaker/src/utils/logger_mixin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui_components/ui_components.dart';

part 'home_state_notifier.g.dart';

const _initialPageNumber = 1;

@riverpod
class HomeStateNotifier extends _$HomeStateNotifier with LoggerMixin {
  StreamSubscription<Movie>? _movieSuggestionsSubscription;

  @override
  HomeState build() {
    ref.onDispose(
      () => _movieSuggestionsSubscription?.cancel().ignore(),
    );

    return const HomeState(
      paginationState: PaginationState(isLoading: true),
    );
  }

  @override
  Logger get logger => ref.read(loggerProvider);

  void onStart() {
    unawaited(_fetchMovies(_initialPageNumber));
  }

  void onPullToRefresh() {
    info('Refreshing movies...');

    unawaited(_fetchMovies(_initialPageNumber));
  }

  void onReloadPressed() {
    info('Refreshing movies...');

    unawaited(_fetchMovies(_initialPageNumber));
  }

  void onMoviesGridViewBottomReached() {
    final pageNumber = state.paginationState.pagesCount + 1;
    unawaited(_fetchMovies(pageNumber));
  }

  void onSearchInputChanged(String query) {
    info('Search input changed: $query');

    state = state.copyWith(searchQuery: query);

    unawaited(_fetchMovies(_initialPageNumber));
  }

  Future<void> _fetchMovies(PageNumber pageNumber) async {
    try {
      info('Fetching movies...');

      final getMoviesInteractor = ref.read(getMoviesInteractorProvider);
      final searchMoviesInteractor = ref.read(searchMoviesInteractorProvider);

      final moviesPage = state.searchQuery.isEmpty
          ? await getMoviesInteractor(pageNumber)
          : await searchMoviesInteractor(
              SearchQuery(query: state.searchQuery, page: pageNumber),
            );

      final paginationState = state.paginationState;

      final pages = paginationState.pages ?? [];
      final keys = paginationState.keys ?? [];

      final indexOfPageKey = keys.indexOf(moviesPage.pageNumber);

      final newPages = indexOfPageKey != -1
          ? [
              ...pages.take(indexOfPageKey),
              moviesPage.items,
            ]
          : [...pages, moviesPage.items];

      final newKeys = indexOfPageKey != -1
          ? [
              ...keys.take(indexOfPageKey),
              moviesPage.pageNumber,
            ]
          : [...keys, moviesPage.pageNumber];

      final newPaginationState = paginationState.copyWith(
        isLoading: false,
        pages: newPages,
        keys: newKeys,
        hasNextPage: !moviesPage.isLastPage,
      );

      state = state.copyWith(paginationState: newPaginationState);

      _subscribeMovieSuggestions(newPaginationState.items);
    } on Exception catch (e, s) {
      error('Error fetching movies:', e, s);

      state = state.copyWith(
        paginationState: state.paginationState.copyWith(
          isLoading: false,
          error: e,
        ),
      );
    }
  }

  void _subscribeMovieSuggestions(List<Movie> movies) {
    final subscribeMovieSuggestionsInteractor = ref.read(
      subscribeMovieSuggestionsInteractorProvider,
    );

    _movieSuggestionsSubscription ??= subscribeMovieSuggestionsInteractor()
        .listen(
          (movie) {
            state = state.copyWith(suggestedMovie: movie);
          },
        );
  }
}
