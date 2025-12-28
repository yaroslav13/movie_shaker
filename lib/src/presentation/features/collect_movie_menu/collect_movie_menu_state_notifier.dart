import 'dart:async';

import 'package:movie_shaker/src/di/domain_mappers/movie_from_details_mapper_provider.dart';
import 'package:movie_shaker/src/di/interactors/check_is_movie_liked_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/like_movie_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/unlike_movie_interactor_provider.dart';
import 'package:movie_shaker/src/domain/entities/movie_details/movie_details.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/presentation/features/collect_movie_menu/collect_movie_menu_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'collect_movie_menu_state_notifier.g.dart';

@riverpod
class CollectMovieMenuStateNotifier extends _$CollectMovieMenuStateNotifier {
  @override
  CollectMovieMenuState build({required MovieDetails movieDetails}) {
    final movieFromDetailsMapper = ref.read(
      movieFromDetailsMapperProvider,
    );

    return CollectMovieMenuState(
      correspondingMovie: movieFromDetailsMapper.map(movieDetails),
    );
  }

  void onStart() {
    unawaited(_checkIfMovieIsLiked());
  }

  Future<void> _checkIfMovieIsLiked() async {
    try {
      final checkIsMovieLikedInteractor = ref.read(
        checkIsMovieLikedInteractorProvider,
      );

      final isLiked = await checkIsMovieLikedInteractor(movieDetails.id);
      state = state.copyWith(isLiked: isLiked);
    } on SemanticException {
      ///TODO(yhalivets): Handle error
    }
  }

  void onLikeStateChanged({
    required bool isLiked,
  }) {
    if (isLiked) {
      unawaited(_like());
    } else {
      unawaited(_unlike());
    }
  }

  Future<void> _like() async {
    state = state.copyWith(isLiked: true);

    try {
      final likeMovieInteractor = ref.read(
        likeMovieInteractorProvider,
      );

      await likeMovieInteractor(state.correspondingMovie);
    } on SemanticException {
      state = state.copyWith(isLiked: false);
    }
  }

  Future<void> _unlike() async {
    state = state.copyWith(isLiked: false);

    try {
      final unlikeMovieInteractor = ref.read(
        unlikeMovieInteractorProvider,
      );

      await unlikeMovieInteractor(state.correspondingMovie);
    } on SemanticException {
      state = state.copyWith(isLiked: true);
    }
  }
}
