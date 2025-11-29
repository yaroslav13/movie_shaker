import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/entities/select_query/select_collection_query.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/infrastructure_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movie_collections_repository.dart';

final class SelectCollectionsContainingMovieInteractor
    implements Interactor<List<MovieCollection>, SelectCollectionQuery> {
  const SelectCollectionsContainingMovieInteractor(
    this._movieCollectionsRepository,
  );

  final MovieCollectionsRepository _movieCollectionsRepository;

  @override
  Future<List<MovieCollection>> call(SelectCollectionQuery param) async {
    try {
      final allCollections = param.collections;

      final matchingCollections = <MovieCollection>[];
      await Future.forEach(allCollections, (collection) async {
        final containsMovie = await _movieCollectionsRepository
            .doesCollectionContainMovie(collection, param.movieId);
        if (containsMovie) {
          matchingCollections.add(collection);
        }
      });

      return matchingCollections;
    } on InfrastructureException catch (e, s) {
      Error.throwWithStackTrace(SemanticException(e), s);
    }
  }
}
