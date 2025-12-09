import 'dart:async';

import 'package:logger/logger.dart';
import 'package:movie_shaker/src/di/interactors/get_movie_genres_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/get_movies_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/search_movies_interactor_provider.dart';
import 'package:movie_shaker/src/di/logger/logger_provider.dart';
import 'package:movie_shaker/src/domain/entities/genre/genre.dart';
import 'package:movie_shaker/src/domain/entities/movies_filter/movies_filter.dart';
import 'package:movie_shaker/src/domain/entities/movies_query/movies_query.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';
import 'package:movie_shaker/src/domain/entities/search_query/search_query.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/presentation/features/home/home_state.dart';
import 'package:movie_shaker/src/utils/logger_mixin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ui_components/ui_components.dart';

part 'home_state_notifier.g.dart';

const _initialPageNumber = 1;

@riverpod
class HomeStateNotifier extends _$HomeStateNotifier with LoggerMixin {
  @override
  HomeState build() {
    return const HomeState(
      paginationState: PaginationState(isLoading: true),
    );
  }

  @override
  Logger get logger => ref.read(loggerProvider);

  void onStart() {
    unawaited(_fetchMovies(_initialPageNumber));
    unawaited(_fetchMovieGenres());
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

  void onGenreSelected(Genre? genre) {
    info('Genre selected: ${genre?.name}');

    state = state.copyWith(selectedGenre: genre);

    unawaited(_fetchMovies(_initialPageNumber));
  }

  Future<void> _fetchMovies(PageNumber pageNumber) async {
    try {
      info('Fetching movies...');

      final getMoviesInteractor = ref.read(getMoviesInteractorProvider);
      final searchMoviesInteractor = ref.read(searchMoviesInteractorProvider);

      final filter = MoviesFilter(
        genres: [?state.selectedGenre],
      );

      final moviesPage = state.searchQuery.isEmpty
          ? await getMoviesInteractor(
              MoviesQuery(
                pageNumber: pageNumber,
                filter: filter,
              ),
            )
          : await searchMoviesInteractor(
              FilterRichSearchQuery(
                query: state.searchQuery,
                page: pageNumber,
                filter: filter,
              ),
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
    } on SemanticException catch (e, s) {
      error('Error fetching movies:', e, s);

      state = state.copyWith(
        paginationState: state.paginationState.copyWith(
          isLoading: false,
          error: e,
        ),
      );
    }
  }

  Future<void> _fetchMovieGenres() async {
    try {
      info('Fetching movie genres...');

      final getMovieGenresInteractor = ref.read(
        getMovieGenresInteractorProvider,
      );

      final genres = await getMovieGenresInteractor();

      state = state.copyWith(availableGenres: genres);
    } on SemanticException catch (e, s) {
      error('Error fetching movie genres:', e, s);
    }
  }
}
