import 'package:collection/collection.dart';
import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection_details/movie_collection_details.dart';
import 'package:movie_shaker/src/domain/repositories/movie_collections_repository.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

/// TODO(yhalivets): Optimize by not fetching all movies for each collection
final class GetMovieCollectionsInteractor
    implements NoArgumentInteractor<List<MovieCollectionDetails>> {
  const GetMovieCollectionsInteractor(
    this._movieCollectionsRepository,
    this._moviesRepository,
  );

  final MovieCollectionsRepository _movieCollectionsRepository;
  final MoviesRepository _moviesRepository;

  @override
  Future<List<MovieCollectionDetails>> call() async {
    final allCollections = await _movieCollectionsRepository
        .getMovieCollections();

    final collectionsWithoutFavorites = allCollections.whereNot((collection) {
      return collection == MovieCollection.favorites;
    }).toList();

    final movieCollectionDetailsList = <MovieCollectionDetails>[];
    await Future.forEach(collectionsWithoutFavorites, (collection) async {
      final movies = await _moviesRepository.getMoviesByCollection(
        collection,
      );

      final collectionDetails = MovieCollectionDetails(
        name: collection.name,
        movies: movies,
      );

      movieCollectionDetailsList.add(collectionDetails);
    });

    return movieCollectionDetailsList;
  }
}
