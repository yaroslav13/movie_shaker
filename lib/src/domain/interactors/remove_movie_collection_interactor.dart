import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection_details/movie_collection_details.dart';
import 'package:movie_shaker/src/domain/exceptions/collection_modification_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/infrastructure_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movie_collections_repository.dart';

final class RemoveMovieCollectionInteractor
    implements Interactor<void, MovieCollectionDetails> {
  const RemoveMovieCollectionInteractor(this._movieCollectionsRepository);

  final MovieCollectionsRepository _movieCollectionsRepository;

  @override
  Future<void> call(MovieCollectionDetails params) async {
    try {
      final collection = MovieCollection(name: params.name);

      await _movieCollectionsRepository.removeMovieCollection(collection);
    } on InfrastructureException catch (e, s) {
      Error.throwWithStackTrace(CollectionRemovalException(e), s);
    }
  }
}
