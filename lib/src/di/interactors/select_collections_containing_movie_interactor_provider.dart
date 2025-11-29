import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movie_collections_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/select_collections_containing_movie_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_collections_containing_movie_interactor_provider.g.dart';

@riverpod
SelectCollectionsContainingMovieInteractor
selectCollectionsContainingMovieInteractor(
  Ref ref,
) {
  final movieCollectionsRepository = ref.watch(
    movieCollectionsRepositoryProvider,
  );

  return SelectCollectionsContainingMovieInteractor(
    movieCollectionsRepository,
  );
}
