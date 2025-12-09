import 'dart:async';

import 'package:movie_shaker/src/di/interactors/get_movie_suggestion_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/select_suggested_movie_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/subscribe_device_shaking_state_interactor_provider.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movies_filter/movies_filter.dart';
import 'package:movie_shaker/src/domain/entities/select_query/select_movie_query.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/entities/movie_pool.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/movie_shaker_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_shaker_state_notifier.g.dart';

@riverpod
class MovieShakerStateNotifier extends _$MovieShakerStateNotifier {
  StreamSubscription<Movie?>? _movieSuggestionSubscription;

  @override
  MovieShakerState build({
    required MoviePool pool,
  }) {
    ref.onDispose(_cancelDeviceShakingStateSubscriptions);

    return const MovieShakerState();
  }

  void onVisibilityChanged({required bool isVisible}) {
    if (isVisible) {
      _subscribeDeviceShakingState();
    } else {
      ref.invalidateSelf();
    }
  }

  void _subscribeDeviceShakingState() {
    final subscribeDeviceShakingStateInteractor = ref.read(
      subscribeDeviceShakingStateInteractorProvider,
    );

    final getMovieSuggestionInteractor = ref.read(
      getMovieSuggestionInteractorProvider,
    );

    final selectSuggestedMovieInteractor = ref.read(
      selectSuggestedMovieInteractorProvider,
    );

    _movieSuggestionSubscription ??= subscribeDeviceShakingStateInteractor()
        .asyncMap(
          (isShaking) async {
            if (!isShaking) {
              state = state.copyWith(isShaking: false);

              return null;
            }

            state = state.copyWith(isShaking: true);

            return switch (pool) {
              GlobalMoviePool(:final filter) => getMovieSuggestionInteractor(
                filter ?? const MoviesFilter(),
              ),
              LocalMoviePool(:final movies) => selectSuggestedMovieInteractor(
                SelectMovieQuery(movies: movies),
              ),
            };
          },
        )
        .listen(
          cancelOnError: false,
          (movie) => state = state.copyWith(
            suggestedMovie: movie,
            isShaking: false,
          ),
          onError: (error, stackTrace) {
            state = state.copyWith(
              suggestedMovie: null,
              isShaking: false,
            );

            // TODO(yhalivets): Show toast for user
          },
        );
  }

  void _cancelDeviceShakingStateSubscriptions() {
    _movieSuggestionSubscription?.cancel().ignore();
    _movieSuggestionSubscription = null;
  }
}
