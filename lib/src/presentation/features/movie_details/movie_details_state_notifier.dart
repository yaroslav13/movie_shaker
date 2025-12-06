import 'dart:async';

import 'package:logger/logger.dart';
import 'package:movie_shaker/src/di/interactors/get_movie_details_by_id_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/open_movie_homepage_interactor_provider.dart';
import 'package:movie_shaker/src/di/logger/logger_provider.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/movie_homepage_unavailable_exception.dart';
import 'package:movie_shaker/src/presentation/features/movie_details/movie_details_state.dart';
import 'package:movie_shaker/src/utils/logger_mixin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_details_state_notifier.g.dart';

@riverpod
class MovieDetailsStateNotifier extends _$MovieDetailsStateNotifier
    with LoggerMixin {
  @override
  MovieDetailsState build() => const MovieDetailsState.loading();

  @override
  Logger get logger => ref.read(loggerProvider);

  void onStart(int movieId) {
    info('MovieDetailsStateNotifier started');

    unawaited(_fetchMovieDetails(movieId));
  }

  void onRetryPressed(int movieId) {
    info('Retrying to fetch movie details for movieId: $movieId');

    state = const MovieDetailsState.loading();

    unawaited(_fetchMovieDetails(movieId));
  }

  void onWatchButtonPressed(String homepageUrl) {
    info('Watch button pressed, launching movie homepage: $homepageUrl');

    unawaited(_launchMovieHomepage(homepageUrl));
  }

  Future<void> _fetchMovieDetails(int movieId) async {
    try {
      final getMovieDetailsByIdInteractor = ref.read(
        getMovieDetailsByIdInteractorProvider,
      );

      info('Fetching movie details for movieId: $movieId');

      final movieDetails = await getMovieDetailsByIdInteractor(movieId);

      state = MovieDetailsState.data(
        title: movieDetails.title,
        posterUrl: movieDetails.posterUrl,
        overview: movieDetails.overview,
        runtime: movieDetails.runtime,
        voteAverage: movieDetails.voteAverage,
        releaseDate: movieDetails.releaseDate,
        homepageUrl: movieDetails.homepageUrl,
        popularity: movieDetails.popularity,
        genres: movieDetails.genres,
      );
    } on SemanticException catch (e, s) {
      error('Error fetching movie details', e, s);

      state = MovieDetailsState.error(e);
    }
  }

  Future<void> _launchMovieHomepage(String url) async {
    try {
      final openMovieHomepageInteractor = ref.read(
        openMovieHomepageInteractorProvider,
      );

      await openMovieHomepageInteractor(url);
    } on MovieHomepageUnavailableException {
      //TODO(yhalivets): Show error message to user
    }
  }
}
