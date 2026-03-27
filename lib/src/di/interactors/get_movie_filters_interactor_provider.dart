import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movie_preferences_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/get_movie_filters_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_filters_interactor_provider.g.dart';

@riverpod
GetMovieFiltersInteractor getMovieFiltersInteractor(Ref ref) {
  final moviePreferencesRepository = ref.watch(
    moviePreferencesRepositoryProvider,
  );

  return GetMovieFiltersInteractor(moviePreferencesRepository);
}
