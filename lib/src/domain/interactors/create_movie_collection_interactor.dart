import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection_details/movie_collection_details.dart';
import 'package:movie_shaker/src/domain/repositories/movie_collections_repository.dart';

final class CreateMovieCollectionInteractor
    implements Interactor<MovieCollectionDetails, MovieCollection> {
  const CreateMovieCollectionInteractor(this._movieCollectionsRepository);

  final MovieCollectionsRepository _movieCollectionsRepository;

  @override
  Future<MovieCollectionDetails> call(MovieCollection param) async {
    await _movieCollectionsRepository.addMovieCollection(param);

    return MovieCollectionDetails(name: param.name);
  }
}
