import 'dart:async';

import 'package:async/async.dart';
import 'package:movie_shaker/src/di/interactors/get_movie_suggestion_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/select_suggested_movie_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/subscribe_device_shaking_state_interactor_provider.dart';
import 'package:movie_shaker/src/domain/entities/device_shake_timing/device_shake_timing.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movies_filter/movies_filter.dart';
import 'package:movie_shaker/src/domain/entities/select_query/select_movie_query.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/entities/movie_pool.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/movie_shaker_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_shaker_state_notifier.g.dart';

@riverpod
class MovieShakerStateNotifier extends _$MovieShakerStateNotifier {
  StreamSubscription<bool>? _deviceShakingStateSubscription;
  CancelableOperation<Movie>? _movieSuggestionOperation;

  @override
  MovieShakerState build({
    required MoviePool pool,
  }) {
    ref.onDispose(_onDispose);

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

    _deviceShakingStateSubscription ??= subscribeDeviceShakingStateInteractor()
        .listen(
          (isShaking) {
            if (!isShaking) {
              _movieSuggestionOperation?.cancel().ignore();
              _movieSuggestionOperation = null;

              state = state.copyWith(isShaking: false, suggestedMovie: null);

              return;
            }

            final isRequestPending =
                _movieSuggestionOperation != null &&
                false == _movieSuggestionOperation?.isCompleted &&
                false == _movieSuggestionOperation?.isCanceled;

            if (isRequestPending) {
              return;
            }

            state = state.copyWith(isShaking: true);

            _movieSuggestionOperation =
                CancelableOperation.fromFuture(
                  Future<void>.delayed(DeviceShakeTiming.verifiedShakeDuration),
                ).then(
                  (_) {
                    return switch (pool) {
                      GlobalMoviePool(:final filter) =>
                        getMovieSuggestionInteractor(
                          filter ?? const MoviesFilter(),
                        ),
                      LocalMoviePool(:final movies) =>
                        selectSuggestedMovieInteractor(
                          SelectMovieQuery(movies: movies),
                        ),
                    };
                  },
                );

            unawaited(
              _movieSuggestionOperation?.value
                  .then(
                    (movie) {
                      state = state.copyWith(
                        suggestedMovie: movie,
                        isShaking: false,
                      );
                    },
                  )
                  .onError(
                    (_, __) {
                      state = state.copyWith(
                        isShaking: false,
                        suggestedMovie: null,
                      );
                    },
                  ),
            );
          },
        );
  }

  void _onDispose() {
    _deviceShakingStateSubscription?.cancel().ignore();
    _deviceShakingStateSubscription = null;

    _movieSuggestionOperation?.cancel().ignore();
  }
}
