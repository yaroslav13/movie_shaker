import 'dart:async';

import 'package:movie_shaker/src/di/interactors/get_movies_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/subscribe_movie_suggestions_interactor_provider.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';
import 'package:movie_shaker/src/presentation/features/home/home_state.dart';
import 'package:movie_shaker/src/utils/logger_mixin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_state_notifier.g.dart';

@riverpod
class HomeStateNotifier extends _$HomeStateNotifier with LoggerMixin {
  StreamSubscription<Movie>? _movieSuggestionsSubscription;

  @override
  HomeState build() {
    ref.onDispose(
      () => _movieSuggestionsSubscription?.cancel().ignore(),
    );

    return const HomeState(isLoading: true);
  }

  void onStart() {
    unawaited(_fetchMovies());
  }

  Future<void> _fetchMovies() async {
    try {
      info('Fetching movies...');

      final getMoviesInteractor = ref.read(getMoviesInteractorProvider);

      final movies = await getMoviesInteractor();
      state = state.copyWith(isLoading: false, movies: movies);
      _subscribeMovieSuggestions(movies);
    } on Exception catch (e, s) {
      error('Error fetching movies:', e, s);

      state = state.copyWith(isLoading: false, hasError: true);
    }
  }

  void _subscribeMovieSuggestions(List<Movie> movies) {
    final subscribeMovieSuggestionsInteractor = ref.read(
      subscribeMovieSuggestionsInteractorProvider,
    );

    _movieSuggestionsSubscription ??=
        subscribeMovieSuggestionsInteractor(
          movies,
        ).listen(
          (movie) {
            state = state.copyWith(suggestedMovie: movie);
          },
        );
  }
}
