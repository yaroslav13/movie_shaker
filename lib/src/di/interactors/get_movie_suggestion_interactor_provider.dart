import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movies_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/get_movie_suggestion_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_suggestion_interactor_provider.g.dart';

@riverpod
GetMovieSuggestionInteractor getMovieSuggestionInteractor(Ref ref) {
  final moviesRepository = ref.watch(
    moviesRepositoryProvider,
  );

  return GetMovieSuggestionInteractor(
    moviesRepository,
  );
}
