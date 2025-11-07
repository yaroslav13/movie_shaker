import 'dart:async';

import 'package:logger/logger.dart';
import 'package:movie_shaker/src/di/interactors/check_is_movie_liked_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/like_movie_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/unlike_movie_interactor_provider.dart';
import 'package:movie_shaker/src/di/logger/logger_provider.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/presentation/features/like_movie/movie_like_state.dart';
import 'package:movie_shaker/src/utils/logger_mixin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_like_state_notifier.g.dart';

@riverpod
class MovieLikeStateNotifier extends _$MovieLikeStateNotifier with LoggerMixin {
  @override
  MovieLikeState build({required Movie movie}) {
    return const MovieLikeState(isLiked: false);
  }

  @override
  Logger get logger => ref.read(loggerProvider);

  void onStart() {
    unawaited(_checkIsMovieLiked());
  }

  Future<void> onLikeStateChanged({
    required bool isLiked,
  }) async {
    if (isLiked) {
      await _like();
    } else {
      await _unlike();
    }
  }

  Future<void> _checkIsMovieLiked() async {
    try {
      final checkIsMovieLikedInteractor = ref.read(
        checkIsMovieLikedInteractorProvider,
      );

      final isLiked = await checkIsMovieLikedInteractor(movie);
      state = state.copyWith(isLiked: isLiked);
    } on AppException catch (e, s) {
      error('Error checking if movie is liked', e, s);
    }
  }

  Future<void> _like() async {
    state = state.copyWith(isLiked: true);

    info('Liking movie: ${movie.title}');

    try {
      final likeMovieInteractor = ref.read(likeMovieInteractorProvider);
      await likeMovieInteractor(movie);
    } on AppException catch (e, s) {
      state = state.copyWith(isLiked: false);

      warning('Error liking movie: ${movie.title}', e, s);
    }
  }

  Future<void> _unlike() async {
    state = state.copyWith(isLiked: false);

    info('Unliking movie: ${movie.title}');

    try {
      final unlikeMovieInteractor = ref.read(unlikeMovieInteractorProvider);
      await unlikeMovieInteractor(movie);
    } on AppException catch (e, s) {
      state = state.copyWith(isLiked: true);

      warning('Error unliking movie: ${movie.title}', e, s);
    }
  }
}
