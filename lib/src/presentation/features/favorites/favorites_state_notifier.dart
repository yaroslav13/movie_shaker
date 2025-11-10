import 'dart:async';

import 'package:movie_shaker/src/di/interactors/get_liked_movies_interactor_provider.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/presentation/features/favorites/favorites_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_state_notifier.g.dart';

@riverpod
class FavoritesStateNotifier extends _$FavoritesStateNotifier {
  @override
  FavoritesState build() {
    return const FavoritesState.loading();
  }

  void onStart() {
    unawaited(_fetchFavoriteMovies());
  }

  Future<void> _fetchFavoriteMovies() async {
    try {
      final getLikedMoviesInteractor = ref.read(
        getLikedMoviesInteractorProvider,
      );
      final favoriteMovies = await getLikedMoviesInteractor();

      state = FavoritesState.data(favoriteMovies: favoriteMovies);
    } on AppException catch (e) {
      state = FavoritesState.error(e);
    }
  }
}
