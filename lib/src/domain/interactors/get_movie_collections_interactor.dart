import 'package:collection/collection.dart';
import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/infrastructure_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movie_collections_repository.dart';

final class GetMovieCollectionsInteractor
    implements NoArgumentInteractor<List<MovieCollection>> {
  const GetMovieCollectionsInteractor(
    this._movieCollectionsRepository,
  );

  final MovieCollectionsRepository _movieCollectionsRepository;

  @override
  Future<List<MovieCollection>> call() async {
    try {
      final allCollections = await _movieCollectionsRepository
          .getMovieCollections();

      return allCollections.whereNot((collection) {
        return collection == MovieCollection.favorites;
      }).toList();
    } on InfrastructureException catch (e, s) {
      Error.throwWithStackTrace(SemanticException(e), s);
    }
  }
}
