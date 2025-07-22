import 'dart:async';

import 'package:movie_shaker/src/di/interactors/get_movies_interactor_provider.dart';
import 'package:movie_shaker/src/presentation/features/home/home_state.dart';
import 'package:movie_shaker/src/utils/logger_mixin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_state_notifier.g.dart';

@riverpod
class HomeStateNotifier extends _$HomeStateNotifier with LoggerMixin {
  @override
  HomeState build() => const HomeState(isLoading: true);

  void onStart() {
    unawaited(_fetchMovies());
  }

  Future<void> _fetchMovies() async {
    try {
      info('Fetching movies...');

      final getMoviesInteractor = ref.read(getMoviesInteractorProvider);

      final movies = await getMoviesInteractor();
      state = state.copyWith(isLoading: false, movies: movies);
    } on Exception catch (e, s) {
      error('Error fetching movies:', e, s);

      state = state.copyWith(isLoading: false, hasError: true);
    }
  }
}
