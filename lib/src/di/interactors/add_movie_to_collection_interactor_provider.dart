import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movies_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/add_movie_to_collection_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_movie_to_collection_interactor_provider.g.dart';

@riverpod
AddMovieToCollectionInteractor addMovieToCollectionInteractor(Ref ref) {
  final moviesRepository = ref.watch(moviesRepositoryProvider);

  return AddMovieToCollectionInteractor(moviesRepository);
}
