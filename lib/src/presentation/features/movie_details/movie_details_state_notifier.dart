import 'dart:async';

import 'package:movie_shaker/src/di/interactors/get_movie_details_by_id_interactor_provider.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/presentation/features/movie_details/movie_details_state.dart';
import 'package:movie_shaker/src/utils/logger_mixin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_details_state_notifier.g.dart';

@riverpod
class MovieDetailsStateNotifier extends _$MovieDetailsStateNotifier
    with LoggerMixin {
  @override
  MovieDetailsState build() => const MovieDetailsState.loading();

  void onStart(int movieId) {
    info('MovieDetailsStateNotifier started');

    unawaited(_fetchMovieDetails(movieId));
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
      );
    } on AppException catch (e, s) {
      error('Error fetching movie details', e, s);

      state = MovieDetailsState.error(e);
    }
  }
}
