import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';

abstract interface class MovieCollectionsRepository {
  Future<List<MovieCollection>> getMovieCollections();

  Future<void> addMovieCollection(MovieCollection collection);

  Future<bool> doesCollectionExist(MovieCollection collection);
}
